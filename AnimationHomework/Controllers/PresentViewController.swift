//
//  TextShowerViewController.swift
//  AnimationHomework
//
//  Created by andrewoch on 08.04.2022.
//

import UIKit

class PresentViewController: UIViewController {
    
    
    // MARK: - UI Outlets
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var raysImage: UIImageView!
    @IBOutlet weak var presentImage: UIImageView!
    
    
    // MARK: - Properties
    var animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        sliderAnimation()
        
    }
    
    // MARK: - Functions
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
    func configure() {
        self.view.backgroundColor = .black
    }
    
    func sliderAnimation() {
        animator.addAnimations {
            self.presentImage.transform = CGAffineTransform.init(scaleX: 1, y: 1).scaledBy(x: 6.5, y: 6.5)
            self.raysImage.transform = CGAffineTransform.init(rotationAngle: Double.pi).scaledBy(x: 7, y: 7)
        }
    }
}
