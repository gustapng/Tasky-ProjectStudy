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
