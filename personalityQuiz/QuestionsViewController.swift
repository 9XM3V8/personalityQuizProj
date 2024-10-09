//
//  QuestionsViewController.swift
//  personalityQuiz
//
//  Created by Dylan on 10/7/24.
//

import UIKit
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, ranged
}
struct Answer {
    var text: String
    var type: CharacterType
}
enum CharacterType: String {
    case cartman = "showCartman", squidward = "showSquiddy", joker = "showJoker", freddy = "showFreddy"
    
    var definition: String {
        switch self {
        case .cartman:
            return "Eric Cartman is a central character in South Park, known for his manipulative and selfish behavior. He often displays a lack of empathy."
        case .squidward:
            return "Squidward Tentacles is a character from SpongeBob SquarePants, known for his grumpy demeanor and disdain for SpongeBob."
        case .joker:
            return "The Joker is a iconic villain from Batman, known for his maniacal laughter, chaotic antics, and twisted sense of humor."
        case .freddy:
            return "Freddy Fazbear is the central character from the Five Nights at Freddy's (FNAF) video game series. He is an animatronic bear."
        }
    }
}
class QuestionsViewController: UIViewController {
    @IBOutlet weak var octDec: UIButton!
    @IBOutlet weak var julSep: UIButton!
    @IBOutlet weak var aprJun: UIButton!
    @IBOutlet weak var janMar: UIButton!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    var questionIndex = 0
    var questions: [Question] = [
        Question(
            text: "What section does your birth month fall under?",
            type: .single,
            answers: [
                Answer(text: "January - March", type: .cartman),
                Answer(text: "April - June", type: .squidward),
                Answer(text: "July - September", type: .joker),
                Answer(text: "October - December", type: .freddy)
            ]
        ),
    
        Question(
            text: "What activities do you enjoy?",
            type: .multiple,
            answers: [
                Answer(text: "Malicious Crime", type: .joker),
                Answer(text: "Biking", type: .squidward),
                Answer(text: "Making Pizza", type: .freddy),
                Answer(text: "Gaming", type: .cartman)
            ]
        ),
        
        Question(
            text: "Livy Dunne or Chung Li?",
            type: .ranged,
            answers: [
                Answer(text: "Livy Dunne", type: .joker),
                Answer(text: "More So Livy Dunne", type: .squidward),
                Answer(text: "More So Chung Li", type: .cartman),
                Answer(text: "Chung Li", type: .freddy)
                ]
            )
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        
        switch currentQuestion.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? String, let destinationVC = segue.destination as? LandingViewController else {
            return
        }
        
        destinationVC.receivedValue = sender
        
    }
    @IBAction func janMarButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toCharacter", sender: "showCartman")
    }
    
    @IBAction func aprJunButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toCharacter", sender: "showSquiddy")
    }
    
    @IBAction func julSepButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toCharacter", sender: "showJoker")
    }
    
    @IBAction func octDecButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toCharacter", sender: "showFreddy")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
