//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by David Jarbas on 19/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
                Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    var questionNumber = 0 // variavel de controle
    
    var score = 0
    
    // o "answer" representa o parametro externo.. podemos tambem usar a sublinha
    mutating func checkAnswer(_ userAnswer: String) -> Bool { // input recebe uma string da condiçao do Controller
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score // vai retornar o valor do score
    }
    
    // essas duas funcoes vao retornar valores dentro da funcao updateUI
    func getQuestionTest() -> String {
        return quiz[questionNumber].text
    }
    
    func getProcess() -> Float {
        return Float(questionNumber) / Float(quiz.count) //
    }
    
    // Usamos a mutanting key word para alterar a struct que foi criada como "let" e portanto era imutável
   mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count { // se for menor que a quantidade de itens
            questionNumber += 1 // corre mais uma posicao no array
        } else {
            questionNumber = 0 // faz retornar a primeira pergunta
            score = 0 //vai resetar quando terminar as perguntas
        }
    }
}
