//
//  ViewController.swift
//  Silly Song
//
//  Created by James Denny Wiryo on 13/3/18.
//  Copyright © 2018 James Wiryo. All rights reserved.
//

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

func lyricsForName(_ lyricsTemplate: String,_ fullName: String) -> String {
    let shortName = shortNameFromName(fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text! = lyricsForName(bananaFanaTemplate, nameField.text!)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

