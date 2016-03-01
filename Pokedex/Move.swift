//
//  Move.swift
//  Pokedex
//
//  Created by Lyle Christianne Jover on 01/03/2016.
//  Copyright © 2016 Lyle Christianne Jover. All rights reserved.
//

import Foundation
import Alamofire

class Move {
    
    private var _learnType: String!
    private var _levelReq: String!
    private var _moveDesc: String!
    private var _moveName: String!
    
    var movename: String {
        
        if _moveName == nil {
            _moveName = ""
        }
        return _moveName
        
    }
    
    var learntype: String {
        
        if _learnType == nil {
            _learnType = ""
        }
        return _learnType
        
    }
    
    var levelreq: String {
        
        if _levelReq == nil {
            _levelReq = ""
        }
        return _levelReq
        
    }
    
    var movedesc: String {
        
        if _moveDesc == nil {
            _moveDesc = ""
        }
        return _moveDesc
        
    }
    
    
    
    
    init (name: String, learntype: String, movedesc: String, levelreq: String){
        
        self._moveName = name
        self._learnType = learntype
        self._levelReq = levelreq
        self._moveDesc = movedesc
    }
    
    
    func downloadPokemonMoves (completed: DownloadComplete, pokedexid: Int) {
        
        
        
    }
    
    
    
    
    
}
