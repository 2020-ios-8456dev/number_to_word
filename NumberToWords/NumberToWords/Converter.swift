//
//  Converter.swift
//  NumberToWords
//
//  Created by 2020.ios.8456dev on 2/6/20.
//  Copyright © 2020 CG. All rights reserved.
//

import Foundation

class Converter {
    
    // Converts the number to words for valid input and "Invalid Input" is used for out of range input
    func convert(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        var numberString = ""
        if isInputValid(number){
            numberString = formatter.string(from: NSNumber(value: number)) ?? ""
        }
        else{
            numberString = "Invalid Input"
        }
        return numberString
    }
    
    //Checks whether the input entered is valid or not?
    func isInputValid(_ number: Int) -> Bool {
        if 1...999999 ~= number{
            return true
        }
        return false
    }
}

