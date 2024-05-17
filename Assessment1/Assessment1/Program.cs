static bool IsPassing(double grade)
{
    if (grade <= 65)
    { 
        return false; 
    }
    else return true;
}

Console.WriteLine(IsPassing(65));
Console.WriteLine(IsPassing(66));


static double AverageGrades(double grade1, double grade2, double grade3)
{
    return ( grade1 + grade2 + grade3) / 3 ;
}

Console.WriteLine(AverageGrades(66, 65, 75));



static string OddOrEvenAndPassing(double grade4)
{
    int convertGrade = Convert.ToInt32(grade4);

    if (IsPassing(convertGrade) == true && convertGrade % 2 == 1)
    {
        return "\nPassing and odd";
    }
    else if (IsPassing(convertGrade) == true && convertGrade % 2 == 0)
    {
        return "\nPassing and even";
    }
    else if (IsPassing(convertGrade) == false  && convertGrade % 2 == 0)
    {
        return "\nFailing and even";
    }
    else
    {
        return "\nFailing and odd";
    }
}



Console.WriteLine(OddOrEvenAndPassing(63));
Console.WriteLine(OddOrEvenAndPassing(64));
Console.WriteLine(OddOrEvenAndPassing(68));
Console.WriteLine(OddOrEvenAndPassing(67));