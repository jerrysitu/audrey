defmodule Audrey.API.GoogleMaps do
  use Tesla

  def get_geocode(address) do
    api_key = "AIzaSyBTQ0SFFJ8WHubDbBK-Anl_uEvz5UsnP5Q"

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

# Audrey.API.GoogleMaps.get_geocode()
