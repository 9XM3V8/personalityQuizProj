//
//  landingViewController.swift
//  personalityQuiz
//
//  Created by Dylan on 10/7/24.
//

import UIKit

class landingViewController: UIViewController {

    var receivedValue: String?
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var charcterImage: UIImageView!
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            updateUI()
        }
        
        private func updateUI() {
            guard let value = receivedValue else { return }

            // Update the image and labels based on the receivedValue
            switch value {
            case "showCartman":
                charcterImage.image = UIImage(named: "cartmanImage") // Replace with your image name
                characterLabel.text = "Cartman Title"
                characterDescription.text = "Cartman Description"
                
            case "showSquiddy":
                charcterImage.image = UIImage(named: "cartmanImage") // Replace with your image name
                characterLabel.text = "SquidWard"
                characterDescription.text = "Cartman Description"
                
            case "showJoker":
                charcterImage.image = UIImage(named: "cartmanImage") // Replace with your image name
                characterLabel.text = "Joker"
                characterDescription.text = "Cartman Description"
                
            case "showFreddy":
                charcterImage.image = UIImage(named: "C979ACF9-11AA-4678-9B9A-5F159F03F758")
                characterLabel.text = "Freddy Five Bear"
                characterDescription.text = "Cartman Description"
                
            default:
                break
            }
        }
    }
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
