//
//  ViewController.swift
//  Project1
//
//  Created by SWUCOMPUTER on 2020/05/01.
//  Copyright © 2020 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var wordInfoButton: UIButton!
    @IBOutlet var quizButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toQuizView") {
            let destVC = segue.destination as! QuizViewController
            destVC.title = quizButton.titleLabel?.text
        }
        else if (segue.identifier == "toWordView") {
            let destVC = segue.destination as! WordViewController
            destVC.title = wordInfoButton.titleLabel?.text
        }
    }
}
