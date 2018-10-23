//
//  HeroesViewController.swift
//  DotaHeroesForYoutube
//
//  Created by Serxhio Gugo on 10/21/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class HeroesViewController: UIViewController {
    
    let heroesCV = "heroesCV" //cv id
    let path = "api/heroStats"
    
    var heroes = [Heroes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
        fetchHeroes()
    }
    
    
    private func setupNavBar() {
        view.backgroundColor = .customBG2
        let navImage = UIImageView(image: #imageLiteral(resourceName: "dota22").withRenderingMode(.alwaysOriginal))
        navigationItem.titleView = navImage
//        navImage.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navImage.contentMode = .scaleAspectFit
        navImage.backgroundColor = .clear

        navigationController?.navigationBar.barTintColor = .customBG
        navigationController?.navigationBar.prefersLargeTitles = false
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    let heroesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .customBG2
        return cv
    }()
    
    fileprivate func fetchHeroes() {
        APIClient.shared.fetchDotaHeroes(path: path) { (heroes, error) in
            if let error = error {
                print("Failed fetching heroes", error)
            }
            guard let heroes = heroes else { return }
            self.heroes = heroes
            self.heroesCollectionView.reloadData()
        }
    }
    
    private func setupUI() {
        
        heroesCollectionView.dataSource = self
        heroesCollectionView.delegate = self
        heroesCollectionView.register(HeroesCell.self, forCellWithReuseIdentifier: heroesCV)
        
        view.add(subview: heroesCollectionView) { (v, p) in [
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
            v.topAnchor.constraint(equalTo: p.safeAreaLayoutGuide.topAnchor),
            v.bottomAnchor.constraint(equalTo: p.safeAreaLayoutGuide.bottomAnchor),
            ]}
    }
    
}

extension HeroesViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = heroesCollectionView.dequeueReusableCell(withReuseIdentifier: heroesCV, for: indexPath) as! HeroesCell
        cell.dataSource = heroes[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 16, height: (view.frame.width / 2) - 16)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        detailsViewController.dataSource = heroes[indexPath.item]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
