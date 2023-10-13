defmodule Calculadora do
  def area_do_trapezio(base_maior, base_menor, altura) do
    area = (base_maior + base_menor) * altura / 2.0
    IO.puts("A área do trapézio com base maior #{base_maior}, base menor #{base_menor} e altura #{altura} é #{area}")
  end
end

Calculadora.area_do_trapezio(5.0, 3.0, 4.0)
