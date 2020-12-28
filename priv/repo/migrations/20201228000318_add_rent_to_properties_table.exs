defmodule Audrey.Repo.Migrations.AddRentToPropertiesTable do
  use Ecto.Migration

  def change do
    alter table(:properties) do
      add_if_not_exists :monthly_rent, :integer, default: nil
      add_if_not_exists :furnished, :boolean, default: false
      add_if_not_exists :smoking, :boolean, default: false
      add_if_not_exists :ev_charging, :boolean, default: false
      add_if_not_exists :dogs_ok, :boolean, default: false
      add_if_not_exists :cats_ok, :boolean, default: false
      add_if_not_exists :wheelchair_accessible, :boolean, default: false
      add_if_not_exists :sale_or_rent, :string, default: nil
      add_if_not_exists :laundry_type, :string, default: nil
      add_if_not_exists :parking, :string, default: nil
      add_if_not_exists :property_type, :string, default: nil
      add_if_not_exists :air_conditioning_type, :string, default: nil
      add_if_not_exists :heating_type, :string, default: nil
      remove :washing_machine, :boolean, default: false
      remove :clothes_dryer, :boolean, default: false
      remove :heating, :boolean, default: false
      remove :air_conditioning, :boolean, default: false
      remove :parking_spot, :boolean, default: false
      remove :pets_allowed, :boolean, default: false
    end
  end
end
