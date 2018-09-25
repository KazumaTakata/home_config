defmodule WeatherRequest do
  @moduledoc """
  Documentation for KV.
  """

  @doc """
  Hello world.

  ## Examples

      iex> KV.hello
      :world

  """
  def currentWeatherQuery(cityname) do
    HTTPoison.start()

    api_key = System.get_env("weather_apikey")

    data =
      HTTPoison.get!(
        "http://api.openweathermap.org/data/2.5/weather?q=#{cityname}&APPID=#{api_key}"
      )

    parsed = Poison.decode!(data.body)
    weather = Enum.at(parsed["weather"], 0)["main"]
    weather
  end
end
