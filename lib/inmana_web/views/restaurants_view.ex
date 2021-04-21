defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :controller

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end
