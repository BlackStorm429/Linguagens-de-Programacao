defmodule DesafioCifraCesar do
  def encode_char(char, shift) do
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    char_lowercase = String.downcase(char)

    case String.next_codepoint(char_lowercase) do
      {^char, _, <<0>>} when char in ?a..?z ->
        alphabet_size = String.length(alphabet)
        current_index = char - ?a
        new_index = rem(current_index + shift, alphabet_size)
        new_char = <<new_index + ?a::utf8>>
        if char == char_lowercase do
          String.upcase(String.at(new_char, 0))
        else
          String.at(new_char, 0)
        end
      _ ->
        char
    end
  end

  def encode_phrase(phrase, shift) do
    phrase
    |> String.codepoints()
    |> Enum.map(&encode_char(&1, shift))
    |> Enum.join()
  end
end

shift_amount = 3  # O deslocamento desejado

IO.puts "Tente usar a cifra de César com um deslocamento de #{shift_amount} para decifrar a seguinte frase codificada:"
IO.puts "Sdudéqwp, má srgh suxpsodwp hq Holwub!"

encoded_phrase = DesafioCifraCesar.encode_phrase("Sdudéqwp, má srgh suxpsodwp hq Holwub!", shift_amount)

IO.puts "\nDica: A frase original é em português e contém uma mensagem relacionada ao seminário!"

IO.puts "\nFrase codificada: #{encoded_phrase}"
