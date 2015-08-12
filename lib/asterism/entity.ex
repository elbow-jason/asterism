defmodule Asterism.Entity do
  require Record
  alias Asterism.Entity

  @typed :entity
  @fields [
    type:       @typed,
    id:         nil,
    data:       [],
    created_at: nil,
    updated_at: nil,
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

  def to_record(%Entity{} = struct) do
    fields
    |> Map.keys
    |> Enum.map(fn key -> Map.get(struct, key) end)
    |> List.insert_at(0, @typed)
    |> List.to_tuple
  end


end
