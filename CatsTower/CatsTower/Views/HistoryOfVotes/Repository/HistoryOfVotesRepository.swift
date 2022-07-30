//
//  HistoryOfVotesRepository.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import Foundation

class HistoryOfVotesRepository {
    static let catsDao = CatDAO()
    
    public static func getAllCats(completionHandler : @escaping ([Cat]) -> Void){
        completionHandler(catsDao.loadCats())
    }
    
}
