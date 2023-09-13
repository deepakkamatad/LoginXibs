//
//  ViewController.swift
//  LoginXibs
//
//  Created by Deepak Basavaraj Kamatad on 08/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Login: Login!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        Login.Login("")
        }
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        Login.ForgotPassword("")
        }
}

