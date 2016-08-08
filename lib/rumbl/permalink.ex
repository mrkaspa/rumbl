defmodule Rumbl.Permalink do
  @behaviour Ecto.Type

  def type, do: :id

  def cast(binary) do
    id =
      binary
      |> String.split("-")
      |> Enum.reverse
      |> hd
    if id do
      {integer, _} = Integer.parse(id)
      {:ok, integer}
    else
      :error
    end
  end

  def cast(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def cast(_) do
    :error
  end

  def dump(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def load(integer) when is_integer(integer) do
    {:ok, integer}
  end
end
