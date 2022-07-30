//
//  Constants.swift
//  CatsTower
//
//  Created by Valeria Henao on 28/07/22.
//

import Foundation

struct Constants {
    
    struct Api {
        static let api_key = "d0bc6fc1-49c3-469a-917e-1b355fa396d7"
        
        static let url_breeds = "https://api.thecatapi.com/v1/breeds?limit=10&page=0"
        
        static let contentTypeJSON = "application/json"
        static let contentType = "Content-Type"
        static let x_api = "x-api-key"
    }
    
    struct CollectionCell {
        static let identifier = "cell"
        static let CatsCell = "CatsCollectionViewCell"
    }
    
    struct ViewControllerName {
        static let infocat = "infocat"
        static let historyVotes = "historyVotes"
    }
    
    struct StoryboardName {
        static let InfoCat = "InfoCat"
        static let HistoryOfVotes = "HistoryOfVotes"
    }
    
    struct VariablesAPI {
        static let image = "image"
        static let id = "id"
        static let name = "name"
        static let temperament = "temperament"
        static let origin = "origin"
        static let description = "description"
        static let url = "url"
        static let wikipedia_url = "wikipedia_url"
        
        static let format_date = "YY, MMM d, HH:mm:ss"
    }
}
