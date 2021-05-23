//
//  ProfileViewController.swift
//  Cowrywise
//
//  Created by omokagbo on 08/05/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    var id = ""
    var profileModel: ProfileResponse?
    
    // MARK:- SUBVIEWS INIT
    var profileImage: UIImageView!
    var profileLabel: UILabel!
    var firstNameLabel: UILabel!
    var firstNameEntry: UITextField!
    var lastNameLabel: UILabel!
    var lastNameEntry: UITextField!
    var userNameLabel: UILabel!
    var userNameEntry: UITextField!
    var genderLabel: UILabel!
    var genderEntry: UITextField!
    var dobLabel: UILabel!
    var dobEntry: UITextField!
    var nextOfKinLabel: UILabel!
    var nextOfKinEntry: UITextField!
    
    
    // MARK:- LOAD VIEW
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = .white
        
        // MARK:- SUBVIEWS
        
        let segmentedControl = UISegmentedControl (items: ["Personal", "Security","Behaviour"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .systemBlue
        segmentedControl.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(segmentedControl)
        
        profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = #imageLiteral(resourceName: "Screenshot 2021-05-10 at 21.09.12")
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.cornerRadius = 60
        view.addSubview(profileImage)
        
        profileLabel = UILabel()
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.text = "Tap to change picture"
        profileLabel.font = UIFont.systemFont(ofSize: 14)
        profileLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(profileLabel)
        
        let lineView1 = UIView()
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        lineView1.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView1)
        
        firstNameLabel = UILabel()
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.text = "Firstname "
        firstNameLabel.font = UIFont.systemFont(ofSize: 20)
        firstNameLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(firstNameLabel)
        
        firstNameEntry = UITextField()
        firstNameEntry.translatesAutoresizingMaskIntoConstraints = false
        firstNameEntry.text = "emar"
        firstNameEntry.font = UIFont.systemFont(ofSize: 20)
        firstNameEntry.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(firstNameEntry)
        
        let lineView2 = UIView()
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        lineView2.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView2)
        
        
        lastNameLabel = UILabel()
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.text = "Lastname "
        lastNameLabel.font = UIFont.systemFont(ofSize: 20)
        lastNameLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(lastNameLabel)
        
        lastNameEntry = UITextField()
        lastNameEntry.translatesAutoresizingMaskIntoConstraints = false
        lastNameEntry.text = "mike"
        lastNameEntry.font = UIFont.systemFont(ofSize: 20)
        lastNameEntry.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(lastNameEntry)
        
        let lineView3 = UIView()
        lineView3.translatesAutoresizingMaskIntoConstraints = false
        lineView3.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView3)
        
        
        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Username "
        userNameLabel.font = UIFont.systemFont(ofSize: 20)
        userNameLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(userNameLabel)
        
        userNameEntry = UITextField()
        userNameEntry.translatesAutoresizingMaskIntoConstraints = false
        userNameEntry.text = "@user6187940"
        userNameEntry.font = UIFont.systemFont(ofSize: 20)
        userNameEntry.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(userNameEntry)
        
        let lineView4 = UIView()
        lineView4.translatesAutoresizingMaskIntoConstraints = false
        lineView4.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView4)
        
        
        genderLabel = UILabel()
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender "
        genderLabel.font = UIFont.systemFont(ofSize: 20)
        genderLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(genderLabel)
        
        genderEntry = UITextField()
        genderEntry.translatesAutoresizingMaskIntoConstraints = false
        genderEntry.text = "Gender"
        genderEntry.font = UIFont.systemFont(ofSize: 20)
        genderEntry.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(genderEntry)
        
        let lineView5 = UIView()
        lineView5.translatesAutoresizingMaskIntoConstraints = false
        lineView5.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView5)
        
        
        dobLabel = UILabel()
        dobLabel.translatesAutoresizingMaskIntoConstraints = false
        dobLabel.text = "Date of birth "
        dobLabel.font = UIFont.systemFont(ofSize: 20)
        dobLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(dobLabel)
        
        dobEntry = UITextField()
        dobEntry.translatesAutoresizingMaskIntoConstraints = false
        dobEntry.text = "Date of Birth "
        dobEntry.font = UIFont.systemFont(ofSize: 20)
        dobEntry.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(dobEntry)
        
        let lineView6 = UIView()
        lineView6.translatesAutoresizingMaskIntoConstraints = false
        lineView6.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView6)
        
        
        nextOfKinLabel = UILabel()
        nextOfKinLabel.translatesAutoresizingMaskIntoConstraints = false
        nextOfKinLabel.text = "Next of Kin "
        nextOfKinLabel.font = UIFont.systemFont(ofSize: 20)
        nextOfKinLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(nextOfKinLabel)
        
        nextOfKinEntry = UITextField()
        nextOfKinEntry.translatesAutoresizingMaskIntoConstraints = false
        nextOfKinEntry.text = ">"
        nextOfKinEntry.font = UIFont.systemFont(ofSize: 20)
        nextOfKinEntry.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.addSubview(nextOfKinEntry)
        
        let lineView7 = UIView()
        lineView7.translatesAutoresizingMaskIntoConstraints = false
        lineView7.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(lineView7)
        
        // MARK:- SUBVIEWS CONSTRAINTS
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 50),
            segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            profileImage.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileLabel.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor),
            profileLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 5),
            
            lineView1.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 10),
            lineView1.heightAnchor.constraint(equalToConstant: 1),
            lineView1.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView1.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            firstNameLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 10),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            firstNameEntry.centerYAnchor.constraint(equalTo: firstNameLabel.centerYAnchor),
            firstNameEntry.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView2.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 10),
            lineView2.heightAnchor.constraint(equalToConstant: 1),
            lineView2.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView2.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lastNameLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 10),
            lastNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            lastNameEntry.centerYAnchor.constraint(equalTo: lastNameLabel.centerYAnchor),
            lastNameEntry.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView3.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 10),
            lineView3.heightAnchor.constraint(equalToConstant: 1),
            lineView3.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView3.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: lineView3.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            userNameEntry.centerYAnchor.constraint(equalTo: userNameLabel.centerYAnchor),
            userNameEntry.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView4.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            lineView4.heightAnchor.constraint(equalToConstant: 1),
            lineView4.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView4.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            genderLabel.topAnchor.constraint(equalTo: lineView4.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            genderEntry.centerYAnchor.constraint(equalTo: genderLabel.centerYAnchor),
            genderEntry.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView5.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            lineView5.heightAnchor.constraint(equalToConstant: 1),
            lineView5.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView5.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            dobLabel.topAnchor.constraint(equalTo: lineView5.bottomAnchor, constant: 10),
            dobLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            dobEntry.centerYAnchor.constraint(equalTo: dobLabel.centerYAnchor),
            dobEntry.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView6.topAnchor.constraint(equalTo: dobLabel.bottomAnchor, constant: 10),
            lineView6.heightAnchor.constraint(equalToConstant: 1),
            lineView6.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView6.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            nextOfKinLabel.topAnchor.constraint(equalTo: lineView6.bottomAnchor, constant: 10),
            nextOfKinLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            nextOfKinEntry.centerYAnchor.constraint(equalTo: nextOfKinLabel.centerYAnchor),
            nextOfKinEntry.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lineView7.topAnchor.constraint(equalTo: nextOfKinLabel.bottomAnchor, constant: 10),
            lineView7.heightAnchor.constraint(equalToConstant: 1),
            lineView7.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            lineView7.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .link
        self.navigationItem.title = "Profile"
        
        profilDetails()
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        // function to change call when the segmentedControl is used
    }
    
    func profilDetails() {
        let url = "https://609908f199011f001713ffb0.mockapi.io/api/v1/profile/1"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data,response,error in
            guard let data = data, error == nil else{
                print (error?.localizedDescription as Any)
                return
            }
            print(data)
            
            var json: ProfileResponse?
            do{
                json = try JSONDecoder().decode(ProfileResponse.self, from: data)
            }
            catch{
                print(error.localizedDescription)
            }
            guard let result = json else {
                return
            }
            
            let firstname = result.firstName
            let lastname = result.lastName
            let username = result.userName
            let gender = result.gender
            let dob = result.dateOfBirth
            let nextOfKin = result.nextOfKin
            DispatchQueue.main.async {
                self.firstNameEntry.text = firstname
                self.lastNameEntry.text = lastname
                self.userNameEntry.text = username
                self.dobEntry.text = dob
                self.nextOfKinEntry.text =  nextOfKin
                if gender == true{
                    self.genderEntry.text = "male"
                } else{
                    self.genderEntry.text = "female"
                }
            }
        }).resume()
    }
}
