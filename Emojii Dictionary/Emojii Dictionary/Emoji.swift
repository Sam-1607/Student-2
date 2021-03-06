//
//  Emoji.swift
//  Emojii Dictionary
//
//  Created by Sam Hiatt  on 10/13/21.
//

import Foundation
struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static var documentDirectory =
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static var archiveURL = documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    
    static func saveToFile(emjoiArray: [Emoji]) {
        let myEncoder = PropertyListEncoder()
        let encodedEmojis = try? myEncoder.encode(emjoiArray)
        try? encodedEmojis?.write(to: archiveURL)
    }
    
    static func loadFromFile() -> [Emoji]  {
        do {
            let myDecoder = PropertyListDecoder()
            let retrievedEmojis = try Data(contentsOf: archiveURL)
            let decodedEmojis = try myDecoder.decode(Array<Emoji>.self, from: retrievedEmojis)
            print(decodedEmojis)
            return decodedEmojis
        } catch {
            print(error)
            return Emoji.sampleEmoji()
        }
    }

    static func sampleEmoji() -> [Emoji] {
           [Emoji(symbol: "๐", name: "SmileyFace", description: "The typcal smiling face", usage: "happiness"),
            Emoji(symbol: "๐", name: "Laughing Face", description: "A face of etreme laughter", usage: "Funny"),
            Emoji(symbol: "๐", name: "Winking Face", description: "A face of someone winking", usage: "Understanding"),
            Emoji(symbol: "๐", name: "Heart Eyes Face", description: "A face of somone who is in love", usage: "Love"),
            Emoji(symbol: "๐คจ", name: "A Skeptical Face", description: "The face of someone who skeptical", usage: "Doubtful"),
            Emoji(symbol: "๐ญ", name: "Crying Face", description: "Someone Bawling their eyes out", usage: "Extreme Sadness"),
            Emoji(symbol: "๐ก", name: "Angry Face", description: "A very angry person", usage: "Extreme Anger"),
            Emoji(symbol: "๐คฏ", name: "Surprised", description: "A person who mind has been blown", usage: "Shock"),
            Emoji(symbol: "๐ฅ", name: "Worried Face", description: "Somenoe who is sweating because of worry", usage: "Worry"),
            Emoji(symbol: "๐ฅฑ", name: "Yawning Face", description: "A face that is in the middle of yawning", usage: "Boredom"),
            Emoji(symbol: "๐คฎ", name: "Puking Face", description: "A face that is puking", usage: "Disgust"),
            Emoji(symbol: "๐งข", name: "Major Cap", description: "A blue cap", usage: "Unconvinced"),
            Emoji(symbol: "๐", name: "Hamburger", description: "A juicy Hamburger", usage: "No idea maybe hunger or something"),
            Emoji(symbol: "๐ฉ", name: "sh*$", description: "A swirl of poo", usage: "???"),
            Emoji(symbol: "๐", name: "Simp", description: "An emoji frequently used by your local simps", usage: "Simping"),
            Emoji(symbol: "๐ค", name: "Goldigger", description: "An emoji for people who care only about money", usage: "Girls in LA"),
            Emoji(symbol: "๐", name: "Egg Plant", description: "A nice looking vegetable", usage: "When conversation about vegetables is being had")]
    }
   
}

// The Load From File is suppossed to return an array of emojis but I can't return it because retrieved emojis are not in scope


