//
//  UIViewController+Extensions.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName storyboard: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName storyboard: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}

extension UIViewController: Storyboarded {}
