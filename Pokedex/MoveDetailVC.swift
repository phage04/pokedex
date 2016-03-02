//
//  MoveDetailVC.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 01/03/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit
import Alamofire

class MoveDetailVC: UIViewController {

    var pokemon: Pokemon!
    var move: Move!
   
    @IBOutlet weak var learnTypeLbl: UILabel!
    @IBOutlet weak var levelReqLbl: UILabel!
    @IBOutlet weak var moveDescLbl: UILabel!
    @IBOutlet weak var moveNameLbl: UILabel!
    
    var moveDescription: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMoveDescription { () -> () in
            
            
        }


    }
    
    func updateMoveUI () {
        moveNameLbl.text = move.moveName
        levelReqLbl.text = move.levelReq
        learnTypeLbl.text = move.learnType
        moveDescLbl.text = moveDescription
    }
    
    func getMoveDescription(completed: DownloadComplete){
        let nsurl = NSURL(string: "\(URL_BASE)\(move.moveDesc)")!
        
        Alamofire.request(.GET, nsurl).responseJSON { response in
            let result = response.result
            
            if let descDict = result.value as? Dictionary<String, AnyObject> {
                
                if let description = descDict["description"] as? String {
                    self.moveDescription = description
                    self.updateMoveUI()
                }
            }
        }

    }
    
    
 
    @IBAction func backBtnMovePressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    
}
