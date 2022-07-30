//
//  CatsInfoViewController.swift
//  CatsTower
//
//  Created by Valeria Henao on 28/07/22.
//

import UIKit

class CatsInfoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var breed: [Breed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: Constants.CollectionCell.CatsCell, bundle: nil), forCellWithReuseIdentifier: Constants.CollectionCell.identifier)
        
        CatsInfoViewModel.getBreeds(){
            (isCorrect, breeds) in
            if isCorrect {
                self.checkAndInsertBreeds(breed: breeds)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func checkAndInsertBreeds(breed: [Breed]?){
        if let breedsData = breed {
            self.breed = breedsData
            collectionView.reloadData()
        }
    }
}

extension CatsInfoViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        breed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionCell.identifier, for: indexPath) as! CatsCollectionViewCell
        let row = breed[indexPath.row];
        cell.lblName.text = row.name
        cell.imageCat.downloaded(from: row.urlImage)
        cell.lblDate.isHidden = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = breed[indexPath.row];
        let vc = Controller.InfoCatViewController()
        vc.breed = row
        self.present(vc, animated: true)
    }
    
}
