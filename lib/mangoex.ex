defmodule Mangoex do
  use Application

  def start(_type, _args) do
    Mangoex.Client.start_link
  end
end
