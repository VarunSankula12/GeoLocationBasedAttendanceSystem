
package com.codebook.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

public class LocationDetector {

    /*
    public static String getPublicIPAddress() throws IOException {
        URL url = new URL("https://api64.ipify.org?format=json");
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()))) {
            String line;
            StringBuilder response = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            return response.toString().split("\"ip\":\"")[1].split("\"")[0];
        }
    }

    public static Location getLocation(String ipAddress) throws IOException {
    URL url = new URL("https://ipinfo.io/" + ipAddress + "/json");
    try (BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()))) {
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }

        JSONObject json = new JSONObject(response.toString());

        // Extract latitude and longitude
        String loc = json.optString("loc", "");
        String[] coords = loc.split(",");
        
        if (coords.length >= 2) {
            double latitude = Double.parseDouble(coords[0]);
            double longitude = Double.parseDouble(coords[1]);
            return new Location(latitude, longitude);
        } else {
            throw new IOException("Invalid response format");
        }
    }
    }

    public static class Location {
    public double latitude;
    public double longitude;

    public Location(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }
}*/
    
   /* public static String getPublicIP() throws IOException {
        URL whatismyip = new URL("http://checkip.amazonaws.com");
        try (BufferedReader in = new BufferedReader(new InputStreamReader(whatismyip.openStream()))) {
            return in.readLine();
        }
    }

    // Get the location information based on IP address
    public static String getLocation(String ip) throws IOException {
        URL url = new URL("https://ipapi.co/" + ip + "/json/");
        try (BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()))) {
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            return response.toString();
        }
    }*/
    
    
    
  

    public static void main(String[] args) {
        try {
            location();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void location() throws IOException {
        String apiKey = "AIzaSyCK0T9gA3_pLhLoihh-CjwI17Me9eDFitI";
        String apiUrl = "https://www.googleapis.com/geolocation/v1/geolocate?key=" + apiKey;

        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        try {
            // Send a POST request with an empty JSON object
            String postData = "{}";
            connection.getOutputStream().write(postData.getBytes("UTF-8"));

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // Read the response
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    String line;
                    StringBuilder response = new StringBuilder();
                    while ((line = reader.readLine()) != null) {
                        response.append(line);
                    }

                    System.out.println(response.toString());
                }
            } else {
                System.err.println("HTTP error code: " + responseCode);
            }
        } finally {
            connection.disconnect();
        }
    }
}


