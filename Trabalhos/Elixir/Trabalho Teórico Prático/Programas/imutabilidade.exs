defmodule Imutabilidade do
  def run do
    lista = [1, 2, 3, 4]

    # Tentando alterar a lista
    # (Não é possível devido à imutabilidade)

    _lista_atualizada = [5 | lista]
    IO.inspect(lista) # Imprime a lista original

    # Sobrescrevendo a lista (único jeito de modificá-la)
    _lista = [0 | lista]
    # IO.inspect(lista) # Imprime a lista sobrescrita
  end
end

Imutabilidade.run()
