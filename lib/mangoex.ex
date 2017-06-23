defmodule Mangoex do
  @moduledoc false
  use Application

  def start(_type, _args) do
    Mangoex.Client.start_link
  end
end
