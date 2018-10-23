//
//  UIKit.swift
//  DotaHeroesForYoutube
//
//  Created by Serxhio Gugo on 10/21/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

extension UIView {
    func add(subview: UIView, createConstraints: (_ view: UIView, _ parent: UIView) -> [NSLayoutConstraint]) {
        addSubview(subview)
        subview.activate(constraints: createConstraints(subview, self))
    }
    
    func activate(constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 1.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
