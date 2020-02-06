//
//  Converter.swift
//  NumberToWords
//
//  Created by 2020.ios.8456dev on 2/6/20.
//  Copyright © 2020 CG. All rights reserved.
//

import Foundation

class Converter {
    
    func convert(_ number: Int) -> String {

        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        var numberString = ""
        if number < 1{
            numberString = ""
        }
        else if number > 999999{
              numberString = ""
        }
        else{
            numberString = formatter.string(from: NSNumber(value: number)) ?? ""
        }
        return numberString
    }
}
