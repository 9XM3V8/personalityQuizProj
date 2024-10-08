//
//  landingViewController.swift
//  personalityQuiz
//
//  Created by Dylan on 10/7/24.
//

import UIKit

class LandingViewController: UIViewController {

    var receivedValue: String?
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var charcterImage: UIImageView!
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            updateUI()
        }
        
        private func updateUI() {
            guard let value = receivedValue else { return }
            switch value {
            case "showCartman":
                charcterImage.image = UIImage(named: "cartman")
                characterLabel.text = "Eric Cartman"
                characterDescription.text = "Eric Cartman is a central character in South Park, known for his manipulative and selfish behavior. He often displays a lack of empathy."
                
            case "showSquiddy":
                charcterImage.image = UIImage(named: "squiddyMog")
                characterLabel.text = "SquidWard"
                characterDescription.text = "Squidward Tentacles is a character from SpongeBob SquarePants, known for his grumpy demeanor and disdain for SpongeBob."
                
            case "showJoker":
                charcterImage.image = UIImage(named: "jokerImage")
                characterLabel.text = "Joker"
                characterDescription.text = "The Joker is a iconic villain from Batman, known for his maniacal laughter, chaotic antics, and twisted sense of humor."
                
            case "showFreddy":
                charcterImage.image = UIImage(named: "freddyImage")
                characterLabel.text = "Freddy Five Bear"
                characterDescription.text = "Freddy Fazbear is the central character from the Five Nights at Freddy's (FNAF) video game series. He is an animatronic bear."
                
            default:
                break
            }
        }
    
    @IBAction func DoneButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
