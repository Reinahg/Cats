//
//  Cat.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import Foundation
import RealmSwift

class Cat: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name : String?
    @Persisted var liked : Bool?
    @Persisted var dateLiked : String?
    @Persisted var temperament : String?
    @Persisted var origin : String?
    @Persisted var descriptionCat : String?
    @Persisted var urlImage : String?
    @Persisted var wikipedia_url : String?
}
