//
//  CardsSelctionVC.swift
//  DareDeck
//
//  Created by Genish  on 12/01/2025.
//

import UIKit

class CardsSelctionVC: UIViewController {
    
    @IBOutlet var cardsImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var cards : [UIImage] = card.allValues
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardsImageView.image = cards.randomElement() ?? UIImage(named: "AC")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}
    
