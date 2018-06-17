//
//  HomeViewController.swift
//  playlistapp
//
//  Created by Hannah Li on 6/13/18.
//  Copyright © 2018 Hannah Li. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 130
        for i in 0...1000 {
            data.append("\(i)")
        }
        
        tableView.dataSource = self
    }
    
    private var data: [String] = []
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signOutPressed(_ sender: UIStoryboardSegue) {
        try! Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
        print("Singing Out!")
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell")! //1.
        
        let text = data[indexPath.row] //2.
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text = text //3.
        
        return cell //4.
    }
    
}
