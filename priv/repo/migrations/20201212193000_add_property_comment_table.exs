defmodule Audrey.Repo.Migrations.AddPropertyCommentTable do
  use Ecto.Migration

  def change do
    create table(:property_comments) do
      add :property_id, :integer
      add :comment, :text

      timestamps()
    end
  end
end
