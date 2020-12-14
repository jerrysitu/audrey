defmodule Audrey.Repo.Migrations.AddPropertiesTable do
  use Ecto.Migration

  def change do
    create table(:properties) do
      add :street_address, :string
      add :apartment, :string
      add :city, :string
      add :state, :string
      add :country, :string
      add :zip, :string
      add :longitude, :float
      add :latitude, :float
      # TODO Move this out into own table
      add :user_type, :string

      timestamps()
    end
  end
end
