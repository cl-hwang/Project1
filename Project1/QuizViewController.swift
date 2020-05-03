//
//  QuizViewController.swift
//  Project1
//
//  Created by SWUCOMPUTER on 2020/05/01.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

struct Question {
    var questionText: String
    var correctAnswer: String
}

class QuizViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var quizStartSwitch: UISwitch!
    @IBOutlet var quizProgressBar: UIProgressView!
    
    @IBOutlet var quizView: UIView!
    @IBOutlet var quizNum: UILabel!
    @IBOutlet var quiz: UILabel!
    @IBOutlet var answer: UITextField!
    
    @IBOutlet var result: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var num: Int = 1
    var questionArray = [Question]()
    var randomNumArray = Array<Int>()
    
    func randomNum() {
        var originalNumbers = Array (0 ... 4)
        var index = 0
        
        for _ in 0 ... 2 {
            index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
            randomNumArray.append(originalNumbers[index])
            originalNumbers.remove(at: index)
        }
    }
    
    func quizText() {
        if num == 1 {
            quiz.text = questionArray[randomNumArray[0]].questionText
        }
        else if num == 2 {
            quiz.text = questionArray[randomNumArray[1]].questionText
        }
        else if num == 3 {
            quiz.text = questionArray[randomNumArray[2]].questionText
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let que1 = Question(questionText: "4세대 이동통신인 LTE에 비해 속도가 20배가량 빠르고 처리 용량은 100배 많으며, 최대 속도가 20Gbps에 달하는 이동통신 기술은?", correctAnswer: "5G")
        let que2 = Question(questionText: "AR, VR 등을 활용하여 가상의 공간에서 치유를 경험하게 하는 기술은?", correctAnswer: "디지털치료")
        let que3 = Question(questionText: "인공지능을 기반으로 사람의 연령, 성별은 물론 감정까지 파악하는 기술은?", correctAnswer: "얼굴인식기능")
        let que4 = Question(questionText: "인간의 인지 기능과 신체적 능력을 높이기 위한 기술은?", correctAnswer: "인간증강")
        let que5 = Question(questionText: "‘식품’과 ‘기술’의 합성어로 식품 관련 산업에 4차 산업기술 등을 적용하여 이전보다 발전된 형태의 산업과 부가가치를 창출하는 기술은?", correctAnswer: "푸드테크")
        
        questionArray = [que1, que2, que3, que4, que5]
        
        quizView.isHidden = true
        result.isHidden = true
        nextButton.isHidden = true
        
        randomNum()
        quizText()
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            quizView.isHidden = false
            activityIndicator.startAnimating()
        }
        else {
            quizView.isHidden = true
            result.isHidden = true
            nextButton.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func enter() {
        if (num == 1 && answer.text == questionArray[randomNumArray[0]].correctAnswer) ||
            (num == 2 && answer.text == questionArray[randomNumArray[1]].correctAnswer) ||
            (num == 3 && answer.text == questionArray[randomNumArray[2]].correctAnswer)
        {
            result.text = "정답입니다!"
            if num == 3 {
                nextButton.isHidden = true
                activityIndicator.stopAnimating()
            }
            else {
                nextButton.isHidden = false
            }
        }
        else {
            result.text = "오답입니다. 다시 생각해보세요!"
            nextButton.isHidden = true
        }
        result.isHidden = false
    }
    
    @IBAction func nextQuiz() {
        answer.text = ""
        result.isHidden = true
        nextButton.isHidden = true
        
        if num <= 3 {
            if num == 3 {
                num = 3
                quizProgressBar.progress = 1
            }
            else {
                num += 1
                quizProgressBar.progress += 0.33
            }
            quizNum.text = String(num)
            quizText()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
}
