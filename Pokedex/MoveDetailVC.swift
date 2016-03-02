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
    var move: Move!
   
    @IBOutlet weak var learnTypeLbl: UILabel!
    @IBOutlet weak var levelReqLbl: UILabel!
    @IBOutlet weak var moveDescLbl: UILabel!
    @IBOutlet weak var moveNameLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    moveNameLbl.text = move.moveName
    levelReqLbl.text = move.levelReq
    learnTypeLbl.text = move.learnType
    }
    
    
 
    @IBAction func backBtnMovePressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    
}
