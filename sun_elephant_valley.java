//imports
import java.io.*;
import java.util.*;
import java.awt.*;
import java.net.*;

public class SeeTheWorld {
    public static void main(String[] args) {
        //first create an array list of all of the countries in the world
        ArrayList<String> countries = new ArrayList<String>();
        countries.add("United States");
        countries.add("China");
        countries.add("United Kingdom");
        countries.add("France");
        countries.add("Germany");
        countries.add("India");
        countries.add("Italy");
        countries.add("Japan");
        countries.add("Russia");
        countries.add("Brazil");
        countries.add("Spain");
        countries.add("Canada");
        countries.add("Australia");
        countries.add("Mexico");
        countries.add("South Africa");

        //now loop through all of the countries and show some information
        for (String country : countries) {
            //determine the url for the country
            String url = "http://www.wikipedia.org/wiki/" + country.replace(" ", "_");

            //print out the country name
            System.out.println("Country: " + country);

            //now let's try to access it
            try {
                //setup a url connection
                URLConnection conn = new URL(url).openConnection();

                //read the response from the page
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                String content = "";
                while ((inputLine = in.readLine()) != null) {
                    content += inputLine;
                }

                //find the description
                int start = content.indexOf("<p>");
                int end = content.indexOf("</p>");
                String desc = content.substring(start+3,end);
                System.out.println("Description: " + desc);
            }
            catch (Exception e) {
                System.out.println("Error: Could not retrieve data for " + country);
            }
            System.out.println("---------------------------------");
        }
    }
}