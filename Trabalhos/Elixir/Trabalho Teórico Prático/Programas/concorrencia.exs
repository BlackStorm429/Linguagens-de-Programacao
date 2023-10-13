defmodule Concorrencia do
  def run do
    _pid1 = spawn(fn -> IO.puts "Processo 1: Olá, mundo!" end)
    _pid2 = spawn(fn -> IO.puts "Processo 2: Oi, mundo!" end)

    Process.sleep(1000)
  end
end

Concorrencia.run()


defmodule Processo do
  @moduledoc """
    A forma mais fácil para criar um novo processo é o spawn,
    que pode receber tanto uma função nomeada quanto anônima.

    Quando criamos um novo processo ele retorna um Process Identifier ou PID,
    para exclusivamente identificá-lo dentro de nossa aplicação.
  """
  def add(a, b) do
    IO.puts(a + b)
  end
end

Processo.add(2, 3)
spawn(Processo, :add, [2, 3])


defmodule MessagePassing do
  @moduledoc """
  Para comunicar-se, os processos dependem de passagem de mensagens.
  Há dois componentes principais para isso: send/2 e receive.

  A função send/2 nos permite enviar mensagens para PIDs.
  Para recebê-las, usamos a função receive com pattern matching para selecionar as mensagens.
  Se nenhum padrão coincidir com a mensagem recebida, a execução continua ininterrupta.
  """

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
    end

    listen()
  end
end

pid = spawn(MessagePassing, :listen, [])
send pid, {:ok, "hello"}
send pid, {:err, "hell"}
send pid, :ok



# -
# Exemplo simples sobre Passagem de mensagem
# -

# self() retorna o PID do processo que está rodando atualmente,
# e que receberá a mensagem:
restaurante = self()

# Envia a mensagem {:pedido, "pizza"} para o processo que está rodando em restaurante
send restaurante, {:pedido, "pizza"}

# Recebe a mensagem, interpreta e responde
# caso a mensagem corresponda ao padrão {:pedido, item}
receive do
    {:pedido, item} -> IO.puts "Cozinhando: #{item}"
end
