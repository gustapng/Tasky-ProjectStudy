//
//  UiViewController+.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 11/08/24.
//

import UIKit

extension UIViewController {
    func addGradientBackground() {
        let gradianteBackground = CAGradientLayer()
        gradianteBackground.frame = view.bounds
        gradianteBackground.colors = [UIColor.white.cgColor, UIColor(named: AssetsConstants.lilac)?.cgColor ?? UIColor.purple.cgColor]
        view.layer.insertSublayer(gradianteBackground, at: 0)
    }
}

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
