//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain() // linka este arquivo com o outro
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // funcao de controle da parte inferior
    }

    @IBAction func answerButtonPress(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // seleciona o botao true / false e guarda nessa variavel que será igual a string true ou string false
        let userGotItRight = quizBrain.checkAnswer(userAnswer) // seleciona o item na array de acordo com o valor do questionNumber... answer representa o parametro "a" ou a segunda opcao de cada item
        
        // checar se o usuario acertou ou nao
        if userGotItRight { // verifica se as strings do botao e da resposta sao iguais
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
         
        quizBrain.nextQuestion() // chama a funcao nextquestion. corre mais uma posiçao do array
        
        // Dessa vez nao armazenamos dentro de uma variavel por nao haver a necessidade de repeticao
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    @objc func updateUI() { // func criada para executar o codigo sem repeticoes
        questionLabel.text = quizBrain.getQuestionTest() // quiz[questionNumber].text // seleciona um item da array
        trueButton.backgroundColor = UIColor.clear // resetar a cor do botao depois que acertar ou errar a resposta
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProcess() // Float(questionNumber) / Float(quiz.count)// divimos a variavel de controle pelo numero de itens do array
        scoreLabel.text = "Score: \(quizBrain.getScore())" // coloca o valor do score na label
    }
}
