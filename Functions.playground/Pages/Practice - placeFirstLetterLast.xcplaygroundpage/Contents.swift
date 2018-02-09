//: [Previous](@previous)
import Foundation

// TODO: Implement placeFirstLetterLast() here!
func placeFirstLetterLast(_ myString: String) -> String {
    var myString = myString
    myString.append(myString[myString.startIndex])
    myString.remove(at: myString.startIndex)
    return myString
}

placeFirstLetterLast("YaHa")

//: [Next](@next)
