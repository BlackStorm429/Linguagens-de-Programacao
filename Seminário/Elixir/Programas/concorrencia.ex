defmodule Concorrencia do
  def run do
    _pid1 = spawn(fn -> IO.puts "Processo 1: Olá, mundo!" end)
    _pid2 = spawn(fn -> IO.puts "Processo 2: Oi, mundo!" end)

    Process.sleep(1000)
  end
end

Concorrencia.run()
