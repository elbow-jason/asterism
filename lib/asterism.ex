defmodule Asterism do
  require Record
  alias Asterism.Entity
  alias Asterism.Event
  alias Asterism.Edge
  alias Asterism.Characteristic
  alias Asterism.Location

  def init do
    :mnesia.create_table :location,       attributes: Map.keys(Location.__struct__)
    :mnesia.create_table :entity,         attributes: Map.keys(Entity.__struct__)
    :mnesia.create_table :characteristic, attributes: Map.keys(Characteristic.__struct__)
    :mnesia.create_table :event,          attributes: Map.keys(Event.__struct__)
    :mnesia.create_table :edge,           attributes: Map.keys(Edge.__struct__)
  end

  def start do
    :mnesia.start
    init
  end

  def info do
    :mnesia.info
  end

  def save(%Location{id: id, type: type} = loc) do

  end
end
