//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 27/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
  
        
        var pokemon: Pokemon!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            nameLbl.text = pokemon.name
           
            
        }    



}
