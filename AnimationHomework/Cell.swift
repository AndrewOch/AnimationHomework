//
//  Cell.swift
//  AnimationHomework
//
//  Created by andrewoch on 08.04.2022.
//

import Foundation
import UIKit

class Cell: UIView {
    
    // MARK: - UI Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Functions
    func configure(image: UIImage, title: String) {
        backgroundImageView.image = image
        backgroundImageView.alpha = 0.8
        titleLabel.text = title
        
    }
}
