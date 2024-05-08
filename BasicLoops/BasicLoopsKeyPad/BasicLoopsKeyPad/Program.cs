bool locked = true;

while (locked)
{
    Console.Write("Inpit code: ");
    string userInput = Console.ReadLine();

    if (userInput == "13579")
    {
        locked = false;
        Console.WriteLine("Unlocked!");
    }
    else
    {
        Console.WriteLine("BEEP BEEP. Try again!");
    }
}



///////////// Continued add-on with 5 tries



bool lockedTwo = true; 
int attemptStart = 0;
int attemptEnd = 5;

while (lockedTwo && attemptStart < attemptEnd)
{
    Console.Write("Inpit code: ");
    string userInput = Console.ReadLine();

    if (userInput == "13579")
    {
        lockedTwo = false; 
        Console.WriteLine("Unlocked!");
    }
    else
    {
        attemptStart++;
        if (attemptStart < attemptEnd)
        {
            Console.WriteLine($"Wrong code. {attemptEnd - attemptStart} attempts remaining. Retry.");
        }
        else
        {
            Console.WriteLine("To many wrong attempts. Locked still.");
        }
    }
}
