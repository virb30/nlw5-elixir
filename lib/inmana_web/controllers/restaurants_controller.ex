defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end

  def update(conn, %{"id" => uuid, "email" => email, "name" => name}) do
    params = %{email: email, name: name}

    with {:ok, %Restaurant{} = restaurant} <- Inmana.update_restaurant(uuid, params) do
      conn
      |> put_status(:ok)
      |> render("update.json", restaurant: restaurant)
    end
  end
end
