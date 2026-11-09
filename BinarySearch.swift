import Foundation

// This program demonstrates binary search in a sorted array.
// It generates a random array, sorts it, and searches for a target value entered by the user.

// function to populate array with random integers
func populateArray(size: Int) -> [Int] {
    var array = [Int]()
    // loop passed amount of times
    for _ in 0..<size {
        // fill value to random integer
        array.append(Int.random(in: 0..<100))
    }
    return array
}

// function to perform binary search on a sorted array
func binarySearch(array: [Int], target : Int) -> Int {
    // Ensure the array is sorted for binary search
    let sortedArray = array.sorted()
    var left = 0
    var right = sortedArray.count - 1
    // continue searching while the left pointer is less than or equal to the right pointer
    while left <= right {
        // calculate the middle index
        let mid = left + (right - left) / 2
        // check if the middle element is the target
        if sortedArray[mid] == target {
            return mid
        } else if sortedArray[mid] < target {
            // move the left pointer to the right of mid
            left = mid + 1
        } else {
            // move the right pointer to the left of mid
            right = mid - 1
        }
    }
    return -1
}

// main function to run the program
func main() {
    // populate array with 10 random integers
    let array = populateArray(size: 10)
    // prompt user to enter the target value or 'q' to quit
    print("Enter the target value or 'q' to quit: ")
    // initialize variables for target value, flag, and user input
    var target = 0
    var flag = false
    var user = ""
    // continue prompting user until a valid target value is entered
    while flag == false {
        // read user input
        if let input = readLine() {
            // store user input
            user = input
            // check if user entered 'q' to quit
            if user == "q" {
                print("Exiting program.")
                return
            }
            // check if user entered a valid integer
            if let number = Int(user) {
                target = number
                flag = true
            } else {
                print("Invalid input. Please enter a valid integer or 'q' to quit: ")
            }
        }
    }
    // check if a valid target value was entered
    if flag == true {
        // perform binary search for the target value
        let result = binarySearch(array: array, target: target)
        // check if the target value was found
        if result == -1 {
            // print message if target value was not found
            print("Target value not found in the array.")
        } else {
            // print message if target value was found
            print("The number \(target) was found at index: \(result)")
        }
    }
}

main()