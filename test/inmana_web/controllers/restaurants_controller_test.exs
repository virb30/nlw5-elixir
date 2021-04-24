defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  alias Inmana.Restaurant

  describe "create/2" do
    test "when all params are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com",
                 "id" => _id,
                 "name" => "Siri cascudo"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "siri@cascudo.com"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "update/3" do
    test "when all params are valid, updates the restaurant", %{conn: conn} do
      {:ok, %Restaurant{id: restaurant_id}} =
        Inmana.create_restaurant(%{name: "Siri cascudo", email: "siri@cascudo.com"})

      params = %{name: "Siri cascudo", email: "siri2@cascudo.com"}

      response =
        conn
        |> put(Routes.restaurants_path(conn, :update, restaurant_id, params))
        |> json_response(:ok)

      assert %{
               "message" => "Restaurant updated!",
               "restaurant" => %{
                 "email" => "siri2@cascudo.com",
                 "id" => _id,
                 "name" => "Siri cascudo"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      {:ok, %Restaurant{id: restaurant_id}} =
        Inmana.create_restaurant(%{name: "Siri cascudo", email: "siri@cascudo.com"})

      params = %{name: "S", email: "siri2-cascudo.com"}

      expected_response = %{
        "message" => %{
          "email" => ["has invalid format"],
          "name" => ["should be at least 2 character(s)"]
        }
      }

      response =
        conn
        |> put(Routes.restaurants_path(conn, :update, restaurant_id, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
