# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tecno.Repo.insert!(%Tecno.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# alias Tecno.Multimedia.Plan
alias Tecno.Multimedia

for plan <- ~w(Basic Gold) do
  Multimedia.create_plan(%{plan_name: plan})
end
