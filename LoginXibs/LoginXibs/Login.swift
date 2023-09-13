//
//  Login.swift
//  LoginXibs
//
//  Created by Deepak Basavaraj Kamatad on 08/09/23.
//

import UIKit

class Login: UIView {
    
    
    @IBOutlet weak var forgotPassowrd: UIButton!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Username: UITextField!
    
   var iconClick=false
    let imageicon = UIImageView()
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }

        private func commonInit() {
            // Load the XIB file
            
            if let nibView = Bundle.main.loadNibNamed("Login", owner: self, options: nil)?.first as? UIView {
                nibView.frame = bounds
                addSubview(nibView)
            }
            addUnderline(to: Username)
            addUnderline(to: Password)
            Password.isSecureTextEntry=true
            Username.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            Password.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

                // Call the updateLoginButtonState initially
            updateLoginButtonState()


            imageicon.image = UIImage(named: "closedeye")
            let contentView = UIView()
            contentView.addSubview(imageicon)
            contentView.frame=CGRect(x: 0, y: 0, width: UIImage(named: "closedeye")!.size.width, height: UIImage(named: "closedeye")!.size.height)

            imageicon.frame=CGRect(x: -10, y: 0, width: UIImage(named: "closedeye")!.size.width, height: UIImage(named: "closedeye")!.size.height)

            Password.rightView = contentView
            Password.rightViewMode = .always

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            imageicon.isUserInteractionEnabled = true
            imageicon.addGestureRecognizer(tapGestureRecognizer)
        }
    
    private func addUnderline(to textField: UITextField) {

            let bottomBorder = CALayer()

            bottomBorder.frame = CGRect(x: 0.0, y: textField.frame.size.height - 1, width: textField.frame.size.width + 40, height: 1.0)

            bottomBorder.backgroundColor = UIColor.black.cgColor

            textField.layer.addSublayer(bottomBorder)

        }
    @IBAction func Login(_ sender: Any) {
        let username = Username.text ?? ""
        let password = Password.text ?? ""
        // Implement your login validation logic here
        print(username,password)
        
    }
    @IBAction func ForgotPassword(_ sender: Any) {
        print("Forgot Password")
    }
    
    @objc private func textFieldDidChange() {
        // Call the updateLoginButtonState whenever a text field changes
        updateLoginButtonState()
    }
    
    private func updateLoginButtonState() {
        guard let username = Username.text, !username.isEmpty,
              let password = Password.text, !password.isEmpty else {
            // If either the username or password is empty, disable the Login button
            Login.isEnabled = false
            return
        }
        
        // If both fields have content, enable the Login button
        Login.isEnabled = true
    }
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        let tappedImage=tapGestureRecognizer.view as! UIImageView
        
        if iconClick{
            iconClick = false
            tappedImage.image = UIImage(named: "openedeye")
            Password.isSecureTextEntry = false
        }
        else {
            iconClick = true
            tappedImage.image = UIImage(named: "closedeye")
            Password.isSecureTextEntry = true
        }
    }
}
