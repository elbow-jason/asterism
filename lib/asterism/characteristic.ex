defmodule Asterism.Characteristic do
  require Record
  alias Asterism.Characteristic

  @typed :characteristic
  @fields [
    type:         @typed,
    id:           nil,
    data:         nil,
    created_at:   nil,
    updated_at:   nil,
  ]
  Record.defrecord :characteristic, @fields
  defstruct @fields

  def fields, do: @fields

  defp listify(record) do
    apply(__MODULE__, @typed, [record])
  end

  def to_struct(record) when record |> is_tuple do
    [{:__struct__, __MODULE__.__struct__} | listify(record)]
    |> Enum.into(%{})
  end

  def to_record(%Characteristic{} = struct) do
    fields
    |> Map.keys
    |> Enum.map(fn key -> Map.get(struct, key) end)
    |> List.insert_at(0, @typed)
    |> List.to_tuple
  end

end
