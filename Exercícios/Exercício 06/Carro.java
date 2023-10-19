public class Carro
{
    // Propriedades da entidade Carro
    private String marca;
    private String modelo;
    private int ano;
    private double preco;

    // Construtor para inicializar as propriedades
    public Carro (String marca, String modelo, int ano, double preco)
    {
        this.marca = marca;
        this.modelo = modelo;
        this.ano = ano;
        this.preco = preco;
    }

    // Método para exibir informações do carro
    public void exibir ()
    {
        System.out.println ("Marca: " + marca);
        System.out.println ("Modelo: " + modelo);
        System.out.println ("Ano: " + ano);
        System.out.printf ("Preço: R$%.2f%n", preco);
    }

    public static void main (String [] args)
    {
        // Exemplo de uso da classe Carro
        Carro carro = new Carro ("Volkswagen", "Nivus", 2023, 129190.0);
        carro.exibir ();
    }
}
