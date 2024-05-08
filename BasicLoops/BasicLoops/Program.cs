string response;

do
{
    Console.WriteLine("Hello World!");
    Console.WriteLine("Would you like to continue y/n?");
    response = Console.ReadLine().ToLower();
    Console.WriteLine();
}
while (response == "y");
Console.WriteLine("Goodbye!");


///////////////////////////////Add on to previous code to do the scale up and down of numbers


string responseTwo;

do
{

    Console.Write("Enter a number: ");
    int number = int.Parse(Console.ReadLine());

    for (int i = number; i >= 0; i--)
    {
        Console.Write(i + " ");
    }
    Console.WriteLine();

    for (int i = 0; i <= number; i++)
    {
        Console.Write(i + " ");
    }
    Console.WriteLine();
    Console.WriteLine("Would you like to continue y/n?");
    responseTwo = Console.ReadLine().ToLower();
    Console.WriteLine();
}
while (responseTwo == "y");
Console.WriteLine("Goodbye!");


