//
//  ViewController.swift
//  NumberToWords
//
//  Created by 2020.ios.8456dev on 2/6/20.
//  Copyright © 2020 CG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var wordsLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    
    var isNumberTextFieldPlaceholderDisplayed: Bool?  //Flag to notify TextField placeholder is displayed or not
    let converter = Converter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        isNumberTextFieldPlaceholderDisplayed = true
    }

    //MARK: *** TextField Delegate ***
    //Action on Clear Button
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(" Clear Button clicked ")
        isNumberTextFieldPlaceholderDisplayed = true
        numberTextField.placeholder = "Type the number..."
        wordsLabel.text = ""
        wordsLabel.backgroundColor = UIColor.white
        return true
    }
    // Before TextField become active
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing() called")
        textField.backgroundColor = UIColor.lightGray
        wordsLabel.backgroundColor = UIColor.white
        return true
    }
    
    // Initiated when TextField is activated
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing() called")
        if isNumberTextFieldPlaceholderDisplayed!{
            textField.text = ""
            isNumberTextFieldPlaceholderDisplayed = false
            wordsLabel.text = ""
        }
    }
    
    // Initiated each time when user type a character on keyboard
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let numberTextFieldText: NSString = (textField.text ?? "") as NSString
        let numberTextUpdated = numberTextFieldText.replacingCharacters(in: range, with: string)
        print("Char typed \(string) textField val \(numberTextUpdated).")
        convertNumberToWord(numbeTextUpdated: numberTextUpdated)
        return true
    }
    
    // After return key in keyboard is pressed by User
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn() called")
        textField.resignFirstResponder()
        return true
    }
    
    // Initiated when text field going to be inactive
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing() called")
        textField.backgroundColor = UIColor.white
        if textField.text!.isEmpty{
            isNumberTextFieldPlaceholderDisplayed = true
            numberTextField.placeholder = "Type the number..."
            wordsLabel.text = ""
            textField.text = ""
            isNumberTextFieldPlaceholderDisplayed = true
        }
        else{
            wordsLabel.backgroundColor = UIColor.lightGray
        }
        return true
    }
    
    // Initiated when text field is inactive
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing() called")
    }
}

// MARK: *** Private methods ***
private extension ViewController {
    func convertNumberToWord(numbeTextUpdated:String) {
        let numberVal:Int? = Int(numbeTextUpdated)
        let wordText = converter.convert(numberVal ?? 0)
        wordsLabel.text = "You have entered: \n \(wordText.capitalized)"
        print("Converted \(numbeTextUpdated) to \(wordText.capitalized)")
    }
}
