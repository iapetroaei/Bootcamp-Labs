
bool locked = true; 
int attemptStart = 0;
int attemptEnd = 5;

do
{
    Console.Write("Inpit code: ");
    string userInput = Console.ReadLine();

    if (userInput == "13579")
    {
        locked = false; 
        Console.WriteLine("Unlocked!");
        break; 
    }
    else
    {
        attemptStart++;
        if (attemptStart < attemptEnd)
        {
            Console.WriteLine($"Wrong key code. {attemptEnd -  attemptStart} attempts remaining. Retry.");
        }
        else
        {
            Console.WriteLine("To many wrong attempts. Locked still.");
        }
    }
} while (locked && attemptStart < attemptEnd);
