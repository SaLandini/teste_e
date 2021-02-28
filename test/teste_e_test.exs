defmodule TESTE_ETest do
  use ExUnit.Case
  doctest TESTE_E

  test "greets the world" do
    assert TESTE_E.hello() == :world
  end
end
