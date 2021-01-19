//
//  Coordinator.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
