//
//  SignUpSecondViewController.swift
//  Cowrywise
//
//  Created by omokagbo on 08/05/2021.
//

import UIKit

class SignUpSecondViewController: UIViewController {
    
    enum SignupError: Error {
        case missingFirstName
        case missingLastName
        case incorrectPasswordLength
        case invalidPhoneNumber
    }
    
    // MARK:- SUBVIEWS INIT
    
    var label1: UILabel!
    var firstNameField: UITextField!
    var lastNameField: UITextField!
    var passwordField: UITextField!
    var phoneNumberField: UITextField!
    var tAndCLabel: UILabel!
    var passwordHideButton: UIButton!
    
    var email = ""
    
    // MARK:- LOADVIEW METHOD
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // MARK:- SUBVIEWS
        
        // Label 1
        label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label1.text = "Let's get to know you."
        label1.numberOfLines = 0
        label1.textColor = #colorLiteral(red: 0, green: 0.1122148708, blue: 0.3671498597, alpha: 1)
        view.addSubview(label1)
        
        // First Name
        firstNameField = UITextField()
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.font = UIFont.systemFont(ofSize: 20)
        firstNameField.placeholder = "First Name "
        firstNameField.textAlignment = .left
        firstNameField.returnKeyType = UIReturnKeyType.default
        view.addSubview(firstNameField)
        
        let firstNameLlineView = UIView()
        firstNameLlineView.translatesAutoresizingMaskIntoConstraints = false
        firstNameLlineView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(firstNameLlineView)
        
        // Last Name
        lastNameField = UITextField()
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.font = UIFont.systemFont(ofSize: 20)
        lastNameField.placeholder = "Last Name "
        lastNameField.textAlignment = .left
        lastNameField.returnKeyType = UIReturnKeyType.default
        view.addSubview(lastNameField)
        
        // Line View
        let lastNameLlineView = UIView()
        lastNameLlineView.translatesAutoresizingMaskIntoConstraints = false
        lastNameLlineView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lastNameLlineView)
        
        // Password
        passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.font = UIFont.systemFont(ofSize: 20)
        passwordField.placeholder = "Password "
        passwordField.isSecureTextEntry = true
        passwordField.textContentType = .oneTimeCode
        passwordField.returnKeyType = UIReturnKeyType.default
        view.addSubview(passwordField)
        
        // button to hide or show password
        passwordHideButton = UIButton(type: .system)
        passwordHideButton.translatesAutoresizingMaskIntoConstraints = false
        passwordHideButton.setImage(#imageLiteral(resourceName: "show_hide_password-07-512"), for: .normal)
        passwordHideButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        view.addSubview(passwordHideButton)
        
        
        // Line View
        let passwordLlineView = UIView()
        passwordLlineView.translatesAutoresizingMaskIntoConstraints = false
        passwordLlineView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        passwordHideButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        view.addSubview(passwordLlineView)
        
        // Phone Number
        phoneNumberField = UITextField()
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberField.font = UIFont.systemFont(ofSize: 20)
        phoneNumberField.placeholder = "Phone (e.g. +234 812 345 6789)"
        phoneNumberField.adjustsFontSizeToFitWidth = true
        phoneNumberField.textAlignment = .left
        phoneNumberField.returnKeyType = UIReturnKeyType.default
        phoneNumberField.keyboardType = .phonePad
        view.addSubview(phoneNumberField)
        
        // Line View
        let phoneNumberLlineView = UIView()
        phoneNumberLlineView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLlineView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(phoneNumberLlineView)
        
        // Continue Button
        let continueButton = UIButton()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("  CONTINUE  ", for: .normal)
        continueButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        continueButton.backgroundColor = #colorLiteral(red: 0.004114938434, green: 0.3792601824, blue: 0.9041646123, alpha: 1)
        continueButton.layer.borderColor = UIColor.white.cgColor
        continueButton.layer.cornerRadius = 6
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        view.addSubview(continueButton)
        
        // Invite code button
        let inviteButton = UIButton()
        inviteButton.translatesAutoresizingMaskIntoConstraints = false
        inviteButton.setTitle("  Got an invite code?  ", for: .normal)
        inviteButton.setTitleColor(#colorLiteral(red: 0, green: 0.3792054057, blue: 0.9801200032, alpha: 1), for: .normal)
        view.addSubview(inviteButton)
        
        // Terms and Conditions Label
        tAndCLabel = UILabel()
        tAndCLabel = UILabel()
        tAndCLabel.translatesAutoresizingMaskIntoConstraints = false
        tAndCLabel.font = UIFont.systemFont(ofSize: 18)
        tAndCLabel.text = "By signing up you agree to our Terms & Conditions and Privacy Policy."
        tAndCLabel.textAlignment = .center
        tAndCLabel.numberOfLines = 0
        tAndCLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(tAndCLabel)
        
        
        // MARK:- SUBVIEW LAYOUT CONSTRAINTS
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            label1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            firstNameField.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 40),
            firstNameField.leadingAnchor.constraint(equalTo: label1.leadingAnchor),
            firstNameField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            
            firstNameLlineView.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 10),
            firstNameLlineView.leadingAnchor.constraint(equalTo: firstNameField.leadingAnchor),
            firstNameLlineView.trailingAnchor.constraint(equalTo: firstNameField.trailingAnchor),
            firstNameLlineView.heightAnchor.constraint(equalToConstant: 1),
            
            lastNameField.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 40),
            lastNameField.leadingAnchor.constraint(equalTo: firstNameField.trailingAnchor, constant: 20),
            lastNameField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            lastNameField.heightAnchor.constraint(equalTo: firstNameField.heightAnchor),
            lastNameField.centerYAnchor.constraint(equalTo: firstNameField.centerYAnchor),
            
            lastNameLlineView.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 10),
            lastNameLlineView.leadingAnchor.constraint(equalTo: lastNameField.leadingAnchor),
            lastNameLlineView.trailingAnchor.constraint(equalTo: lastNameField.trailingAnchor),
            lastNameLlineView.heightAnchor.constraint(equalToConstant: 1),
            
            passwordField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 40),
            passwordField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            passwordHideButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.07),
            passwordHideButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04),
            passwordHideButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
            passwordHideButton.bottomAnchor.constraint(equalTo: passwordLlineView.topAnchor, constant: -10),
            
            passwordLlineView.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            passwordLlineView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordLlineView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            passwordLlineView.heightAnchor.constraint(equalToConstant: 1),
            
            phoneNumberField.topAnchor.constraint(equalTo: passwordLlineView.bottomAnchor, constant: 40),
            phoneNumberField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            phoneNumberField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            phoneNumberLlineView.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 10),
            phoneNumberLlineView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            phoneNumberLlineView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            phoneNumberLlineView.heightAnchor.constraint(equalToConstant: 1),
            
            continueButton.topAnchor.constraint(equalTo: phoneNumberLlineView.bottomAnchor, constant: 40),
            continueButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
            
            
            inviteButton.bottomAnchor.constraint(equalTo: tAndCLabel.topAnchor, constant: -20),
            inviteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tAndCLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            tAndCLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tAndCLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .link
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func hidePassword(_ sender: Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.passwordField.isSecureTextEntry = false
            self.passwordHideButton.setImage(#imageLiteral(resourceName: "show_hide_password-07-512"), for: .normal)
        } else {
            self.passwordField.isSecureTextEntry = true
            self.passwordHideButton.setImage(#imageLiteral(resourceName: "show_hide_password-10-512"), for: .normal)
        }
    }
    
    @objc func continueButtonTapped() {
        
        do {
            try continueTapped()
            let newViewController = SignUpThirdViewController()
            newViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(newViewController, animated: true)
        } catch SignupError.missingFirstName {
            Alert.showBasic(title: "Oops! Sorry", message: "Please provide your first name to continue", vc: self)
        } catch SignupError.missingLastName {
            Alert.showBasic(title: "Oops! Sorry", message: "Please provide your last name to continue", vc: self)
        } catch SignupError.invalidPhoneNumber {
            Alert.showBasic(title: "Invalid phone number", message: "Please enter a valid phone to continue", vc: self)
        } catch SignupError.incorrectPasswordLength {
            Alert.showBasic(title: "One moment!", message: "Password must be a minimum of 8 characters, and must contain numbers and alphabets", vc: self)
        } catch {
            Alert.showBasic(title: "Unable to create account", message: "An error occurred while creating an account. Please try again", vc: self)
        }
        
    }
    
    func continueTapped() throws {
        guard let firstName = firstNameField.text else { return }
        guard let lastName = lastNameField.text else { return }
        guard let password = passwordField.text else { return }
        guard let phoneNumber = phoneNumberField.text else { return }
        
        // check if first name field is empty
        if firstName.isEmpty {
            throw SignupError.missingFirstName
        }
        
        // check if last name field is empty
        if lastName.isEmpty {
            throw SignupError.missingLastName
        }
        
        // check if password count is less than 8
        if password.count < 8 {
            throw SignupError.incorrectPasswordLength
        }
        
        // check if phone number text field is empty
        if phoneNumber.isEmpty {
            throw SignupError.invalidPhoneNumber
        }
        
        // set up phone number to take in only Nigerian phone numbers starting with +234 and having 14 characters
        guard let phoneNumberFirst = phoneNumber.first else { return }
        if phoneNumberFirst != "+" || phoneNumber.count != 14 {
            throw SignupError.invalidPhoneNumber
        }
        
        let signupURL = "https://609908f199011f001713ffb0.mockapi.io/api/v1/signup"
        let parameters = ["email": email, "firstName": firstName, "password": password, "phoneNumber": phoneNumber] as [String : Any]
        guard let url = URL(string: signupURL) else {
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
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }).resume()
    }
}
