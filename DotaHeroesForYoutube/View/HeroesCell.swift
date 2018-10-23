//
//  HeroesCell.swift
//  DotaHeroesForYoutube
//
//  Created by Serxhio Gugo on 10/21/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit
import SDWebImage

class HeroesCell: UICollectionViewCell {
    
    let baseUrl = "https://api.opendota.com"
    
    var dataSource: Any? {
        didSet {
            guard
            let hero = dataSource as? Heroes,
            let name = hero.name,
            let iconImg = hero.img,
            let iconImgURL = URL(string: "\(baseUrl)\(iconImg)")
                else { return }
            nameLabel.text = name.capitalized
            iconImage.sd_setImage(with: iconImgURL)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    let view : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let iconImage: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .clear
        img.clipsToBounds = true
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 10
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.darkGray.cgColor
        return img
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private func setupUI() {
        self.add(subview: view) { (v, p) in [
            v.leftAnchor.constraint(equalTo: p.leftAnchor),
            v.topAnchor.constraint(equalTo: p.topAnchor),
            v.rightAnchor.constraint(equalTo: p.rightAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor),
            ]}
        
        iconImage.layer.cornerRadius = bounds.width / 2
        
        view.add(subview: iconImage) { (v, p) in [
            v.leftAnchor.constraint(equalTo: p.leftAnchor),
            v.topAnchor.constraint(equalTo: p.topAnchor),
            v.rightAnchor.constraint(equalTo: p.rightAnchor),
            v.heightAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.6)
            ]}
        
        view.add(subview: nameLabel) { (v, p) in [
            v.topAnchor.constraint(equalTo: iconImage.bottomAnchor),
            v.leftAnchor.constraint(equalTo: p.leftAnchor),
            v.rightAnchor.constraint(equalTo: p.rightAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor),
            ]}
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
