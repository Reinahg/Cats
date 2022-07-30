//
//  CatsInfoUseCase.swift
//  CatsTower
//
//  Created by Valeria Henao on 28/07/22.
//

import Foundation

class CatsInfoUseCase {
    public static func getBreeds(completionHandler : @escaping (Bool,[Breed]?) -> Void){
        CatsInfoRepository.getBreeds(completionHandler: completionHandler)
    }
}
