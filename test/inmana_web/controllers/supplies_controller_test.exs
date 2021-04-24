defmodule InmanaWeb.SuppliesControllerTest do
  use InmanaWeb.ConnCase, async: true

  alias Inmana.{Restaurant, Supply}

  describe "create/2" do
    test "when all params are valid, creates the supply", %{conn: conn} do
      {:ok, %Restaurant{id: restaurant_id}} =
        Inmana.create_restaurant(%{name: "Siri cascudo", email: "siri@cascudo.com"})

      params = %{
        description: "Molho de tomate",
        expiration_date: "2021-04-20",
        responsible: "Irmão Urso",
        restaurant_id: restaurant_id
      }

      response =
        conn
        |> post(Routes.supplies_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Supply created!",
               "supply" => %{
                 "description" => "Molho de tomate",
                 "expiration_date" => "2021-04-20",
                 "id" => _id,
                 "responsible" => "Irmão Urso",
                 "restaurant_id" => _restaurant_id
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        description: "Molho de tomate",
        expiration_date: "",
        responsible: ""
      }

      expected_response = %{
        "message" => %{
          "expiration_date" => ["can't be blank"],
          "responsible" => ["can't be blank"],
          "restaurant_id" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.supplies_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "show/2" do
    test "shows supply data", %{conn: conn} do
      {:ok, %Restaurant{id: restaurant_id}} =
        Inmana.create_restaurant(%{name: "Siri cascudo", email: "siri@cascudo.com"})

      params = %{
        description: "Molho de tomate",
        expiration_date: "2021-04-20",
        responsible: "Irmão Urso",
        restaurant_id: restaurant_id
      }

      {:ok, %Supply{id: id}} = Inmana.create_supply(params)

      response =
        conn
        |> get(Routes.supplies_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "supply" => %{
                 "description" => "Molho de tomate",
                 "expiration_date" => "2021-04-20",
                 "id" => _id,
                 "responsible" => "Irmão Urso",
                 "restaurant_id" => _restaurant_id
               }
             } = response
    end
  end
end
