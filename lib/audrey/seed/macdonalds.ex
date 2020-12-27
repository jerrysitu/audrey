defmodule Audrey.Seed.MacDonalds do
  def run do
    properties = [
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.271917,
        longitude: -123.1007164,
        street_address: "1527 Main St",
        zip: "V6A 2W5",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2808074,
        longitude: -123.1072714,
        street_address: "86 W Pender St Unit 1001",
        zip: "V6B 6N8",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2788171,
        longitude: -123.1154121,
        street_address: "275 Robson St #211",
        zip: "V6B 0E7",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.263406,
        longitude: -123.1162947,
        street_address: "537 W Broadway",
        zip: "V5Z 1E6",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2805624,
        longitude: -123.1214172,
        street_address: "891 Granville St",
        zip: "V6Z 1K7",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.285158,
        longitude: -123.064021,
        street_address: "1965 Powell St",
        zip: "V5L 1J2",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2617124,
        longitude: -123.069504,
        street_address: "2570 Commercial Dr",
        zip: "V5N 4C1",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2906798,
        longitude: -123.1338321,
        street_address: "1701 Robson St",
        zip: "V6G 1C9",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2852274,
        longitude: -123.1389977,
        street_address: "1610 Davie St",
        zip: "V6G 1V9",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2452368,
        longitude: -123.1015565,
        street_address: "4445 Main St",
        zip: "V5V 3R2",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2633952,
        longitude: -123.1380276,
        street_address: "1482 W Broadway",
        zip: "V6H 1H4",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.26842449999999,
        longitude: -123.1594542,
        street_address: "2391 W 4th Ave",
        zip: "V6K 1P2",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.280857,
        longitude: -123.0305412,
        street_address: "3444 E Hastings St",
        zip: "V5K 2A6",
        user_type: "landlord"
      },
      %{
        city: "North Vancouver",
        country: "Canada",
        latitude: 49.31038419999999,
        longitude: -123.0835735,
        street_address: "157 Chadwick Ct",
        zip: "V7M 3K2",
        user_type: "landlord"
      },
      %{
        city: "North Vancouver",
        country: "Canada",
        latitude: 49.3068,
        longitude: -123.0365613,
        street_address: "1366 Main St",
        zip: "V7J 1C6",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2641035,
        longitude: -123.1780584,
        street_address: "3308 W Broadway",
        zip: "V6R 2B2",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2330972,
        longitude: -123.0657903,
        street_address: "5661 Victoria Dr",
        zip: "V5P 3W2",
        user_type: "landlord"
      },
      %{
        city: "West Vancouver",
        country: "Canada",
        latitude: 49.3265262,
        longitude: -123.1396712,
        street_address: "808 Marine Dr",
        zip: "V7T 1A1",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.24516269999999,
        longitude: -123.0641714,
        street_address: "2021 Kingsway",
        zip: "V5N 2T2",
        user_type: "landlord"
      },
      %{
        city: "North Vancouver",
        country: "Canada",
        latitude: 49.3236204,
        longitude: -123.1080351,
        street_address: "1219 Marine Dr",
        zip: "V7P 1T3",
        user_type: "landlord"
      },
      %{
        city: "North Vancouver",
        country: "Canada",
        latitude: 49.3274377,
        longitude: -123.0725152,
        street_address: "2001 Lonsdale Ave",
        zip: "V7M 2K4",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2586899,
        longitude: -123.0435922,
        street_address: "2909 Grandview Hwy",
        zip: "V5M 2E4",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2183357,
        longitude: -123.0773755,
        street_address: "7289 Knight St",
        zip: "V5P 2W9",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2348083,
        longitude: -123.1547561,
        street_address: "2095 W 41st Ave",
        zip: "V6M 1Y7",
        user_type: "landlord"
      },
      %{
        city: "Burnaby",
        country: "Canada",
        latitude: 49.2602993,
        longitude: -123.0055038,
        street_address: "4410 Still Creek Dr",
        zip: "V5C 6C6",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2119042,
        longitude: -123.1091738,
        street_address: "160 SW Marine Dr",
        zip: "V5X 2R1",
        user_type: "landlord"
      },
      %{
        city: "Burnaby",
        country: "Canada",
        latitude: 49.2812271,
        longitude: -122.9943909,
        street_address: "4801 E Hastings St",
        zip: "V5C 2L1",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2659375,
        longitude: -123.0243593,
        street_address: "3695 Lougheed Highway",
        zip: "V5M 2A6",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2060654,
        longitude: -123.125516,
        street_address: "830 SW Marine Dr",
        zip: "V6P 5Y8",
        user_type: "landlord"
      },
      %{
        city: "Burnaby",
        country: "Canada",
        latitude: 49.2273362,
        longitude: -122.9997347,
        street_address: "4700 Kingsway #1160",
        zip: "V5H 4M1",
        user_type: "landlord"
      },
      %{
        city: "North Vancouver",
        country: "Canada",
        latitude: 49.332955,
        longitude: -123.0884783,
        street_address: "2601 Westview Dr C600",
        zip: "V7M 3X3",
        user_type: "landlord"
      },
      %{
        city: "Richmond",
        country: "Canada",
        latitude: 49.1843522,
        longitude: -123.1052421,
        street_address: "10700 Cambie Rd #115",
        zip: "V6K 1K8",
        user_type: "landlord"
      },
      %{
        city: "Richmond",
        country: "Canada",
        latitude: 49.1925713,
        longitude: -123.0822254,
        street_address: "2760 Sweden Way",
        zip: "V6V 2X1",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2666467,
        longitude: -123.2425376,
        street_address: "5728 University Blvd #101",
        zip: "V6T 1K6",
        user_type: "landlord"
      },
      %{
        city: "Richmond",
        country: "Canada",
        latitude: 49.17759,
        longitude: -123.1335939,
        street_address: "8191 Alderbridge Way",
        zip: "V6X 3A9",
        user_type: "landlord"
      },
      %{
        city: "Richmond",
        country: "Canada",
        latitude: 49.16163290000001,
        longitude: -123.135891,
        street_address: "7120 No. 3 Rd",
        zip: "V6Y 2C6",
        user_type: "landlord"
      },
      %{
        city: "New Westminster",
        country: "Canada",
        latitude: 49.21226979999999,
        longitude: -122.9188127,
        street_address: "515 6th St",
        zip: "V3L 5H1",
        user_type: "landlord"
      },
      %{
        city: "Richmond",
        country: "Canada",
        latitude: 49.1798502,
        longitude: -123.1523072,
        street_address: "6086 Russ Baker Way #6020",
        zip: "V7B 1B4",
        user_type: "landlord"
      },
      %{
        city: "North Vancouver",
        country: "Canada",
        latitude: 49.3359792,
        longitude: -123.0406698,
        street_address: "1200 Lynn Valley Rd #100",
        zip: "V7J 2A2",
        user_type: "landlord"
      },
      %{
        city: "Coquitlam",
        country: "Canada",
        latitude: 49.260819,
        longitude: -122.8917409,
        street_address: "531 Clarke Rd",
        zip: "V3J 3X4",
        user_type: "landlord"
      },
      %{
        city: "Coquitlam",
        country: "Canada",
        latitude: 49.250131,
        longitude: -122.89233,
        street_address: "515 North Rd",
        zip: "V3J 1N7",
        user_type: "landlord"
      },
      %{
        city: "Richmond",
        country: "Canada",
        latitude: 49.1775416,
        longitude: -123.1201467,
        street_address: "9251 Alderbridge Way",
        zip: "V6N 0N1",
        user_type: "landlord"
      },
      %{
        city: "Richmond",
        country: "Canada",
        latitude: 49.1537398,
        longitude: -123.1585457,
        street_address: "8140 No 2 Rd",
        zip: "V7C 5J9",
        user_type: "landlord"
      },
      %{
        city: "New Westminster",
        country: "Canada",
        latitude: 49.2230522,
        longitude: -122.9122049,
        street_address: "815 McBride Blvd",
        zip: "V3L 2B9",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2815063,
        longitude: -123.0785401,
        street_address: "1225 E Hastings St",
        zip: "V6A 1S4",
        user_type: "landlord"
      },
      %{
        city: "Burnaby",
        country: "Canada",
        latitude: 49.200717,
        longitude: -122.981084,
        street_address: "7360 Market Crossing",
        zip: "V5J 0A2",
        user_type: "landlord"
      },
      %{
        city: "Surrey",
        country: "Canada",
        latitude: 49.17692630000001,
        longitude: -122.864595,
        street_address: "12930 96 Ave",
        zip: "V3V 6A8",
        user_type: "landlord"
      },
      %{
        city: "Delta",
        country: "Canada",
        latitude: 49.1702331,
        longitude: -122.9547915,
        street_address: "1285 Cliveden Ave",
        zip: "V3M 6C7",
        user_type: "landlord"
      },
      %{
        city: "Surrey",
        country: "Canada",
        latitude: 49.1593451,
        longitude: -122.8898443,
        street_address: "8586 120 St",
        zip: "V3W 3N5",
        user_type: "landlord"
      },
      %{
        city: "Surrey",
        country: "Canada",
        latitude: 49.1887165,
        longitude: -122.8447734,
        street_address: "10240 King George Blvd",
        zip: "V3T 2W5",
        user_type: "landlord"
      },
      %{
        city: "Surrey",
        country: "Canada",
        latitude: 49.202777,
        longitude: -122.8795251,
        street_address: "11011 Scott Rd",
        zip: "V3V 8B9",
        user_type: "landlord"
      },
      %{
        city: "Port Moody",
        country: "Canada",
        latitude: 49.2763765,
        longitude: -122.8429713,
        street_address: "3033 St Johns St",
        zip: "V3H 2C4",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2638581,
        longitude: -123.1678399,
        street_address: "2798 W Broadway",
        zip: "V6K 2G4",
        user_type: "landlord"
      },
      %{
        city: "Vancouver",
        country: "Canada",
        latitude: 49.2653903,
        longitude: -123.1080836,
        street_address: "148 W 6th Ave 2nd Floor",
        zip: "V5Y 1K6",
        user_type: "landlord"
      },
      %{
        city: "Coquitlam",
        country: "Canada",
        latitude: 49.24933919999999,
        longitude: -122.8601534,
        street_address: "1131 Austin Ave",
        zip: "V3K 3P5",
        user_type: "landlord"
      },
      %{
        city: "Ladner",
        country: "Canada",
        latitude: 49.0898518,
        longitude: -123.0635131,
        street_address: "5776 Ladner Trunk Rd",
        zip: "V4K 1X6",
        user_type: "landlord"
      },
      %{
        city: "New York",
        country: "United States",
        latitude: 40.777901,
        longitude: -73.982472,
        street_address: "2049 Broadway",
        zip: "10023",
        user_type: "landlord"
      }
    ]

    properties
    |> Enum.each(fn x ->
      address = "#{x.street_address}+#{x.city}+#{"BC"}+#{x.zip}+#{x.country}"
      {:ok, geocode_response} = Audrey.API.GoogleMaps.get_geocode(address)

      IO.inspect(geocode_response, label: "geocode_response!!!")

      Audrey.GoogleMaps.parse_geo_code_response(geocode_response)
      |> Map.put(:user_type, "landlord")
      |> Map.put(:wifi, true)
      |> Map.put(:heating, true)
      |> Map.put(:air_conditioning, true)
      |> Map.put(:smoke_alarms, true)
      |> Map.put(:oven, true)
      |> Map.put(:stove, true)
      |> Map.put(:refrigerator, true)
      |> Map.put(:dish_washer, true)
      |> Map.put(:microwave, true)
      |> Map.put(:washrooms, 2)
      |> Map.put(:square_footage, Enum.random(1000..2000))
      |> Audrey.Location.create_property()
    end)
  end
end

# Audrey.Seed.MacDonalds.run
