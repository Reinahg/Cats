//
//  CatsInfoViewModel.swift
//  CatsTower
//
//  Created by Valeria Henao on 28/07/22.
//

import Foundation

class CatsInfoViewModel {
    public static func getBreeds(completionHandler : @escaping (Bool,[Breed]?) -> Void){
        CatsInfoUseCase.getBreeds(completionHandler: completionHandler)
    }
}
