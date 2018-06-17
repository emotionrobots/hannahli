//
//  ViewController.swift
//  playlistapp
//
//  Created by Hannah Li on 6/13/18.
//  Copyright © 2018 Hannah Li. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let user = Auth.auth().currentUser{
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    @IBAction func loginPressed(_ sender: Any) {
        if((emailTF.text?.isEmpty)!) || (passwordTF.text?.isEmpty)!{
            displayAlert(userMessage: "All fields are required")
        }else {
            Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) {(user, error) in
                if error != nil
                {
                    self.dismiss(animated: false, completion: nil)
                    self.errorMessage.text! = "Wrong Password."
                    return
                    print("Error logging in: \(error?.localizedDescription)")
                }
                else {
                    self.errorMessage.text! = ""
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                    print("YAY!")
                }
            }
        }
    }
    
    @IBAction func newUserPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginToRegister", sender: self)
    }
    
    func displayAlert(userMessage:String) -> Void
    {
        let alertController = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

