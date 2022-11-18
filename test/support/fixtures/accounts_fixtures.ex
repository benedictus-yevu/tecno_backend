defmodule Tecno.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tecno.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email"
      })
      |> Tecno.Accounts.create_user()

    user
  end
end
