//
//  LoginViewController.swift
//  Cowrywise
//
//  Created by omokagbo on 07/05/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var requestCompletion: (() -> Void)?
    
    enum LoginError: Error {
        case incompleteFields
        case invalidEmail
        case invalidPassword
        case wrongLoginDetails
    }
    
    // MARK:- SUBVIEWS INIT
    
    var headerImage: UIImageView!
    var label1: UILabel!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var passwordHideButton: UIButton!
    
    
    // MARK:- LOADVIEW METHOD
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        // MARK:- SUBVIEWS
        
        // headerImage
        headerImage = UIImageView()
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        headerImage.image = #imageLiteral(resourceName: "Cowrywise background")
        headerImage.contentMode = .scaleAspectFill
        view.addSubview(headerImage)
        
        // Label1
        label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textAlignment = .left
        label1.font = UIFont.systemFont(ofSize: 30, weight: .light)
        label1.text = "Jump right back in."
        label1.numberOfLines = 0
        label1.textColor = #colorLiteral(red: 0, green: 0.1122148708, blue: 0.3671498597, alpha: 1)
        view.addSubview(label1)
        
        // Email Label
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.systemFont(ofSize: 17)
        emailLabel.text = "Email Address"
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
        view.addSubview(emailTextField)
        
        // Line View
        let lineView1 = UIView()
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        lineView1.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView1)
        
        // Password Label
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.textAlignment = .left
        passwordLabel.font = UIFont.systemFont(ofSize: 17)
        passwordLabel.text = "Password"
        passwordLabel.numberOfLines = 0
        passwordLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(passwordLabel)
        
        // Password TextField
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.font = UIFont.systemFont(ofSize: 20)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.returnKeyType = UIReturnKeyType.default
        view.addSubview(passwordTextField)
        
        // button to hide or show password
        passwordHideButton = UIButton()
        passwordHideButton.translatesAutoresizingMaskIntoConstraints = false
        passwordHideButton.setImage(#imageLiteral(resourceName: "show_hide_password-07-512"), for: .normal)
        passwordHideButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        view.addSubview(passwordHideButton)
        
        // Line View
        let lineView2 = UIView()
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        lineView2.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView2)
        
        
        // Login Button
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("  LOG IN  ", for: .normal)
        loginButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.004114938434, green: 0.3792601824, blue: 0.9041646123, alpha: 1)
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 6
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        // Forgot Password Button
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("  Forgot Password?  ", for: .normal)
        forgotPasswordButton.setTitleColor(#colorLiteral(red: 0, green: 0.3792054057, blue: 0.9801200032, alpha: 1), for: .normal)
        forgotPasswordButton.layer.borderColor = UIColor.white.cgColor
        view.addSubview(forgotPasswordButton)
        
        
        // MARK:- SUBVIEW CONSTRAINTS
        
        NSLayoutConstraint.activate([
            
            headerImage.topAnchor.constraint(equalTo: view.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            label1.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 20),
            label1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: label1.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView1.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            lineView1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView1.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            lineView1.heightAnchor.constraint(equalToConstant: 1),
            
            passwordLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            passwordHideButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.07),
            passwordHideButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04),
            passwordHideButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
            passwordHideButton.bottomAnchor.constraint(equalTo: lineView2.topAnchor, constant: -10),
            
            lineView2.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            lineView2.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView2.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            lineView2.heightAnchor.constraint(equalToConstant: 1),
            
            loginButton.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func hidePassword(_ sender: Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.passwordTextField.isSecureTextEntry = false
            self.passwordHideButton.setImage(#imageLiteral(resourceName: "show_hide_password-07-512"), for: .normal)
        } else {
            self.passwordTextField.isSecureTextEntry = true
            self.passwordHideButton.setImage(#imageLiteral(resourceName: "show_hide_password-10-512"), for: .normal)
        }
    }
    
    @objc func loginButtonTapped() {
        do {
            try login()
            let newViewController = ProfileViewController()
            newViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(newViewController, animated: true)
        } catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email", message: "This email is invalid, please enter a valid email", vc: self)
        } catch LoginError.invalidPassword {
            Alert.showBasic(title: "Invalid Password", message: "This password is invalid", vc: self)
        } catch LoginError.wrongLoginDetails {
            
        } catch LoginError.incompleteFields {
            Alert.showBasic(title: "Incomplete fields", message: "Please fill out all fields to login", vc: self)
        } catch {
            Alert.showBasic(title: "Unable to login", message: "An error occurred while trying to login. Please try again", vc: self)
        }
    }
    
    let loginURL = "https://609908f199011f001713ffb0.mockapi.io/api/v1/login"
    
    func login() throws {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteFields
        }
        if  !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        if password.count < 8 {
            throw LoginError.invalidPassword
        }
        
        let parameters = ["email": email, "password": password] as [String : Any]
        guard let url = URL(string: loginURL) else {
            print("could not load url data")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    let result  = json
                    print (result["password"]!)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }).resume()
    }
}
