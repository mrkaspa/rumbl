# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rumbl.Repo
alias Rumbl.{Category, User}

Repo.insert!(User.registration_changeset(%User{name: "demo", username: "demo", password: "jokalive"}))

for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Repo.insert!(Category.changeset(%Category{name: category}))
end
