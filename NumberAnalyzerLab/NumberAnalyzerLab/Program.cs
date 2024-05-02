Console.WriteLine("Welcome to the simulator user, to start please input a whole number between 1 and 100.\n");

string numberString = Console.ReadLine();

int number = int.Parse(numberString);

Console.WriteLine($"\nThank you for inputting {numberString}!\n");

if ( number % 2 != 0 && number < 60 )
{
    Console.WriteLine($"{number} is odd and less than 60.");
}
else if (number % 2 != 1 && number >= 2 && number <=24 )
{
    Console.WriteLine($"{number} is even and less than 25.");
}
else if (number % 2 != 1 && number >= 26 && number <= 60)
{
    Console.WriteLine($"{number} is even and between 26 and 60 inclusive.");
}
else if(number % 2 != 1 && number > 60)
{
    Console.WriteLine($"{number} is even and greater than 60.");
}
else if (number % 2 != 0 && number > 60)
{
    Console.WriteLine($"{number} is odd and greater than 60.");
}