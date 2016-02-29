//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 27/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    @IBOutlet weak var segmentControl: UISegmentedControl!
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
            
            nameLbl.text = pokemon.name.capitalizedString
            let img = UIImage(named: "\(pokemon.pokedexId)")
            mainImage.image = img
            currentEvoImg.image = img
            
            
            pokemon.downloadPokemonDetails { () -> () in
            
             self.updateUI()
                
                
            }
           
            
        }
    
    func updateUI() {
        
            descriptionLabel.text = pokemon.description
            typeLabel.text = pokemon.type.capitalizedString
            defenseLabel.text = pokemon.defense
            attackLabel.text = pokemon.attack
            heightLabel.text = pokemon.height
            weightLabel.text = pokemon.weight
            pokedexIdLabel.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
                evoLabel.text = str
            }
        }
        
        
        
    }
    
    func updateUISegment2 () {
        
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func segmentChanged(sender: AnyObject) {
        
        switch segmentControl.selectedSegmentIndex {
            
        case 0:
            updateUI()
        case 1:
            updateUISegment2()            
        default:
            break;
        }
        
    }
    

 
    



}
