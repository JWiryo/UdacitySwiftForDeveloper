//SillySong Functions Definition

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(_ name: String) -> String {
    let lowerName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou");
    let place = lowerName.rangeOfCharacter(from: vowelSet)!.lowerBound
    return String(lowerName[place...]).folding(options: .diacriticInsensitive, locale: .current)
}
shortNameFromName("Nate")

func lyricsForName(_ lyricsTemplate: String,_ fullName: String) -> String {
    let shortName = shortNameFromName(fullName)
    
    let lyrics = lyricsTemplate
    .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
print(lyricsForName(bananaFanaTemplate,"Zöe"))
