defmodule Inmana.Restaurants.Update do
  alias Inmana.{Repo, Restaurant}

  def call(uuid, params) do
    Repo.get!(Restaurant, uuid)
    |> Restaurant.change(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Restaurant{}} = result), do: result
  defp handle_update({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
