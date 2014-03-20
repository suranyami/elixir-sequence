defmodule Sequence.Supervisor do
  use Supervisor.Behaviour

  def start_link(initial_number) do
    result = {:ok, sup} = :supervisor.start_link(__MODULE__, [initial_number])
    start_workers(sup, initial_number)
    result
  end

  def start_workers(sup, initial_number) do
    {:ok, stash} = :supervisor.start_child(sup, worker(Sequence.Stash, [initial_number]))
    :supervisor.start_child(sup, supervisor(Sequence.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise([], strategy: :one_for_one)
  end
end
