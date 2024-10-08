//
//  QuestionsViewController.swift
//  personalityQuiz
//
//  Created by Dylan on 10/7/24.
//

import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet weak var octDec: UIButton!
    @IBOutlet weak var julSep: UIButton!
    @IBOutlet weak var aprJun: UIButton!
    @IBOutlet weak var janMar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
