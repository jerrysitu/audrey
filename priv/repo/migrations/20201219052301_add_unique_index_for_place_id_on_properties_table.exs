defmodule Audrey.Repo.Migrations.AddUniqueIndexForPlaceIdOnPropertiesTable do
  use Ecto.Migration

  def change do
    create unique_index(:properties, [:google_maps_place_id])
  end
end
