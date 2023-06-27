Module modSeeTheWorld
    Sub Main()

        Console.Title = "See The World"

        Dim numberOfCountries As Integer = 0
        Dim europeanCountries() As String = {"Germany", "France", "Spain", "Italy", "Czech Republic"}
        Dim asianCountries() As String = {"Thailand", "China", "India", "Malaysia", "Indonesia"}
        Dim africanCountries() As String = {"Nigeria", "Egypt", "South Africa", "Algeria", "Kenya"}
        Dim americanCountries() As String = {"United States", "Brazil", "Argentina", "Canada", "Mexico"}
        Dim australianCountries() As String = {"Australia", "New Zealand", "Fiji", "Cook Islands", "Papua New Guinea"}

        numberOfCountries = europeanCountries.Length + asianCountries.Length + africanCountries.Length + americanCountries.Length + australianCountries.Length

        Console.WriteLine("Total Number of Countries in the World: " & numberOfCountries)

        ' Write all countries from Europe
        Console.WriteLine("European Countries:")
        For i As Integer = 0 To europeanCountries.Length - 1
            Console.WriteLine("     " & europeanCountries(i))
        Next

        ' Write all countries from Asia
        Console.WriteLine("Asian Countries:")
        For i As Integer = 0 To asianCountries.Length - 1
            Console.WriteLine("     " & asianCountries(i))
        Next

        ' Write all countries from Africa
        Console.WriteLine("African Countries:")
        For i As Integer = 0 To africanCountries.Length - 1
            Console.WriteLine("     " & africanCountries(i))
        Next

        ' Write all countries from America
        Console.WriteLine("American Countries:")
        For i As Integer = 0 To americanCountries.Length - 1
            Console.WriteLine("     " & americanCountries(i))
        Next

        ' Write all countries from Australia
        Console.WriteLine("Australian Countries:")
        For i As Integer = 0 To australianCountries.Length - 1
            Console.WriteLine("     " & australianCountries(i))
        Next

        Console.WriteLine("Press any key to exit..")
        Console.ReadKey()

    End Sub
End Module