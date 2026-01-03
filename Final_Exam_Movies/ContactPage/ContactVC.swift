//
//  ContactVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 03.01.26.
//

import UIKit

class ContactVC: UIViewController {
    
    let titleLabel = UILabel()
    let phoneIcon = UIImageView()
    let phoneLabel = UILabel()
    let emailIcon = UIImageView()
    let emailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        setupContacts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animation(view: phoneIcon, delay: 0.9)
        animation(view: emailIcon, delay: 0.8)
        
    }
    func setupUI() {
        [titleLabel,phoneIcon, phoneLabel, emailIcon, emailLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            phoneIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            phoneIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneIcon.widthAnchor.constraint(equalToConstant: 22),
            phoneIcon.heightAnchor.constraint(equalToConstant: 22),
            
            phoneLabel.centerYAnchor.constraint(equalTo: phoneIcon.centerYAnchor),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            
            emailIcon.topAnchor.constraint(equalTo: phoneIcon.bottomAnchor, constant: 20),
            emailIcon.leadingAnchor.constraint(equalTo: phoneIcon.leadingAnchor),
            emailIcon.widthAnchor.constraint(equalToConstant: 22),
            emailIcon.heightAnchor.constraint(equalToConstant: 22),
            
            emailLabel.centerYAnchor.constraint(equalTo: emailIcon.centerYAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: emailIcon.trailingAnchor, constant: 10)
        ])
        
        titleLabel.text = "Contact Information"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        phoneIcon.image = UIImage(systemName: "phone")
        phoneIcon.tintColor = .systemGray
        
        phoneLabel.text = "+995 598 12 34 24"
        phoneLabel.textColor = .white
        
        emailIcon.image = UIImage(systemName: "envelope")
        emailIcon.tintColor = .systemGray
        
        emailLabel.text = "salagidze@gmail.com"
        emailLabel.textColor = .white
    }
    
    func setupContacts() {
        phoneIcon.isUserInteractionEnabled = true
        phoneLabel.isUserInteractionEnabled = true
        emailIcon.isUserInteractionEnabled = true
        emailLabel.isUserInteractionEnabled = true
        
        let phoneTap = UITapGestureRecognizer(target: self, action: #selector(phoneTapped))
        phoneIcon.addGestureRecognizer(phoneTap)
        phoneLabel.addGestureRecognizer(phoneTap)
        
        let emailTap = UITapGestureRecognizer(target: self, action: #selector(emailTapped))
        emailIcon.addGestureRecognizer(emailTap)
        emailLabel.addGestureRecognizer(emailTap)
    }
    
    @objc func phoneTapped() {
        let number = "+995 598 12 34 24"
        let alert = UIAlertController(title: "Contact", message: "Do you want to call \(number)?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Call", style: .default) { _ in
            if let url = URL(string: "tel://\(number)") {
                UIApplication.shared.open(url)
            }
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc func emailTapped() {
        let email = "salagidze@gmail.com"
        
        if let gmailUrl = URL(string: "https://accounts.google.com/v3/signin/accountchooser?continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&dsh=S-1339166863%3A1767454243551024&emr=1&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&ifkv=Ac2yZaXRehY6pvN2tBtaiV1el_uF10IDKtQEe8rZHMO8FCLY29uE4cP2gawlNt3ELQbFFCGDypoJlg&osid=1&passive=1209600&service=mail&flowName=GlifWebSignIn&flowEntry=ServiceLogin"), UIApplication.shared.canOpenURL(gmailUrl) {
            UIApplication.shared.open(gmailUrl)
        } else if let mailToUrl = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(mailToUrl)
        }
    }
    
    func animation(view: UIView, delay: TimeInterval) {
        view.alpha = 0
        view.transform = CGAffineTransform(translationX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.7, delay: delay, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.4, options: [.curveEaseOut], animations: {
            view.alpha = 1
            view.transform = .identity
        } )
    }
}
