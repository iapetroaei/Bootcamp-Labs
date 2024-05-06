
Console.WriteLine("Before we start, please enter your name.\n");

string userName = Console.ReadLine();

Console.WriteLine($"\nWelcome to the simulator {userName}. To start please input a positive whole number between 1 and 100.\n");

string numberString = Console.ReadLine();

int number;

if (int.TryParse(numberString, out number))
{
    Console.WriteLine($"\nThank you for inputting {numberString}!\n");

    string choice = "y";

    do
    {
        if (number >= 1 && number <= 100)
        {


            if (number % 2 == 1 && number < 60)
            {
                Console.WriteLine($"{number} is odd and less than 60.");
            }
            else if (number % 2 == 0 && number >= 2 && number <= 24)
            {
                Console.WriteLine($"{number} is even and less than 25.");
            }
            else if (number % 2 == 0 && number >= 26 && number <= 60)
            {
                Console.WriteLine($"{number} is even and between 26 and 60 inclusive.");
            }
            else if (number % 2 == 0 && number > 60)
            {
                Console.WriteLine($"{number} is even and greater than 60.");
            }
            else if (number % 2 == 1 && number > 60)
            {
                Console.WriteLine($"{number} is odd and greater than 60.");
            }

            Console.Write("\nWould you like to continue (y/n)? \n");

            choice = Console.ReadLine().ToLower();

            Console.WriteLine();

        }
        else
        {
            Console.Write("Number outside of the parameters of being whole integer between 1 to 100 or is negative.");
            break;
        }
    } while (choice == "y");
    }
    else
    {
        Console.Write("Number outside of the parameters of being whole integer between 1 to 100 or is negative.");
    }



    
