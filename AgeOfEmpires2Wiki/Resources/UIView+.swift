//
//  UIView+.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 3.03.2022.
//

import UIKit

extension UIView {
    
    func fillSuperView() {
        guard let superview = self.superview else {
            print("No super view")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false

        let viewConstraints : [NSLayoutConstraint] = [
            leftAnchor.constraint(equalTo: superview.leftAnchor),
            rightAnchor.constraint(equalTo: superview.rightAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ]
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    func centerInSuperview() {
        guard let superview = self.superview else {
            print("No super view")
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        let viewConstraints: [NSLayoutConstraint] = [
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ]
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    
    
    func anchor(top: NSLayoutYAxisAnchor? ,bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top,constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
