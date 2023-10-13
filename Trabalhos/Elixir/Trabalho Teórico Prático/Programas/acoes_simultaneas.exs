task1 = Task.async(fn -> IO.puts("Esta é uma ação simultânea!") end)
task2 = Task.async(fn -> IO.puts("Outra ação simultânea!") end)

# Aguarda a conclusão das tarefas
Task.await(task1)
Task.await(task2)
