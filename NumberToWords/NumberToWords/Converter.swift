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
        let numberString = formatter.string(from: 999999)
        print(numberString ?? "")
        
        return numberString ?? ""
    }
}
