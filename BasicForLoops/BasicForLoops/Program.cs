bool continueLoop = true; // Initialize continueLoop to true to enter the loop at least once

        while (continueLoop)
        {
            Console.Write("Enter a number: ");
            int number = int.Parse(Console.ReadLine());

            // Calculate the sum of all numbers from 1 to the entered number using just a for loop
            int sum = 0;
            for (int i = 1; i <= number; i++)
            {
                sum += i;
            }

            Console.WriteLine($"The sum of all numbers from 1 to {number} is: {sum}");

            Console.Write("Would you like to continue (y/n)? ");
            string input = Console.ReadLine().ToLower();
            continueLoop = input == "y"; // Update continueLoop based on user input
        }

        Console.WriteLine("Goodbye!");
