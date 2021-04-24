defmodule Inmana.SupplyTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.{Restaurant, Supply}

  describe "changeset/1" do
    test "when all params are valid, returns a changeset" do
      {:ok, %Restaurant{id: restaurant_id}} =
        Inmana.create_restaurant(%{name: "Siri Cascudo", email: "siri@cascudo.com"})

      params = %{
        restaurant_id: restaurant_id,
        description: "Hamburguer de Siri",
        expiration_date: "2021-04-20",
        responsible: "Bob Sponja"
      }

      response = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 restaurant_id: _restaurant_id,
                 description: "Hamburguer de Siri",
                 expiration_date: _date,
                 responsible: "Bob Sponja"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{description: "Só"}

      expected_response = %{
        description: ["should be at least 3 character(s)"],
        expiration_date: ["can't be blank"],
        responsible: ["can't be blank"],
        restaurant_id: ["can't be blank"]
      }

      response = Supply.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
