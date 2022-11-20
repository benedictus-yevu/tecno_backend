defmodule TecnoWeb.UserController do
  use TecnoWeb, :controller
  alias Tecno.Schemaless.UserPlan
  alias Tecno.Accounts
  alias Tecno.Accounts.User
  alias Tecno.Multimedia
  alias Tecno.Repo

  def index(conn, _params) do
    accounts = Accounts.list_users()
    users = for {key, value} <- accounts, into: %{}, do: {key, value}

    # IO.inspect(users, label: "users")
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Tecno.Schemaless.UserPlan.changeset(%UserPlan{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_plan" => user_plan}) do
    %{"email" => email, "password" => password, "plan_name" => plan_name} = user_plan

    case Multimedia.fetch_plan(plan_name) do
      [plan] ->
        success =
          plan |> Ecto.build_assoc(:users) |> User.changeset(%{email: email, password: password})

        case Repo.insert(success) do
          {:ok, user} ->
            conn
            |> put_flash(:info, "User created successfully")
            |> redirect(to: Routes.user_path(conn, :show, user))

          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "new.html", changeset: changeset)
        end

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  # def delete(conn, %{"id" => id}) do
  #   user = Accounts.get_user!(id)
  #   {:ok, _user} = Accounts.delete_user(user)

  #   conn
  #   |> put_flash(:info, "User deleted successfully.")
  #   |> redirect(to: Routes.user_path(conn, :index))
  # end
end
