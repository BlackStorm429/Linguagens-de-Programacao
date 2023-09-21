defmodule Calculadora do
  def area_do_quadrado(lado) do
    area = lado * lado
    IO.puts("A área do quadrado com lado #{lado} é #{area}")
  end
end

Calculadora.area_do_quadrado(5)
