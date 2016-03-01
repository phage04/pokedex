//
//  Pokemon.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 23/02/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionText: String!
    private var _pokemonUrl: String!
    private var _nextEvoId: String!
    private var _nextEvoLvl: String!
    private var _moveNames = [String]()
    private var _moveLearnType = [String]()
    private var _moveLevel = [String]()
    
    
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var moveNames: [String] {
        return _moveNames
    }
    
    var moveLearnType: [String] {
        return _moveLearnType
    }
    
    var moveLevel: [String] {
        return _moveLevel
    }
    
    var description: String {
        
            if _description == nil {
                _description = ""
            }
            return _description
    
    }
    
    var type: String {
        
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionText: String {
        
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    var nextEvolutionId: String {
        if _nextEvoId == nil {
            _nextEvoId = ""
        }
        return _nextEvoId
    }

    var pokemonUrl: String {
        if _pokemonUrl == nil {
            _pokemonUrl = ""
        }
        return _pokemonUrl
    }
    var nextEvolutionLvl: String {
        if _nextEvoLvl == nil {
            _nextEvoLvl = ""
        }
        return _nextEvoLvl
    }
    
    
    
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
 
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                
            
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                
        
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self._type = name
                    }
                    
                    if types.count > 1 {
                        
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"] {
                               self._type! += "/\(name)"
                            }
                        }
                    }
                    
                } else {
                    self._type = ""
                }
                
    
            
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        
                      let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        
                        Alamofire.request(.GET, nsurl).responseJSON { response in
                            let result = response.result
                            
                            if let descDict = result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                   
                                }
                            }
                            //when this is done downloading, whether succeeds or fail, call complete.
                            completed()
                        }
                        
                    }
                } else {
                    self._description = ""
                }
                
                if let evolutions  = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolutions.count > 0 {
                    
                    if let to = evolutions[0]["to"] as? String {
                        
                        //Cant support mega pokemon right now but api still have mega data
                        if to.rangeOfString("mega") == nil {
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                
                                let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvoId = num
                                self._nextEvolutionText = to
                                
                                if let lvl = evolutions[0]["level"] as? Int {
                                    
                                    self._nextEvoLvl = "\(lvl)"
                                }
                                
                            
                                
                            }
                        }
                    }
                    
                }
                
                if let pokeMoves = dict["moves"] as? [Dictionary<String, AnyObject>] where pokeMoves.count > 0 {
                    
        
                    for var x = 0; x < pokeMoves.count; x++ {
                        
                        if let moveName = pokeMoves[x]["name"] as? String {
                            self._moveNames.append(moveName)
                            
                        }
                        
                        
                        
                    }

                    
                    
                }
                
                
                
            }
            
            
        }

        
    }
    
}
