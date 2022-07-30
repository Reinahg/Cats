//
//  CatsInfoRepository.swift
//  CatsTower
//
//  Created by Valeria Henao on 28/07/22.
//

import Foundation
import RealmSwift

class CatsInfoRepository {
    
    static let catsDao = CatDAO()
    
    public static func getBreeds(completionHandler : @escaping (Bool,[Breed]?) -> Void){
        CatsInfoDataSource.getBreeds(){
            isCorrect,breeds  in
            if isCorrect {
                self.checkBreeds(breeds: breeds)
                completionHandler(true, breeds)
            } else {
                completionHandler(false, nil)
            }
        }
    }
    
    static func checkBreeds(breeds: [Breed]?){
        if let breeds = breeds {
            self.insertIntoDatabase(breeds: breeds)
        }
    }
    
    static func insertIntoDatabase(breeds: [Breed]){
        for breed in breeds {
            if !self.catsDao.isCatById(id: breed.id) {
                let cat = Cat()
                cat.id = breed.id
                cat.name = breed.name
                cat.temperament = breed.temperament
                cat.origin = breed.origin
                cat.descriptionCat = breed.description
                cat.urlImage = breed.urlImage
                cat.wikipedia_url = breed.wikipedia_url
                
                self.catsDao.insert(cat: cat)
            }
        }
    }
}
