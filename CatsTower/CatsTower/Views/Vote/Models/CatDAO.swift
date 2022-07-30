//
//  CatDAO.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import Foundation
import RealmSwift

public class CatDAO {
    let realm = try! Realm()
    
    //Mark: - Data Manipulation Methods
    func insert(cat: Cat){
        do {
            try realm.write {
                realm.add(cat)
                print("Insert cat")
            }
        } catch {
            print("Error saving cat \(error)")
        }
    }
    
    func saveList(cats: [Cat]){
        do {
            try realm.write {
                realm.add(cats)
                print("Saved cats")
            }
        } catch {
            print("Error saving cats \(error)")
        }
    }
    
    func loadCats() -> [Cat]{
        let catsDB = realm.objects(Cat.self).toArray()
        return catsDB
    }
    
    func getCatById(id: String) -> Cat?{
        let cat = realm.object(ofType: Cat.self, forPrimaryKey: id)
        return cat
    }
    
    func isCatById(id: String) -> Bool{
        if let cat = realm.object(ofType: Cat.self, forPrimaryKey: id){
            return true
        }
        return false
    }
    
    func setLikedDislikedCat(liked: Bool, dateLiked: String, id: String){
        try! realm.write {
            let catDB = getCatById(id: id)
            catDB?.setValue(liked, forKey: "liked")
            catDB?.setValue(dateLiked, forKey: "dateLiked")
        }
    }
    
    func deleteOneCat(id: String){
        do {
            try realm.write {
                if let cat = realm.object(ofType: Cat.self, forPrimaryKey: id){
                    realm.delete(cat)
                    print("Deleted cats")
                }
            }
        } catch {
            print("Error saving cats \(error)")
        }
    }
    
    func deleteAllCats(){
        do {
            try realm.write {
                realm.deleteAll()
                print("Deleted cats")
            }
        } catch {
            print("Error saving cats \(error)")
        }
    }
    
    func deleteAllLikes(){
        do {
            try realm.write {
                let catsDB = realm.objects(Cat.self).toArray()
                for element in catsDB {
                    element.setValue(nil, forKey: "dateLiked")
                    element.setValue(nil, forKey: "liked")
                }
                print(catsDB)
            }
        } catch {
            print("Error saving cats \(error)")
        }
    }
}

extension Results {
   func toArray() -> [Element] {
     return compactMap {
       $0
     }
   }
}
