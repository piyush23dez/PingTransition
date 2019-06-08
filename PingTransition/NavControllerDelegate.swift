//
//  NavControllerDelegate.swift
//  PingTransition
//
//  Created by Piyush Sharma on 5/9/17.
//  Copyright © 2017 Piyush Sharma. All rights reserved.
//

import Foundation
import UIKit


class NavControllerDelegate: NSObject {

}

extension NavControllerDelegate: UINavigationControllerDelegate {
<<<<<<< HEAD
=======
    
>>>>>>> f2eba12176c5e82029e6c67924e91d3e9d5168d1
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PingTransitionAnimator()
    }
}
