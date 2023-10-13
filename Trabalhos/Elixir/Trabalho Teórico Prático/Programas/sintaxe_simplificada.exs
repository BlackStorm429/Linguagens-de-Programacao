defmodule HelloWorld do
  def greet(name) do
    IO.puts "Olá, #{name}!"
  end
end

HelloWorld.greet("Mundo")
