//
//  editProfileViewController.swift
//  playlistapp
//
//  Created by Hannah Li on 6/14/18.
//  Copyright © 2018 Hannah Li. All rights reserved.
//

import UIKit

class editProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = (UIColor.gray).cgColor
        profileImage.layer.borderWidth = 1.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        print("Cancel Button Pressed")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editProfPhotoButtonPressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true){
            //After it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            profileImage.image = image
        }
        else{
            //Error message
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        print("done pressed")
    }
    
    
}
