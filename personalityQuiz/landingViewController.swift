//
//  landingViewController.swift
//  personalityQuiz
//
//  Created by Dylan on 10/7/24.
//

import UIKit

class LandingViewController: UIViewController {
    
    var responses: [Answer]
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    var receivedValue: String?
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var charcterImage: UIImageView!
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
//            updateUI()
    }
        
    @IBAction func DoneButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        characterLabel.text = "\(mostCommonAnswer.rawValue)"
        characterDescription.text = "\(mostCommonAnswer.definition)"
        charcterImage.image = UIImage(named: "\(mostCommonAnswer.rawValue)")
    }
}
