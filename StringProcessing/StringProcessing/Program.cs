//Console.WriteLine("Please enter your statement below: " + "\n");

//string userInput = Console.ReadLine();

//Console.WriteLine($"You have entered \"{userInput}\"!");


bool continueProgram = true; // A boolean variable to control the loop, initially set to true to start the loop.

while (continueProgram) // A while loop that runs as long as continueProgram is true.
{
    Console.WriteLine("Enter a sentence:"); // Prompting the user to enter a sentence.
    string userInput = Console.ReadLine(); // Reading the user input from the console.

    // Splitting the user input into words. The split is based on spaces. 
    // StringSplitOptions.RemoveEmptyEntries ensures that no empty entries are included in the result.
    string[] splitInput = userInput.Split(" ");

    // Iterating through the array of words.
    foreach (string word in splitInput)
    {
        Console.WriteLine(word); // Printing each word on a new line.
    }

    // Asking the user if they would like to continue.
    Console.WriteLine("Would you like to continue (y/n)?");
    string continueResponse = Console.ReadLine(); // Reading the user's response.

    // Checking if the user's response is not "y" (in any case).
    if (continueResponse.ToLower() != "y")
    {
        continueProgram = false; // Setting continueProgram to false to exit the loop.
        Console.WriteLine("Goodbye!"); // Printing a goodbye message.
    }
}

