defmodule TecnoWeb.Auth.Guardian do
  use Guardian, otp_app: :tecno

  alias Tecno.Accounts

  # def for_token(users = %Users{}), do: {:ok, "Users:#{users.id}"}
  # def for_token(_), do: {:error, "Unknown resource type"}
  # def from_token("Users:" <> id), do: {:ok, Repo.get(Users, String.to_integer(id))}
  # def from_token(_), do: {:error, "Unknown resource type"}
  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get_user!(id)
    {:ok, resource}
  end

  def authenticate(email, password) do
    IO.inspect(email)

    with {:ok, user} <- Accounts.get_by_email(email) do
      case validate_password(password, user.encrypted_password) do
        true ->
          create_token(user)

        false ->
          {:error, :unauthorized}
      end
    end
  end

  defp validate_password(password, encrypted_password) do
    Comeonin.Bcrypt.checkpw(password, encrypted_password)
  end

  defp create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, user, token}
  end
end
