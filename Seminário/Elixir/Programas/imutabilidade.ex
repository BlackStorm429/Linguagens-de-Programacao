defmodule Imutabilidade do
  def run do
    lista = [1, 2, 3, 4]

    # Tentando modificar a lista (o que não é possível devido à imutabilidade)
    lista = [5 | lista]

    IO.inspect(lista) # Isso imprime a lista original
  end
end

Imutabilidade.run()
