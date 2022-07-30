//
//  HistoryOfVotesViewController.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import UIKit

class HistoryOfVotesViewController: UIViewController {

    @IBOutlet weak var lblNoCats: UILabel!
    @IBOutlet weak var collectionVotes: UICollectionView!
    
    var cats: [Cat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVotes.dataSource = self
        collectionVotes.delegate = self
        collectionVotes.register(UINib.init(nibName: Constants.CollectionCell.CatsCell, bundle: nil), forCellWithReuseIdentifier: Constants.CollectionCell.identifier)
        
        HistoryOfVotesViewModel.getAllCats(){
            cats in
            self.cats = cats
            self.checkIfArrayIsEmpty()
            self.collectionVotes.reloadData()
        }
    }
    
    private func checkIfArrayIsEmpty(){
        if cats.isEmpty {
            lblNoCats.isHidden = false
            collectionVotes.isHidden = true
        } else {
            lblNoCats.isHidden = true
            collectionVotes.isHidden = false
        }
    }
}

extension HistoryOfVotesViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionCell.identifier, for: indexPath) as! CatsCollectionViewCell
        let row = cats[indexPath.row];
        cell.lblName.text = row.name
        cell.imageCat.downloaded(from: row.urlImage!)
        
        if let liked = row.liked {
            if liked {
                cell.imageAction.image = UIImage.heartIcon()
                cell.imageAction.tintColor = UIColor.systemPink
            } else {
                cell.imageAction.image = UIImage.breakHeartIcon()
                cell.imageAction.tintColor = UIColor.darkRed()
            }
        }
        cell.lblDate.text = row.dateLiked
        return cell
    }
}
