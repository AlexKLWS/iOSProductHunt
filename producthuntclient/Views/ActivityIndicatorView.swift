//
//  ActivityIndicatorView.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/1/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicatorView {
    
    fileprivate static var screenOverlay: UIView?
    
    fileprivate class func setupOverlay(forTarget target: UIView) -> UIView {
        let overlay = UIView()
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black
        overlay.translatesAutoresizingMaskIntoConstraints = false
        target.addSubview(overlay)
        target.bringSubviewToFront(overlay)
        overlay.widthAnchor.constraint(equalTo: target.widthAnchor).isActive = true
        overlay.heightAnchor.constraint(equalTo: target.heightAnchor).isActive = true
        return overlay
    }
    
    fileprivate class func setupIndicator(forTarget target: UIView) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        target.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: target.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: target.centerYAnchor).isActive = true
        return indicator
    }
    
    fileprivate class func getCurrentWindow() -> UIWindow? {
        if let window = UIApplication.shared.keyWindow {
            return window
        }
        if !UIApplication.shared.windows[0].isHidden {
            return UIApplication.shared.windows[0]
        }
        return nil
    }
    
    class func showIndicator() {
        guard let window = getCurrentWindow() else { return }
        
        hideIndicator()
        
        let overlay = setupOverlay(forTarget: window)
        
        let indicator = setupIndicator(forTarget: overlay)
        indicator.startAnimating()

        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        overlay.alpha = overlay.alpha > 0 ? 0 : 0.5
        UIView.commitAnimations()
        
        screenOverlay = overlay
    }
    
    class func hideIndicator() {
        screenOverlay?.removeFromSuperview()
        screenOverlay = nil
    }
    
}
