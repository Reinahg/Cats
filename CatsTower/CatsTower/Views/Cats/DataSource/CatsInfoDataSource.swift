//
//  CatsInfoDataSource.swift
//  CatsTower
//
//  Created by Valeria Henao on 28/07/22.
//

import Foundation
import Alamofire

class CatsInfoDataSource {
    public static func getBreeds(completionHandler : @escaping (Bool,[Breed]?) -> Void){
    
        let headers: HTTPHeaders = [
            Constants.Api.contentType: Constants.Api.contentTypeJSON,
            Constants.Api.x_api: Constants.Api.api_key
        ]
        
        AF.request(Constants.Api.url_breeds, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON {response in
            switch response.result {
            case .success(let value):
                if let JSON = value as? [[String: Any]] {
                    var breeds : [Breed] = []
                    for item in JSON {
                        
                        let imageData = item[Constants.VariablesAPI.image] as? [String: Any]
                        
                        let breed = Breed()
                        
                        breed.id = item[Constants.VariablesAPI.id] as! String
                        breed.name = item[Constants.VariablesAPI.name] as! String
                        breed.temperament = item[Constants.VariablesAPI.temperament] as! String
                        breed.origin = item[Constants.VariablesAPI.origin] as! String
                        breed.description = item[Constants.VariablesAPI.description] as! String
                        breed.urlImage = imageData?[Constants.VariablesAPI.url] as! String
                        breed.wikipedia_url = item[Constants.VariablesAPI.wikipedia_url] as! String
                        
                        breeds.append(breed)
                    }
                    
                    completionHandler(true, breeds)
                } else {
                    completionHandler(false, nil)
                }
            case .failure(_):
                completionHandler(false, nil)
            }
        }
        
    }
}
