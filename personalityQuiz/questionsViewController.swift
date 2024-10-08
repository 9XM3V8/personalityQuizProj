//
//  questionsViewController.swift
//  personalityQuiz
//
//  Created by Dylan on 10/7/24.
//

import UIKit

class questionsViewController: UIViewController {
    private var receivedValue = ""
    @IBOutlet weak var octDec: UIButton!
    @IBOutlet weak var julSep: UIButton!
    @IBOutlet weak var aprJun: UIButton!
    @IBOutlet weak var janMar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCartman" {
            if let destinationVC = segue.destination as? landingViewController {
                destinationVC.receivedValue = "showCartman"
            }
        } else if segue.identifier == "showSquiddy" {
            if let destinationVC = segue.destination as? landingViewController {
                destinationVC.receivedValue = "showSquiddy"
            }
        } else if segue.identifier == "showJoker" {
            if let destinationVC = segue.destination as? landingViewController {
                destinationVC.receivedValue = "showJoker"
            }
        } else if segue.identifier == "showFreddy" {
            if let destinationVC = segue.destination as? landingViewController {
                destinationVC.receivedValue = "showFreddy"
            }
        }
    }

    @IBAction func janMarButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showCartman", sender: self)
    }
    
    @IBAction func aprJunButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showSquiddy", sender: self)
    }
    
    @IBAction func julSepButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showJoker", sender: self)
    }
    
    @IBAction func octDecButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showFreddy", sender: self)
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
