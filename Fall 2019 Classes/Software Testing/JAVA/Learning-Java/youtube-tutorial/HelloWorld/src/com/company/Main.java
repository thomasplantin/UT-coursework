package com.company;


import java.util.Arrays;

public class Main {

    String[] theArray;
    int arraySize;
    int itemsInArray = 0;

    public static void main(String[] args) {
        Main theFunc = new Main(8);
        String[] elementsToAdd = {"4322", "1334", "1471", "9679", "1989", "6171", "6173", "499"};
        theFunc.hashFunction1(elementsToAdd, theFunc.theArray);
        theFunc.findKey("9679");

    }

    public void hashFunction1(String[] stringsForArray, String[] theArray) {
        for(int i=0; i<stringsForArray.length; i++) {
            String newElementVal = stringsForArray[i];
            int arrayIndex = Integer.parseInt(newElementVal) % 7;
            System.out.println("Modulus Index = " + Integer.toString(arrayIndex) + " for value " + newElementVal);
            while(theArray[arrayIndex] != "-1") {
                arrayIndex++;
                System.out.println("Collision Try " + arrayIndex + " Instead");
                // If we get to the end of the array go back to index 0
                arrayIndex %= arraySize;

            }
            theArray[arrayIndex] = newElementVal;
        }

    }

    public String findKey(String key) {
        int arrayIndexHash = Integer.parseInt(key) % 7;

        while(theArray[arrayIndexHash] != "-1") {

            if(theArray[arrayIndexHash] == key) {
                // Found the key so return it
                System.out.println(key + " was found in index " + arrayIndexHash);
                return theArray[arrayIndexHash];
            }
            // Look in the next index
            arrayIndexHash++;
            // If we get to the end of the array go back to index 0
            arrayIndexHash %= arraySize;
        }

        return null;
    }

    Main(int size) {

        arraySize = size;

        theArray = new String[size];

        Arrays.fill(theArray, "-1");

    }

}
