//
//  PokeCellCollectionViewCell.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 23/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import UIKit

class PokeCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
}
