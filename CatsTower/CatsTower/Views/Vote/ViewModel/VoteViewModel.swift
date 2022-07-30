//
//  VoteViewModel.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import Foundation

class VoteViewModel {
    public static func insertLikeOrDislike(liked: Bool, dateLiked: String, idCat: String, completionHandler : @escaping (Bool) -> Void){
        VoteUseCase.insertLikeOrDislike(liked: liked, dateLiked: dateLiked, idCat: idCat, completionHandler: completionHandler)
    }
    
    public static func deleteAllLikes(completionHandler : @escaping (Bool) -> Void){
        VoteUseCase.deleteAllLikes(completionHandler: completionHandler)
    }
}
