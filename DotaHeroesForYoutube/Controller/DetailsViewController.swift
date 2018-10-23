//
//  DetailsViewController.swift
//  DotaHeroesForYoutube
//
//  Created by Serxhio Gugo on 10/21/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    let baseURL = "https://api.opendota.com"
    var dataSource: Any? {
        didSet {
            guard
                let heroes = dataSource as? Heroes,
                let imgBG = heroes.img,
                let imgBgUrl = URL(string: "\(baseURL)\(imgBG)")
            else { return }
            heroImageBG.sd_setImage(with: imgBgUrl)
            heroImage.sd_setImage(with: imgBgUrl)
            
            nameLabel.text = heroes.name ?? "Unknown"
            primaryAttLabel.attributedText = getAttribute(with: "Primary Attribute: ", parameterValue: heroes.primaryAttribute?.capitalized ?? "Not provided")
            attackTypeLabel.attributedText = getAttribute(with: "Attack Type: ", parameterValue: heroes.attackType?.capitalized ?? "Not provided")
            baseHealthLabel.attributedText = getAttribute(with: "Base Health: ", parameterValue: "\(heroes.baseHealth ?? 0)")
            baseManaLabel.attributedText = getAttribute(with: "Base Mana: ", parameterValue: "\(heroes.baseMana ?? 0)")
            movSpeedLabel.attributedText = getAttribute(with: "Movement Speed: ", parameterValue: "\(heroes.moveSpeed ?? 0)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavBar()
    }
    
    private func setupNavBar() {
        view.backgroundColor = .customBG2
        navigationItem.title = "Details | Dota Ⓒ"
        navigationController?.navigationBar.tintColor = .customBarTint
        navigationController?.navigationBar.barTintColor = .customBG
        navigationController?.navigationBar.prefersLargeTitles = false
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.customBarTint]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = attributes        
    }
    
    private func getAttribute(with parameterKey: String, parameterValue: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: parameterKey, attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Medium", size: 25)!, NSAttributedString.Key.foregroundColor : UIColor.customBarTint])
        
        attributedText.append(NSAttributedString(string: parameterValue, attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Heavy", size: 26)!, NSAttributedString.Key.foregroundColor : UIColor.white]))
        
        return attributedText
    }
    
    let topContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let heroImageBG: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleToFill
        img.backgroundColor = .clear
        return img
    }()
    
    let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
//        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
//        blurEffectView.contentView.addSubview(vibrancyView)
        return blurEffectView
    }()
    
    let heroImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.customBarTint.cgColor
//        img.backgroundColor = .blue
        img.dropShadow()
        return img
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "Palatino-Bold", size: 30)
        label.textAlignment = .center
        label.backgroundColor = .clear

        return label
    }()
    
    let bottomContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    let statsLabel: UILabel = {
       let label = UILabel()
        label.text = "STATS"
        label.textColor = UIColor.customBarTint
        label.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        label.textAlignment = .center
//        label.backgroundColor = .clear
        label.layer.borderColor = UIColor.customBarTint.cgColor
        label.layer.borderWidth = 5
        label.layer.cornerRadius = 8
        
        return label
    }()
    
    let primaryAttLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let attackTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let baseHealthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let baseManaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let movSpeedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing  = 10
        sv.distribution = .fillEqually
        return sv
    }()
    
    private func setupUI() {
        
        view.add(subview: topContainer) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
            v.heightAnchor.constraint(equalTo: p.heightAnchor, multiplier: 0.35)
            ]}
        
        topContainer.add(subview: heroImageBG) { (v, p) in [
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor)
            ]}
        
        heroImageBG.add(subview: blurEffectView) { (v, p) in [
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.topAnchor.constraint(equalTo: p.topAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
            ]}
        
        heroImageBG.add(subview: heroImage) { (v, p)  in [
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.heightAnchor.constraint(equalToConstant: 130),
            v.widthAnchor.constraint(equalToConstant: 230),
            ]}
        
        heroImageBG.add(subview: nameLabel) { (v, p) in [
            v.topAnchor.constraint(equalTo: heroImage.bottomAnchor),
            v.leftAnchor.constraint(equalTo: p.leftAnchor, constant: 5),
            v.rightAnchor.constraint(equalTo: p.rightAnchor, constant: -5),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -5)
            ]}
        
        view.add(subview: bottomContainer) { (v, p) in [
            v.topAnchor.constraint(equalTo: topContainer.bottomAnchor),
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor)
            ]}
        
        bottomContainer.add(subview: statsLabel) { (v, p) in [
            v.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 10),
            v.centerXAnchor.constraint(equalTo: p.centerXAnchor),
            v.widthAnchor.constraint(equalToConstant: 140),
            v.heightAnchor.constraint(equalToConstant: 80)
            ]}
        
//        stackView.addArrangedSubview(statsLabel)
        stackView.addArrangedSubview(primaryAttLabel)
        stackView.addArrangedSubview(attackTypeLabel)
        stackView.addArrangedSubview(baseHealthLabel)
        stackView.addArrangedSubview(baseManaLabel)
        stackView.addArrangedSubview(movSpeedLabel)
        
        bottomContainer.add(subview: stackView) { (v, p) in [
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 20),
            v.topAnchor.constraint(equalTo: statsLabel.bottomAnchor, constant: 10),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -20),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -50),
            ]}
    }
}
