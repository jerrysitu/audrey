defmodule Audrey.API.GoogleMaps do
  use Tesla

  def get_geocode(address) do
    api_key = System.get_env("AUDREY_APP_BACKEND_GOOGLE_API_KEY", "")

    query =
      %{
        address: address,
        key: api_key
      }
      |> URI.encode_query()

    {:ok, response} = Tesla.get(client(), "json?#{query}")
  end

  defp client() do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://maps.googleapis.com/maps/api/geocode"},
      Tesla.Middleware.JSON
      # {Tesla.Middleware.Retry,
      #  delay: 500,
      #  max_retries: 10,
      #  max_delay: 4_000,
      #  should_retry: fn
      #    {:ok, %{status: status}} when status in [400, 500, 503] ->
      #      IO.inspect("Expandi Token, retrying this is true, status = #{status}")
      #      true

      #    {:ok, _} ->
      #      false

      #    {:error, _} ->
      #      true
      #  end}
    ]

    Tesla.client(middleware)
  end
end

# {:ok, geocode_response} = Audrey.API.GoogleMaps.get_geocode("210+carrall+street+vancouver+bc+canada")

# Audrey.API.GoogleMaps.get_geocode()

# response.body |> Jason.decode!() |> Map.get("results") |> Enum.map(fn x ->
#   %{
#     address: x |> Map.get("formatted_address"),
#     lat: x |> get_in(["geometry", "location", "lat"]),
#     lng: x |> get_in(["geometry", "location", "lng"])
#   }
# end)

# "1608+Parmer Ln+Austin+TX+78753+United States" |> Audrey.API.GoogleMaps.get_geocode()

# "5 Rue du 16éme Chasseurs, 21200 Beaune, France" |> String.replace(" ", "+") |> String.replace(",", "") |> Audrey.API.GoogleMaps.get_geocode()

# "123 fake street, burnaby, bc canada" |> String.replace(" ", "+") |> String.replace(",", "") |> Audrey.API.GoogleMaps.get_geocode()

# "2049 Broadway, New York, America" |> String.replace(" ", "+") |> String.replace(",", "") |> Audrey.API.GoogleMaps.get_geocode()
