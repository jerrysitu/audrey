defmodule Audrey.Repo.Migrations.AddLikesCountToPropertyCommentsTable do
  use Ecto.Migration

  def change do
    alter table(:property_comments) do
      add_if_not_exists :likes, :integer, default: 0
    end
  end
end
