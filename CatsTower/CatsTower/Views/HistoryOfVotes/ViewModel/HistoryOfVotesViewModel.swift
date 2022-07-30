//
//  HistoryOfVotesViewModel.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import Foundation

class HistoryOfVotesViewModel {
    public static func getAllCats(completionHandler : @escaping ([Cat]) -> Void){
        HistoryOfVotesUseCase.getAllCats(completionHandler: completionHandler)
    }
}
