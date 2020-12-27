defmodule Audrey.Repo.Migrations.AddAmenitiesToPropertiesTable do
  use Ecto.Migration

  def change do
    alter table(:properties) do
      add_if_not_exists :wifi, :boolean, default: false
      add_if_not_exists :bathtub, :boolean, default: false
      add_if_not_exists :shower, :boolean, default: false
      add_if_not_exists :ethernet_connection, :boolean, default: false
      add_if_not_exists :heating, :boolean, default: false
      add_if_not_exists :air_conditioning, :boolean, default: false
      add_if_not_exists :smoke_alarms, :boolean, default: false
      add_if_not_exists :oven, :boolean, default: false
      add_if_not_exists :stove, :boolean, default: false
      add_if_not_exists :microwave, :boolean, default: false
      add_if_not_exists :dish_washer, :boolean, default: false
      add_if_not_exists :refrigerator, :boolean, default: false
      add_if_not_exists :washing_machine, :boolean, default: false
      add_if_not_exists :clothes_dryer, :boolean, default: false
      add_if_not_exists :patio_or_balcony, :boolean, default: false
      add_if_not_exists :backyard, :boolean, default: false
      add_if_not_exists :parking_spot, :boolean, default: false
      add_if_not_exists :pets_allowed, :boolean, default: false
      add_if_not_exists :gym, :boolean, default: false
      add_if_not_exists :pool, :boolean, default: false
      add_if_not_exists :square_footage, :integer, default: 0
      add_if_not_exists :bedrooms, :integer, default: 0
      add_if_not_exists :washrooms, :integer, default: 0
    end
  end
end
