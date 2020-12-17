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
      add :administrative_area_level_2, :string
      add :administrative_area_level_2_short, :string
      add :administrative_area_level_1, :string
      add :administrative_area_level_1_short, :string
      add :country, :string
      add :country_short, :string
      add :postal_code, :string
      add :postal_code_short, :string
      add :longitude, :float
      add :latitude, :float
      add :user_type, :string

      timestamps()
    end
  end
end
