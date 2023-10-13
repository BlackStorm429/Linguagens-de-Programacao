defmodule Math do
  def sum(a, b) do
    a + b
  end
end

result = Math.sum(3, 4)
IO.puts("O resultado da soma é: #{result}")
