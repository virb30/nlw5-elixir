defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :controller

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end

  def render("update.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant updated!",
      restaurant: restaurant
    }
  end
end
