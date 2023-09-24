defmodule DesafioCifraCesar do
  def encode_char(char, shift) when is_bitstring(char) do
    case char do
      <<c::utf8>> when c in 97..122 ->  # Lowercase letters (a..z)
        shift_char(c, shift, 97)
      <<c::utf8>> when c in 65..90 ->   # Uppercase letters (A..Z)
        shift_char(c, shift, 65)
      _ ->
        char
    end
  end

  defp shift_char(char, shift, base) do
    alphabet_size = 26
    current_index = char - base
    new_index = rem(current_index + shift, alphabet_size)
    new_char = <<new_index + base::utf8>>
    new_char
  end

  def encode_phrase(phrase, shift) when is_binary(phrase) do
    phrase
    |> String.graphemes()
    |> Enum.map(&encode_char(&1, shift))
    |> Enum.join()
  end
end

shift_amount = 3 # O deslocamento desejado.
cipher_phrase = "Sdudeéqv, má srgh surjudpdu hp Holalu!"

IO.puts "Tente usar a cifra de César com um deslocamento de #{shift_amount} para decodificar a seguinte frase codificada:"
IO.puts "#{cipher_phrase}"

decoded_phrase = DesafioCifraCesar.encode_phrase(cipher_phrase, -shift_amount) # Para decodificar, utilize um descolamento negativo

IO.puts "\nDica: A frase original está em português e contém uma mensagem relacionada ao seminário!"
IO.puts "\nFrase decodificada: #{decoded_phrase}"
