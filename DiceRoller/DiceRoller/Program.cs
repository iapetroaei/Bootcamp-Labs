Console.WriteLine("Welcome to the Grand Circus Casino!");

Console.Write("How many sides should each die have? ");

string numSides = Console.ReadLine();
int sides = int.Parse(numSides);
bool again;

do
{
int roll1 = RandomNumber(sides);
int roll2 = RandomNumber(sides);

Console.WriteLine($"\nYou rolled a {roll1} and a {roll2} ({roll1 + roll2} total)");

string specialCase = SpecialCases(roll1, roll2);

if (specialCase != "")
{
    Console.WriteLine(specialCase);
}

Console.Write("\nRoll again? (y/n): ");
again = Console.ReadLine().ToLower() == "y";

} while (again);


static int RandomNumber(int sides)
{
Random random = new Random();
return random.Next(1, sides + 1);
}

static string SpecialCases(int roll1, int roll2)
{
    if (roll1 == 1 && roll2 == 1)
    {
        return "Snake Eyes";
    }
    else if ((roll1 == 1 && roll2 == 2) || (roll1 == 2 && roll2 == 1))
    {
        return "Ace Deuce";
    }
    else if (roll1 == 6 && roll2 == 6)
    {
        return "Box Cars";
    }
    else if ((roll1 + roll2 == 7) || (roll1 + roll2 == 11))
    {
        return "WIN";
    }
    else if ((roll1 + roll2 == 2) || (roll1 + roll2 == 3) || (roll1 + roll2 == 12))
    {
        return "Craps";
    }
    else
    {
        return "";
    }
}

Console.WriteLine("Thanks for paying!");