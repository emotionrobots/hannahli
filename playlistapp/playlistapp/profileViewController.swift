//
//  profileViewController.swift
//  playlistapp
//
//  Created by Hannah Li on 6/14/18.
//  Copyright © 2018 Hannah Li. All rights reserved.
//

import UIKit
import Firebase
class profileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var myProfileImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = (UIColor.white).cgColor
        profileImage.layer.borderWidth = 1.0
        profileImage.image = myProfileImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
