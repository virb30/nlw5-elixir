defmodule Inmana do
  alias Inmana.Restaurants.Create, as: RestaurantCreate

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
end
