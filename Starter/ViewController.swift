//
//  ViewController.swift
//  Starter
//
//  Created by Ammar AlTahhan on 03/04/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit
import BulletinBoard

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var bulletinManager: BulletinManager = {
        let page = PageBulletinItem(title: "Push Notifications")
        page.image = UIImage(named: "...")
        page.descriptionText = "Receive push notifications when new photos of pets are available."
        page.actionButtonTitle = "Subscribe"
        page.alternativeButtonTitle = "Not now"
        page.isDismissable = true
        let rootItem: BulletinItem = page
        return BulletinManager(rootItem: rootItem)
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        bulletinManager.backgroundViewStyle = .blurredDark
        bulletinManager.prepare()
        bulletinManager.presentBulletin(above: self)
    }

}

