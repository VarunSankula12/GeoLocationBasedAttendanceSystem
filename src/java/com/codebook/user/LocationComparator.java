
package com.codebook.user;

import java.util.Scanner;

public class LocationComparator {
    
      public static boolean areLocationsWithinThreshold(double lat1, double lon1, double lat2, double lon2, double threshold) {
        // Haversine formula to calculate distance
        double R = 6371000; // Radius of Earth in meters

        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        double distance = R * c;

        // Check if the distance is within the threshold
        return distance <= threshold;
    }
    
}
