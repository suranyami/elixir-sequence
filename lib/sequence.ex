defmodule Sequence do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, inital_number) do
    Sequence.Supervisor.start_link(inital_number)
  end
end
