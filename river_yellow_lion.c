#include <stdio.h>
#include <math.h>
#include <string.h>

int main()
{
	//Declare Variables
    int numCountries;
    char countries[200][50];
    int i, x, j;
    int count;
    double totalCost;
    double cost[200][2];
    double cheapest;
	
	//Ask the user how many countries they would like to visit
    printf("How many countries would you like to visit?\n");
    scanf("%d", &numCountries);
	
	//Input the countries
    printf("Enter the name of the countries you would like to visit:\n");
    for(i = 0; i < numCountries; i++)
    {
        scanf("%s", countries[i]);
    }

	//Create an array to store costs for each country
    printf("Enter the cost of traveling to each country:\n");
    for(x = 0; x < numCountries; x++)
    {
        scanf("%lf", &cost[x][0]);
    }
	
	//Calculate the total cost
    totalCost = 0;
    for(j = 0; j < numCountries; j++)
    {
        totalCost += cost[j][0];
    }
	
	//Determine the cheapest country to visit
    count = 0;
    cheapest = cost[0][0];
    for(i = 0; i < numCountries; i++)
    {
        if(cost[i][0] < cheapest)
        {
            cheapest = cost[i][0];
            count++;
        }
    }
	
    printf("You will need $%.2lf to visit %d countries.\n", totalCost, numCountries);
    printf("The cheapest country to visit is %s.\n", countries[count]);
	
	//Return 0
    return 0;
}