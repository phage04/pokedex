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
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var defenseLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var pokedexIdLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var attackLabel: UILabel!
  
    @IBOutlet weak var currentEvoImg: UIImageView!
        
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    @IBOutlet weak var evoLabel: UILabel!
    
    
    var pokemon: Pokemon!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            nameLbl.text = pokemon.name
            mainImage.image = UIImage(named: "\(pokemon.pokedexId)")
            
            
            
            pokemon.downloadPokemonDetails { () -> () in
            //this will be called when download is done
            }
           
            
        }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    



}
