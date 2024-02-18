
package com.codebook.faculty;
import java.util.*;
public class randomNumber {
    
    
    public static String generateRandomAlphanumeric(int length) {
        Random random = new Random();
        StringBuilder result = new StringBuilder();

        // Define the characters that can be part of the alphanumeric element
        String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

        for (int i = 0; i < length; i++) {
            // Choose a random character from the characters string
            char randomChar = characters.charAt(random.nextInt(characters.length()));
            result.append(randomChar);
        }

        return result.toString();
    }
}
