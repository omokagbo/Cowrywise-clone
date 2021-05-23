//
//  SignUpViewController.swift
//  Cowrywise
//
//  Created by omokagbo on 07/05/2021.
//

import UIKit

class SignUpFirstViewController: UIViewController {
    
    enum SignupError: Error {
        case invalidEmail
        case incompleteField
    }
    
    // MARK:- SUBVIEWS INIT
    
    var headerImage: UIImageView!
    var label1: UILabel!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var lineView: UIView!
    var gotAccountLabel: UILabel!
    
    
    // MARK:- LOADVIEW METHOD
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        // MARK:- SUBVIEWS
        
        // Header Image
        headerImage = UIImageView()
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        headerImage.image = #imageLiteral(resourceName: "Cowrywise background")
        headerImage.contentMode = .scaleAspectFill
        view.addSubview(headerImage)
        
        // Label1
        label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textAlignment = .left
        label1.font = UIFont.systemFont(ofSize: 31, weight: .light)
        label1.adjustsFontSizeToFitWidth = true
        label1.text = "Let's get your money working"
        label1.textColor = #colorLiteral(red: 0, green: 0.1122148708, blue: 0.3671498597, alpha: 1)
        view.addSubview(label1)
        
        // Email Label
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.systemFont(ofSize: 17)
        emailLabel.text = "Type in your email"
        emailLabel.numberOfLines = 0
        emailLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(emailLabel)
        
        // Email TextField
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.font = UIFont.systemFont(ofSize: 20)
        if let emailFieldImage = UIImage(named: "Envelope-icon.jpeg") {
            emailTextField.withImage(direction: .Right, image: emailFieldImage, colorSeparator: .white, colorBorder: .white)
        }
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = UIReturnKeyType.default
        view.addSubview(emailTextField)
        
        // Line View
        lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView)
        
        // Login Button
        let getStartedButton = UIButton()
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.setTitle("  GET STARTED  ", for: .normal)
        getStartedButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        getStartedButton.backgroundColor = #colorLiteral(red: 0.004114938434, green: 0.3792601824, blue: 0.9041646123, alpha: 1)
        getStartedButton.layer.borderColor = UIColor.white.cgColor
        getStartedButton.layer.cornerRadius = 6
        getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        view.addSubview(getStartedButton)
        
        // Got Account Label
        gotAccountLabel = UILabel()
        gotAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        gotAccountLabel.textAlignment = .left
        gotAccountLabel.font = UIFont.systemFont(ofSize: 17)
        gotAccountLabel.text = "Got an account?"
        gotAccountLabel.numberOfLines = 0
        gotAccountLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(gotAccountLabel)
        
        // Forgot Password Button
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle(" Sign in ", for: .normal)
        signInButton.setTitleColor(#colorLiteral(red: 0, green: 0.3792054057, blue: 0.9801200032, alpha: 1), for: .normal)
        signInButton.addTarget(self, action: #selector(LoginClicked), for: .touchUpInside)
        view.addSubview(signInButton)
        
        
        // MARK:- SUBVIEW CONSTRAINTS
        
        NSLayoutConstraint.activate([
            
            headerImage.topAnchor.constraint(equalTo: view.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            label1.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 20),
            label1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: label1.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            getStartedButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 30),
            getStartedButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            getStartedButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            getStartedButton.heightAnchor.constraint(equalToConstant: 44),
            
            gotAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            gotAccountLabel.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 30),
            
            signInButton.centerYAnchor.constraint(equalTo: gotAccountLabel.centerYAnchor),
            signInButton.leadingAnchor.constraint(equalTo: gotAccountLabel.trailingAnchor, constant: 5),
            signInButton.heightAnchor.constraint(equalTo: gotAccountLabel.heightAnchor)
            
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func LoginClicked() {
        let newViewController = LoginViewController()
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func getStartedButtonTapped() {
        do {
            try getStarted()
            let newViewController = SignUpSecondViewController()
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.email = emailTextField.text!
            self.navigationController?.pushViewController(newViewController, animated: true)
        } catch SignupError.incompleteField {
            Alert.showBasic(title: "Email field is empty!", message: "Please fill out the email field.", vc: self)
        } catch SignupError.invalidEmail {
            Alert.showBasic(title: "Invalid Email!", message: "Please enter a valid email.", vc: self)
        } catch {
            Alert.showBasic(title: "Unable to login!", message: "An error occurred while trying to login. Please try again.", vc: self)
        }
    }
    
    func getStarted() throws {
        guard let email = emailTextField.text else { return }
        
        // check if email field is empty
        if email.isEmpty {
            throw SignupError.incompleteField
        }
        
        // check if email is a valid mail
        if !email.isValidEmail {
            throw SignupError.invalidEmail
        }
    }
    
}

