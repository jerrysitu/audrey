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

# {:ok, geocode_response} = Audrey.API.GoogleMaps.get_geocode("210+carrall+street+vancouver+bc+canada")

# Audrey.API.GoogleMaps.get_geocode()

# {:ok, response} = Tesla.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=macdonalds&location=49.2828842,--123.1041375&radius=100000&key=AIzaSyBTQ0SFFJ8WHubDbBK-Anl_uEvz5UsnP5Q&fields=formatted_address&pagetoken=ATtYBwLSFakyzm7jagF66x28HABMCgUHgaNpu4CaQq-54wMGqYZMI4SJkkhR8dqzDC4RP8a4gxcY_cztNtoGXA_7EQyIzV89bFipFmr_Ha2cFxYPBXByiPzQOjQa4yKhO_zliBeQy_N7uhIMtC8-TM8p7bRa76RSu2NN3RKstxUMfRpE6GmQp5sX0I8vAxTbT_f2vh86cJ5-GkBeLhLsJvMCHwN7t4JuCk9IP1kbwLkqB1kpfrNc8pActR820R3HbBP0-QbYbwgAKRaStcOX_vZtskPNB4YorG2LQUB5b8ETDUylzIhj4CdLcR6nJyj_GBxVqqvOOO3fSzfxxCEnYL3a-buYL3xGUOK3ZZShD6bWJkAGaORdbo4vyz52LqrEJJ2wz-DrAVwYVX_od5Ox1rnd_cevB1dpq2de6aypfN5mr5dVplAjlpY7Ik1dOfRe68pST_z_m58SbLFrvQ0HEYyWdVu2bz-tRYcMrgFfdP81VgNoPeWafcFUzJkAnRgUj80k1D93OfIaFciPpDNogDT3T0lIfuTcnTeEhytjRP2q1NpfaSaGDzkPxD_8NAce3tTLEt_319h9h4bcNVq55R-_yFIwyIDAPoCX")

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
