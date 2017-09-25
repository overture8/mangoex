defmodule Mangoex do
  @moduledoc false
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([worker(Mangoex.Client, [])],
      strategy: :one_for_one,
      name: Mangoex.Supervisor)
  end
end
