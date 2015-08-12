defmodule Asterism.Location do
  require Record
  alias Asterism.Location

  @typed :location
  @fields [
    type:       @typed,
    id:         nil,
    created_at: nil,
    updated_at: nil,
    data:       nil,
  ]

  Record.defrecord @typed, @fields
  defstruct @fields

  def fields, do: @fields

  defp listify(record) do
    apply(__MODULE__, @typed, [record])
  end

  def to_struct(record) when record |> is_tuple do
    [{:__struct__, __MODULE__.__struct__} | listify(record)]
    |> Enum.into(%{})
  end

  def to_record(%Location{} = struct) do
    fields
    |> Map.keys
    |> Enum.map(fn key -> Map.get(struct, key) end)
    |> List.insert_at(0, @typed)
    |> List.to_tuple
  end

end



