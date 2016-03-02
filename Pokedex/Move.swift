//
//  Move.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 01/03/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import Foundation


class Move {
    
    private var _learnType:String!
    private var _levelReq: String!
    private var _moveDesc: String!
    private var _moveName: String!
    private var _pokemonUrl: String!
    private var _pokedexId: Int!
    
    
    var moveName: String {
        
        if _moveName == nil {
            _moveName = ""
        }
        return _moveName
        
    }
    
    var learnType: String {
        
        set {
        _learnType = learnType
        }
        
        get {
        if _learnType == nil {
            _learnType = ""
        }
        return _learnType
        }
        
    }
    
    var levelReq: String {
        
        set {
            _levelReq = levelReq
        }
        get {
        if _levelReq == nil || _levelReq == "" {
            _levelReq = "None"
        }
        return _levelReq
        }
    }
    
    var moveDesc: String {
        
        if _moveDesc == nil {
            _moveDesc = ""
        }
        return _moveDesc
        
    }

    init (moveName: String, learnType: String, levelReq: String) {
     
        self._moveName = moveName
        self._learnType = learnType
        self._levelReq = levelReq
       // self._moveDesc = moveDesc
    }
}



    
    
   