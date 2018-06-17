//
//  registerViewController.swift
//  playlistapp
//
//  Created by Hannah Li on 6/13/18.
//  Copyright © 2018 Hannah Li. All rights reserved.
//

import UIKit
import Firebase

class registerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var dateOfBirthTF: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    var databaseRef: DatabaseReference!
    var storageRef: StorageReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = (UIColor.gray).cgColor
        profileImage.layer.borderWidth = 1.0
        
        databaseRef = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //error alert function
    func displayError(userMessage:String)
    {
        var myAlert = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    /*func signUp(){
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) {user, error in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
                /*let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                 changeRequest?.displayName = self.usernameTF.text!
                 changeRequest?.commitChanges{ error in
                 if error == nil {
                 print("User displayname changed!")
                 self.dismiss(animated: false, completion: nil)
                 }
                 }*/
            }else{
                print("User Created!")
                let homePageVC = HomeViewController()
                self.present(homePageVC, animated: true, completion: nil)
            }
        }
    }*/
    @IBAction func nextButtonPressed(_ sender: Any) {
        print("Next Button Pressed")
        //checking that all fields are filled in
        if(firstNameTF.text?.isEmpty)! ||
            (lastNameTF.text?.isEmpty)! ||
            (usernameTF.text?.isEmpty)! ||
            (passwordTF.text?.isEmpty)! ||
            (confirmPasswordTF.text?.isEmpty)! ||
            (dateOfBirthTF.text?.isEmpty)! ||
            (emailTF.text?.isEmpty)!{
            //Display alert message if not all fields are filled in, and return
            displayError(userMessage: "All fields are required.")
            return
        }else{
            //segues between register view controller and profile view controller
            Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) {user, error in
                if error != nil {
                    print("Error: \(error?.localizedDescription)")
                    /*let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                     changeRequest?.displayName = self.usernameTF.text!
                     changeRequest?.commitChanges{ error in
                     if error == nil {
                     print("User displayname changed!")
                     self.dismiss(animated: false, completion: nil)
                     }
                     }*/
                }else{
                    print("User Created!")
                    let homePageVC = HomeViewController()
                    self.present(homePageVC, animated: true, completion: nil)
                }
            }
            performSegue(withIdentifier: "registerToHome", sender: self)
            print("segue performed")
        }
    }//end function

    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectProfilePhotoPressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true) {
            //After it is complete
        }
    }//end function
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.image = image
        } else {
            //Error message
        }
        self.dismiss(animated: true, completion: nil)
    } // end function
    
} //end class


