//
//  Controller.swift
//  CatsTower
//
//  Created by Valeria Henao on 30/07/22.
//

import Foundation
import UIKit

class Controller {
    static func InfoCatViewController() -> InfoCatViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: Constants.StoryboardName.InfoCat, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: Constants.ViewControllerName.infocat) as! InfoCatViewController
        return viewController
    }
    
    static func HistoryCatViewController() -> HistoryOfVotesViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: Constants.StoryboardName.HistoryOfVotes, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: Constants.ViewControllerName.historyVotes) as! HistoryOfVotesViewController
        return viewController
    }
}
