//
//  ViewController.swift
//  Cowrywise
//
//  Created by omokagbo on 06/05/2021.

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK:- SUBVIEWS INIT
    
    var backgroundImage: UIImageView!
    var label1: UILabel!
    var label2: UILabel!
    var loginButton: UIButton!
    var signupButton: UIButton!
    
    // MARK:- LOADVIEW METHOD
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .link
        
        // MARK:- SUBVIEWS
        
        // BackgroundImage
        backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = #imageLiteral(resourceName: "Cowrywise background")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        
        // Label1
        label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textAlignment = .center
        label1.font = UIFont.boldSystemFont(ofSize: 44)
        label1.text = "Build wealth, the smart way."
        label1.numberOfLines = 0
        label1.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(label1)
        
        // Label2
        label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.textAlignment = .center
        label2.font = UIFont.systemFont(ofSize: 18)
        label2.text = "Save and invest with Cowrywise, the only wealth management app you really need."
        label2.numberOfLines = 0
        label2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(label2)
        
        // Login Button
        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("  LOG IN  ", for: .normal)
        loginButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.004114938434, green: 0.3792601824, blue: 0.9041646123, alpha: 1)
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 6
        loginButton.addTarget(self, action: #selector(LoginClicked), for: .touchUpInside)
        view.addSubview(loginButton)
        
        // Signup Button
        signupButton = UIButton()
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.setTitle("  SIGN UP  ", for: .normal)
        signupButton.setTitleColor(#colorLiteral(red: 0, green: 0.3792054057, blue: 0.9801200032, alpha: 1), for: .normal)
        signupButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        signupButton.layer.cornerRadius = 6
        signupButton.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
        view.addSubview(signupButton)
        
        
        // MARK:- SUBVIEW CONSTRAINTS
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            label1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            label1.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            
            
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            label2.widthAnchor.constraint(equalTo: label1.widthAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            loginButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            loginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 44),
            
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            signupButton.heightAnchor.constraint(equalToConstant: 44),
            signupButton.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
            signupButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            signupButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    @objc private func LoginClicked(sender: UIButton) {
        let newViewController = LoginViewController()
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
        
    }
    
    @objc private func signUpClicked() {
        let newViewController = SignUpFirstViewController()
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

