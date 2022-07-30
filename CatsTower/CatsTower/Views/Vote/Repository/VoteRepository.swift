//
//  VoteRepository.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import Foundation

class VoteRepository {
    static let catsDao = CatDAO()
    
    public static func insertLikeOrDislike(liked: Bool, dateLiked: String, idCat: String, completionHandler : @escaping (Bool) -> Void){
        if catsDao.isCatById(id: idCat) {
            catsDao.setLikedDislikedCat(liked: liked, dateLiked: dateLiked, id: idCat)
            completionHandler(true)
        } else {
            completionHandler(false)
        }
    }
    
    public static func deleteAllLikes(completionHandler : @escaping (Bool) -> Void){
        catsDao.deleteAllLikes()
        completionHandler(true)
    }
    
}
