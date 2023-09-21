defmodule ToleranciaFalhas do
  def run do
    # Tentativa de divisão por zero
    resultado = divisao_por_zero(10, 0)

    # Verifica se a divisão foi bem-sucedida
    case resultado do
      {:ok, resultado_divisao} ->
        IO.puts "Resultado da divisão: #{resultado_divisao}"
      _ ->
        IO.puts "Erro: Divisão por zero."
    end
  end

  defp divisao_por_zero(a, b) do
    try do
      if b == 0 do
        raise ArithmeticError, message: "Divisão por zero."
      else
        {:ok, a / b}
      end
    rescue
      _arithmetic_error ->
        {:error}
    end
  end
end

ToleranciaFalhas.run()
