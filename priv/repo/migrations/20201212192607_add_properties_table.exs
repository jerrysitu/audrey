defmodule Audrey.Repo.Migrations.AddPropertiesTable do
  use Ecto.Migration

  def change do
    create table(:properties) do
      add :apartment, :string
      add :street_number, :string
      add :street_number_short, :string
      add :route, :string
      add :route_short, :string
      add :neighborhood, :string
      add :neighborhood_short, :string
      add :locality, :string
      add :locality_short, :string
      add :administrative_area_level_1, :string
      add :administrative_area_level_1_short, :string
      add :administrative_area_level_2, :string
      add :administrative_area_level_2_short, :string
      add :administrative_area_level_3, :string
      add :administrative_area_level_3_short, :string
      add :administrative_area_level_4, :string
      add :administrative_area_level_4_short, :string
      add :administrative_area_level_5, :string
      add :administrative_area_level_5_short, :string
      add :country, :string
      add :country_short, :string
      add :postal_code, :string
      add :postal_code_short, :string
      add :longitude, :float
      add :latitude, :float
      add :user_type, :string
      add :google_maps_place_id, :string
      add :postal_code_suffix, :string
      add :postal_code_suffix_short, :string
      add :sublocality, :string
      add :sublocality_short, :string

      timestamps()
    end

    create unique_index(:properties, [:google_maps_place_id])
  end
end
