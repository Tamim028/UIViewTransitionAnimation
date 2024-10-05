//
//  ViewController.swift
//  UIViewTransitionAnimation
//
//  Created by Tamim Dari Chowdhury on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    private enum ButtonState {
        case green
        case red
        case none
    }
    
    @IBOutlet var contentHolderView: UIView!
    @IBOutlet var redButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    private var currentView: UIView!
    private var didLayoutSubviews: Bool = false
    private var buttonState: ButtonState = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if didLayoutSubviews == false {
            
            didLayoutSubviews = true
            self.contentHolderView.addSubview(getCustomView(color: UIColor.blue))
            self.currentView = getCustomView(color: UIColor.red)
            self.contentHolderView.addSubview(self.currentView)
            self.redButtonPressed(self.redButton)
            self.buttonState = .red
        }
    }
    
    private func getCustomView(color: UIColor = .red) -> UIView {
        let view = UIView(frame: self.contentHolderView.bounds)
        view.backgroundColor = color
        return view
    }

    @IBAction func redButtonPressed(_ sender: UIButton) {
        if buttonState == .red {return}
        redButton.showSelectionUI()
        greenButton.showDeselectionUI()
        
        let redView = getCustomView(color: UIColor.red)
        UIView.transition(from: self.currentView, to: redView, duration: 1.0, options: [.transitionCrossDissolve])
        self.currentView = redView
        self.buttonState = .red
    }
    
    @IBAction func greenButtonPressed(_ sender: UIButton) {
        if buttonState == .green {return}
        
        redButton.showDeselectionUI()
        greenButton.showSelectionUI()
        
        let greenView = getCustomView(color: UIColor.green)
        UIView.transition(from: self.currentView, to: greenView, duration: 1.0, options: [.transitionCrossDissolve])
        self.currentView = greenView
        self.buttonState = .green
        
        
    }
}


