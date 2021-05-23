//
//  SignUpThirdViewController.swift
//  Cowrywise
//
//  Created by omokagbo on 09/05/2021.
//

import UIKit

class SignUpThirdViewController: UIViewController {
    
    // MARK:- SUBVIEWS INIT
    var backgroundImage: UIImageView!
    var label1: UILabel!
    var label2: UILabel!
    
    // MARK:- LOADVIEW METHOD
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // MARK:- SUBVIEWS
        backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = #imageLiteral(resourceName: "Screenshot 2021-05-09 at 00.07.09")
        view.addSubview(backgroundImage)
        
        label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textAlignment = .left
        label1.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label1.text = "You're all set!"
        label1.numberOfLines = 0
        label1.textColor = #colorLiteral(red: 0, green: 0.1122148708, blue: 0.3671498597, alpha: 1)
        view.addSubview(label1)
        
        label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.textAlignment = .left
        label2.font = UIFont.systemFont(ofSize: 20)
        label2.text = "Welcome to the family!"
        label2.numberOfLines = 0
        label2.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(label2)
        
        let exploreButton = UIButton()
        exploreButton.translatesAutoresizingMaskIntoConstraints = false
        exploreButton.setTitle("  EXPLORE COWRYWISE  ", for: .normal)
        exploreButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        exploreButton.backgroundColor = #colorLiteral(red: 0.004114938434, green: 0.3792601824, blue: 0.9041646123, alpha: 1)
        exploreButton.layer.borderColor = UIColor.white.cgColor
        exploreButton.layer.cornerRadius = 6
        exploreButton.addTarget(self, action: #selector(exploreBtnClicked), for: .touchUpInside)
        view.addSubview(exploreButton)
        
        
        // MARK:- SUBVIEW LAYOUT CONSTRAINTS
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            label1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -10),
            
            label2.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            label2.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            label2.bottomAnchor.constraint(equalTo: exploreButton.topAnchor, constant: -30),
            
            exploreButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            exploreButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            exploreButton.heightAnchor.constraint(equalToConstant: 44),
            exploreButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func exploreBtnClicked() {
        let newViewController = ProfileViewController()
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
