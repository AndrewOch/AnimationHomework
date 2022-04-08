//
//  ViewController.swift
//  AnimationHomework
//
//  Created by andrewoch on 08.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Outlets
    
    @IBOutlet var cellView: UIView!
    
    // MARK: - Properties
    
    var selectedCellImageViewSnapshot: UIView?
    var animator: Animator?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        cellView.layer.cornerRadius = 20
        let tapGesture = UITapGestureRecognizer()
        self.view.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(cellClick))
        
        (cellView as? Cell)!.configure(image: UIImage(named: "кнопка") ?? UIImage(), title: "Нажми на меня и получи приз")
    }
    
    // MARK: - Functions
    
    @IBAction func cellClick(_ sender: UITapGestureRecognizer) {
        presentLampControlVC()
    }
    
    
    func presentLampControlVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentVC = storyboard.instantiateViewController(withIdentifier: "PresentViewController") as! PresentViewController
        let selectedCell = cellView as? Cell
        selectedCellImageViewSnapshot = selectedCell?.backgroundImageView.snapshotView(afterScreenUpdates: false)
        
        presentVC.transitioningDelegate = self
        
        presentVC.modalPresentationStyle = .fullScreen
        present(presentVC, animated: true)
    }
    
}

// MARK: - Transitioning Delegate

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let viewController = presenting as? ViewController,
              let presentVC = presented as? PresentViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        animator = Animator(type: .present, menuViewController: viewController, lampControlViewController: presentVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let presentVC = dismissed as? PresentViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        animator = Animator(type: .dismiss, menuViewController: self, lampControlViewController: presentVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}
