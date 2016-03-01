//
//  MoveDetailVC.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 01/03/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit

class MoveDetailVC: UIViewController {

    var pokemon: Pokemon!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func backBtnMovePressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    
}
