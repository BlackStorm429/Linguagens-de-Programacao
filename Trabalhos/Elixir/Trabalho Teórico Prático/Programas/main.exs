defmodule Basic do
  @a "Seminário sobre Elixir"

  @moduledoc """
    Comentários em Elixir podem ser feitos de três formas diferentes:
    # - (cerquilha) Para documentação em linha.
    @moduledoc - Para documentação em nível de módulo.
    @doc - Para documentação em nível de função.
  """

  @doc """
    Tipos básicos de Elixir
  """
  def basicTypes do
    # (iex)
    # Inteiro
    1
    # Elixir também suporta notações de atalho para inserir números binários, octais e hexadecimais:
    0b0110 # 6
    0o24   # 20
    0x1F   # 31

    # Real (Float)
    1.0

    # Elixir também suporta e para notação científica:
    1.0e-10 # 1 vezes 10 a -10 -> 1 x 10^-10

    # Boleano
    true
    false

    # Átomo (Seu valor é o mesmo que seu nome)
    :elixir

    # String
    "String"

    # Lista
    [1, 2, 3]

    # Tupla
    {1, 2, 3}
  end

  @doc """
    Operador Pin:
    Use o operador pin ^ quando desejar combinar padrões com
    o valor existente de uma variável em vez de declarar novamente a variável.
  """
  def pin do
    # (iex)
    x = 1
    ^x = 2 # MatchError
    [^x, 2, 3] = [1, 2, 3] # No error
  end

  @doc """
    O operador "=" é um operador de casamento de padrão.
  """
  def patternMatching() do
    v = false       # Faz com que v seja ligado a false, um valor booleano.
    w = true        # Faz com que w seja ligado a true, um valor booleano.
    x = 1           # Faz com que x seja ligado a 1, um número inteiro.
    y = 2.0         # Faz com que y seja ligado a 2.0, um número de ponto flutuante.
    z = 1..3        # Define z como sendo a sequência que começa em 1 e termina em 3. Logo, contém 1, 2 e 3.

    {a, b, c} = {:hello, "world", 42}
    # Faz com que a seja ligado a :hello, um átomo
    # Faz com que b seja ligado a "world", uma String
    # Faz com que c seja ligado a 42, um inteiro.


    IO.puts(x)
    IO.puts(y)
    IO.puts(x + y)  # Solicita a soma dos valores ligados a x e y.

    IO.puts(a)
    IO.puts(b)
    IO.puts(c)

    IO.puts("O porquê de = ser o operador de casamento de padrão: ")
    IO.puts(1 = x)
    IO.puts(2 = x)
  end

  @doc """
    Um átomo é uma constante cujo o nome é seu valor e é representado por : seguido de seu nome.
    Em Ruby, os átomos são equivalentes aos símbolos.
  """
  def atom do
    IO.puts(:elixir)
    IO.puts(true)
    IO.puts(is_atom(true))
    IO.puts(is_atom(:elixir))

    # (iex) :crypto.strong_rand_bytes 3
    # Átomos também são usados para referenciar módulos de bibliotecas Erlang, incluindo as bibliotecas integradas.
  end

  @doc """
    As strings em Elixir são codificadas em UTF-8 e são representadas com aspas duplas:
  """
  def string() do
    IO.puts("#{@a}") # Imprime na tela o atributo @a do módulo Basic
    x = "Hello"
    y = "WKO"
    IO.puts(x)
    IO.puts(y)

    # Concatenação de strings é feita com os símbolos <>
    IO.puts(x <> y)

    # A interpolação de strings em Elixir é muito parecida com Ruby.
    # É feita com o padrão #{variável}
    IO.puts("#{x} #{y}")
  end

  @doc """
    Expressão regular é criada com o padrão: ~r/expressao/ ou ~r{expressao}
  """
  def regex do
    # Regex.run procura e retorna a primeira correspondência da expressão regular.
    reVogais = ~r{[aeiou]}
    IO.puts(Regex.run reVogais, "abecedario")

    reVowels = ~r/[aeiou]/
    IO.puts(Regex.scan(reVowels, "abecedario"))
  end

  @doc """
    Elixir suporta os operadores básicos +, -, *, e / como era de se esperar.
    É importante ressaltar que / sempre retornará um número ponto flutuante:
  """
  def arithmetic() do
    a = 1 + 1
    b = 2 - 1
    c = 3 * 2
    # Na divisão real de dois inteiros, é realizdo o parse dos números inteiros para números reais.
    # Evitando possível erro ao rodar o programa
    d = 4 / 2
    IO.puts("Soma: #{a}\nSubtração: #{b}\nMultiplicação: #{c}\nDivisão Real: #{d}")

  end

  @doc """
    As Operações Boleanas em Elixir possuem como símbolos ||, && e !.
  """
  def booleansOp do
    # (iex)
    # Or
    true || false
    # And
    false && false
    # Negative
    !true
  end

  @doc """
    Elixir fornece ==, !=, ===, !==, <=, >=, < e > como operadores de comparação
  """
  def comparisonOp() do
    # (iex)
    1 == 1
    1 != 2
    2 <= 1
    3 >= 3
    # Compara valor e tipo
    1 === 1.0
    1.4 !== 1.4
    2.2 === 2.2
  end
end

defmodule Medium do
  @moduledoc """
    Explicação de Lista, Tupla, Mapa
  """

  @doc """
      As listas são simples coleções de valores que podem incluir múltiplos tipos; listas também podem incluir valores não-exclusivos:

      Elixir implementa listas como listas encadeadas.
      Acessar o tamanho da lista é uma operação que rodará em tempo linear (O(n)).
      É mais rápido inserir um elemento no início (prepending) do que no final (appending):
  """
  def list do
    # (iex)
    [3.14, :pie, "Apple"]

    list = [3.14, :pie, "Apple"]

    # Prepending (rápido)
    ["π" | list]
    # Appending (lento)
    list ++ ["Cherry"]

    # A concatenação de listas usa o operador ++/2.
    [1, 2] ++ [3, 4, 1]

    # O suporte para subtração é provido pelo operador --/2; é seguro subtrair um valor que não existe:
    ["foo", :bar, 42] -- [42, "bar"]

    # OBS.: A subtração de listas usa comparação estrita para match de valores:
    [2] -- [2.0]
    [2.0] -- [2.0]

    # Elixir provê duas funções bem úteis, hd e tl, para trabalhar com as partes de cabeça e calda:
    hd [3.14, :pie, "Apple"]
    tl [3.14, :pie, "Apple"]
    # Pode-se usar pattern matching e o operador cons (|) para dividir a lista em topo e cauda
    [head | tail] = [3.14, :pie, "Apple"]
    tail
  end

  @doc """
    As tuplas são similares às listas porém são armazenadas de maneira contígua em memória.
    Acessar seu tamanho é rápido, porém, sua alteração é custosa.
    A nova tupla deve ser armazenada inteira na memória.
    As tuplas são definidas com chaves, ao contrário de linguagens como Python,
    em que tuplas são definidas com parêntesis.
  """
  def tuple do
    # (iex)
    {3.14, :pie, "Apple"}
  end

  @doc """
    As listas de palavras-chave e os mapas são coleções associativas no Elixir.
    Uma lista de palavras-chave é uma lista especial de tuplas de dois elementos cujo o primeiro elemento é um átomo.
    E eles compartilham o desempenho das listas:
  """
  def keywordList do
    # (iex)
    [foo: "bar", hello: "world"]
    [{:foo, "bar"}, {:hello, "world"}]
  end

  @doc """
    Em Elixir, mapas normalmente são a escolha para armazenamento chave-valor.
    Os mapas permitem chaves de qualquer tipo e não seguem uma ordem, diferenciando das listas de palavras-chave
    Você pode definir um mapa com a sintaxe %{}:
  """
  def map do
    # (iex)
    map = %{:foo => "bar", "hello" => :world}
    map[:foo]
    map["hello"]

    # Elixir 1.2: Variáveis são permitidas como chaves do mapa:
    key = "hello"
    %{key => "world"}
    %{"hello" => "world"}

    # Se um elemento duplicado é inserido no mapa, este sobrescreverá o valor anterior;
    %{:foo => "bar", :foo => "hello world"} # Possui um warning sobre isso no interpretador.

    # Há uma sintaxe especial para os mapas que contém apenas átomos como chaves:
    %{foo: "bar", hello: "world"}
    %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}

    # Existe uma sintaxe especial para acessar átomos como chaves:
    map = %{foo: "bar", hello: "world"}
    map.hello

    # Mapas têm sua própria sintaxe para atualizar e acessar átomos como chaves:
    map = %{foo: "bar", hello: "world"}
    # Esta sintaxe funciona apenas para atualizar uma chave que já existe no mapa!
    # Caso contrário, um KeyError será gerado.
    %{map | foo: "baz"}

    # Para criar uma nova chave, use Map.put/3
    map = %{hello: "world"}
    Map.put(map, :foo, "baz")
  end

end

defmodule Advanced do
  @moduledoc """
    Estruturas de fluxo de controle: case, cond e if.
  """
  def conditions do
    # (iex)
    # Exemplo 1 - CASE
    case {1, 2, 3} do
      {4, 5, 6} ->
        "Esta cláusula não vai corresponder"
      {1, _x, 3} ->
        "Esta cláusula irá corresponder e vincular x a 2 nesta cláusula"
      _ ->
        "Esta cláusula corresponderia a qualquer valor"
    end

    # Exemplo 2 - CASE
    y = 1

    case 10 do
      ^y -> "Não irá corresponder"
      _ -> "Irá corresponder"
    end

    # Exemplo 3 - CASE

    case {1, 2, 3} do
      {1, x, 3} when x > 0 ->
        "Vai corresponder"
      _ ->
        "Não iria corresponder, se a condição de guarda não fosee satisfeita (x > 0)"
    end

    # Exemplo 1 - COND
    cond do
      2 + 2 == 5 ->
        "Isto não vai ser verdadeiro"
      2 * 2 == 3 ->
        "Nem isto"
      1 + 1 == 2 ->
        "Mas, isto vai"
    end

    # Exemplo 2 - COND
    cond do
      hd ([1, 2, 3]) ->
        "1 é considerado verdadeiro"
    end

    # Exemplo 1 - IF e UNLESS
    if true do
      "Isto funciona!"
    end

    unless true do
      "Isto nunca vai ser visto"
    end

    # Exemplo 2 - IF e ELSE
    x = 1
    x = if true do
      x + 1
    else
        x
    end

    # OBS.: Algo interessante sobre if/2 e except/2 é que eles são implementados
    # como macros na linguagem; eles não são construções especiais da linguagem
    # como seriam em muitas linguagens.

  end

  @moduledoc """
    Elixir fornece o conceito de enumeráveis ​​e o módulo Enum para trabalhar com eles.
    Listas e mapas são dois dos enumeráveis.

    O módulo Enum oferece uma grande variedade de funções
    para transformar, classificar, agrupar, filtrar e recuperar itens de enumeráveis.
    É um dos módulos que os desenvolvedores usam frequentemente em seu código Elixir.
  """
  def enum do
    # Para cada valor da lista, aplicar a função anônima (x * 2)
    # Ou seja, valor * 2
    # Resultado: [2, 3, 6]
    Enum.map([1, 2, 3], fn x -> x * 2 end)
    # Para cada valor do map, aplicar a função anônima (k * v)
    # Ou seja, chave * valor
    # Resultado: [2, 12]
    Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)

    # Elixir também oferece faixas:

    # Para cada valor inteiro da faixa 1..3, aplicar a função anônima (x * 2)
    # Ou seja, valor * 2
    # Resultado: [2, 3, 6]
    Enum.map(1..3, fn x -> x * 2 end)

    # Para cada valor inteiro da faixa 1..3, aplicar a função anônima (&) = (+/2)
    # Ou seja, ela recebe dois argumentos e realiza a soma deles, tendo como acumulador inicial o 0
    # Etapas:
    # 0 + 1 = 1
    # 1 + 2 = 3
    # 3 + 3 = 6
    # Resultado: 6
    Enum.reduce(1..3, 0, &+/2)
  end

  @moduledoc """
    O nome da Struct é o nome do módulo em que ela se encontra.
  """
  defmodule User do
    defstruct name: "John", age: 27

    def operations do
      # (iex)

      # Criar estruturas de User possui uma sintaxe similar àquela usada para criar mapas:
      %User{}
      %User{name: "Jane"}

      # As estruturas fornecem garantias em tempo de compilação de que
      # apenas os campos definidos por meio de defstruct poderão existir em uma estrutura:

      # IO.puts(%User{id: 13}) # KeyError

      # Acessar e atualizar os campos de uma estrutura é igual à realizar essas operação em um mapa.
      john = %User{}
      john.name
      jane = %{john | name: "Jane"}

      # Abaixo das estruturas há mapas simples com um conjunto fixo de campos.
      # Como mapas, as estruturas armazenam um campo “especial” chamado __struct__
      # que contém o nome da estrutura:
      is_map(john)
      john.__struct__
    end
  end

end

defmodule Errors do
  @attribute "Erro 1 - ArgumentError"

  def error1 do
    x = 1
    IO.puts(1 = x)
    # Erro 2 - MatchError
    IO.puts(2 = x)
  end
end


# Basic.basicTypes()
# Medium.list()
# Advanced.operations()
# Errors.patternMatching()
