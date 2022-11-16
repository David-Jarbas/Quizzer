//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by David Jarbas on 05/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question { // pesquisar
    let text: String
    let answer: String
    
    init (q: String, a: String) {
        text = q
        answer = a
    }
}
