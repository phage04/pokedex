//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 27/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var nextEvoImgStack: UIStackView!
    @IBOutlet weak var nextEvoStack: UIView!
    @IBOutlet weak var weightStack: UIStackView!
    @IBOutlet weak var heightStack: UIStackView!
    @IBOutlet weak var borderStack: UIView!
    @IBOutlet weak var typeAndDefStack: UIStackView!
    @IBOutlet weak var imageAndDescStack: UIStackView!
    @IBOutlet weak var movesTable: UITableView!
    
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
    var move = [Move]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            movesTable.hidden = true
            nameLbl.text = pokemon.name.capitalizedString
            let img = UIImage(named: "\(pokemon.pokedexId)")
            mainImage.image = img
            currentEvoImg.image = img
            
            
            pokemon.downloadPokemonDetails { () -> () in
                
                self.updateUI()
                
            }

           
            
        }
    
    func updateUI() {
        
            movesTable.hidden = true
            imageAndDescStack.hidden = false
            typeAndDefStack.hidden = false
            heightStack.hidden = false
            weightStack.hidden = false
            borderStack.hidden = false
            nextEvoImgStack.hidden = false
            nextEvoStack.hidden = false
        
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
        
        downloadPokemonMoves()
        
    }
    
    func updateUISegment2 () {
        
        movesTable.hidden = false
        imageAndDescStack.hidden = true
        typeAndDefStack.hidden = true
        heightStack.hidden = true
        weightStack.hidden = true
        borderStack.hidden = true
        nextEvoImgStack.hidden = true
        nextEvoStack.hidden = true
        
    
        
    
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
            movesTable.reloadData()
            
            
        default:
            break;
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = movesTable.dequeueReusableCellWithIdentifier("PokemonDetailVC", forIndexPath: indexPath)
        
        if pokemon.moveNames[indexPath.row] != "" {
        cell.textLabel?.text = "\(pokemon.moveNames[indexPath.row])"
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        for var x = 0; x < move.count; x++ {
            
            if pokemon.moveNames[indexPath.row] == move[x].moveName {
                performSegueWithIdentifier("MoveDetailVC", sender: move[x])
            }
        }
    }
    

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return pokemon.moveNames.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MoveDetailVC" {
            if let moveDetailsVC = segue.destinationViewController as? MoveDetailVC{
                if let move = sender as? Move {
                    moveDetailsVC.move = move
                }
            }
        }
    }

    func downloadPokemonMoves () {
        
        
        let url = NSURL(string: pokemon.pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let pokeMoves = dict["moves"] as? [Dictionary<String, AnyObject>] where pokeMoves.count > 0 {
                    
                    
                    for var x = 0; x < pokeMoves.count; x++ {

                        
                        let MoveIt = Move(moveName: "\(pokeMoves[x]["name"])", moveDesc: "\(pokeMoves[x]["name"])", levelReq: "\(pokeMoves[x]["level"])", learnType: "\(pokeMoves[x]["learn_type"])")
                        
                        
                        self.move.append(MoveIt)

  
                        
                    }
    
                }
  
            }
  
        }

    }
}
