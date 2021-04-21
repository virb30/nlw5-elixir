defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  # Método 1
  # def call(uuid) do
  #   Supply
  #   |> Repo.get(uuid)
  #   |> handle_get()
  # end

  # defp handle_get(%Supply{} = result), do: result
  # defp handle_get(nil), do: {:error, %{result: "Supply not found", status: :not_found}}

  # Método 2
  def call(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end
end
