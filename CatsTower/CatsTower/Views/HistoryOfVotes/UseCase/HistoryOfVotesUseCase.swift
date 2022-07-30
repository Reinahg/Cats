//
//  HistoryOfVotesUseCase.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import Foundation

class HistoryOfVotesUseCase{
    public static func getAllCats(completionHandler : @escaping ([Cat]) -> Void){
        HistoryOfVotesRepository.getAllCats(){
            (cats) in
            
            var filteredCats = [Cat]()
            for cat in cats {
                if let _ = cat.liked {
                    filteredCats.append(cat)
                }
            }
            
            completionHandler(filteredCats)
        }
    }
}
