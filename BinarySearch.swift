import Foundation

// This program demonstrates binary search in a sorted array.
// It generates a random array, sorts it, and searches for a target value entered by the user.

// function to populate array with random integers
func populateArray(size: Int) -> [Int] {
    var array = [Int]()
    for _ in 0..<size {
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
    while left <= right {
        let mid = left + (right - left) / 2
        if sortedArray[mid] == target {
            return mid
        } else if sortedArray[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}

// main function to run the program
func main() {
    let array = populateArray(size: 10)
    print("Enter the target value or 'q' to quit: ")
    var target = 0
    var flag = false
    var user = ""
    while flag == false {
        if let input = readLine() {
            user = input
            if user == "q" {
                print("Exiting program.")
                return
            }
            if let number = Int(user) {
                target = number
                flag = true
            } else {
                print("Invalid input. Please enter a valid integer or 'q' to quit: ")
            }
        }
    }
    if flag == true {
        let result = binarySearch(array: array, target: target)
        if result == -1 {
            print("Target value not found in the array.")
        } else {
            print("The number \(target) was found at index: \(result)")
        }
    }
}

main()