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
    case cartman = "Cartman", squidward = "Squidward", joker = "Joker", freddy = "Freddy Five Bear"
    
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
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var octDec: UIButton!
    @IBOutlet weak var julSep: UIButton!
    @IBOutlet weak var aprJun: UIButton!
    @IBOutlet weak var janMar: UIButton!
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var multiSubmitAnswerButton: UIButton!
    @IBOutlet weak var crimeSwitch: UISwitch!
    @IBOutlet weak var bikingSwitch: UISwitch!
    @IBOutlet weak var pizzaSwitch: UISwitch!
    @IBOutlet weak var gamingSwitch: UISwitch!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var crimeLabel: UILabel!
    @IBOutlet weak var bikingLabel: UILabel!
    @IBOutlet weak var pizzaLabel: UILabel!
    @IBOutlet weak var gamingLabel: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedSubmitAnswerButton: UIButton!
    @IBOutlet weak var chungLiLabel: UILabel!
    
    @IBOutlet weak var livyDunneLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var answersChosen: [Answer] = []
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
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        janMar.setTitle(answers[0].text, for: .normal)
        aprJun.setTitle(answers[1].text, for: .normal)
        julSep.setTitle(answers[2].text, for: .normal)
        octDec.setTitle(answers[3].text, for: .normal)
    }
    func updateMultiStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        crimeSwitch.isOn = false
        bikingSwitch.isOn = false
        pizzaSwitch.isOn = false
        gamingSwitch.isOn = false
        crimeLabel.text = answers[0].text
        bikingLabel.text = answers[1].text
        pizzaLabel.text = answers[2].text
        gamingLabel.text = answers[3].text
    }
    func updateRangeStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        livyDunneLabel.text = answers.first?.text
        chungLiLabel.text = answers.last?.text
    }
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "results", sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> LandingViewController? {
        return LandingViewController(coder: coder, responses: answersChosen)
    }
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case janMar:
            answersChosen.append(currentAnswers[0])
        case aprJun:
            answersChosen.append(currentAnswers[1])
        case julSep:
            answersChosen.append(currentAnswers[2])
        case octDec:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if crimeSwitch.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if bikingSwitch.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if pizzaSwitch.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if gamingSwitch.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressBar.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultiStack(using: currentAnswers)
        case .ranged:
            updateRangeStack(using: currentAnswers)
        }
    }
    /*
      MARK: - Navigation
     
      In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      Get the new view controller using segue.destination.
      Pass the selected object to the new view controller.
     }
     */
}
