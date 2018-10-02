//
//  ViewController.swift
//  SlideMenuUp
//
//  Created by MEIEEPgAAAAAAAAAAAAAAAAAAAEwFAYIKoZIhvcNAwcECKmNZ8DdASA6BBjbzvQl7td8tMu/dmaBLwm1VFqNmWIIVHE= on 10/02/2018.
//  Copyright (c) 2018 MEIEEPgAAAAAAAAAAAAAAAAAAAEwFAYIKoZIhvcNAwcECKmNZ8DdASA6BBjbzvQl7td8tMu/dmaBLwm1VFqNmWIIVHE=. All rights reserved.
//

import UIKit
import SlideMenuUp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Slide-Menu-Out"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showSlideOutMenu))
    }
    
    @objc private func showSlideOutMenu(){
        let menuVC = MenuViewController()
        menuVC.headerTitle = "Select from A menu"
        
        menuVC.didSelectItemWith = { index in
            print(index)
        }
        menuVC.menuItem = [MenuDataSource(title:"Account",image:#imageLiteral(resourceName: "account")),
                           MenuDataSource(title:"Report",image:#imageLiteral(resourceName: "report")),
                           MenuDataSource(title:"Setting",image:#imageLiteral(resourceName: "setting")),
                           MenuDataSource(title:"Close",image:#imageLiteral(resourceName: "close"))]
        menuVC.show()
        
    }
  

}

