//
//  ViewController.swift
//  CatsTower
//
//  Created by Valeria Henao on 28/07/22.
//

import UIKit

class VoteViewController: UIViewController {

    var breeds: [Breed] = []
    @IBOutlet weak var lblSeen: UILabel!
    @IBOutlet weak var btnLikes: UIButton!
    @IBOutlet weak var cat_image: UIImageView!
    @IBOutlet weak var like_cat: UIImageView!
    @IBOutlet weak var dislike_cat: UIImageView!

    @IBOutlet weak var btnReload: UIButton!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CatsInfoViewModel.getBreeds(){
            (isCorrect, breeds) in
            if isCorrect {
                self.checkAndInsertBreeds(breed: breeds)
            }
        }
    }
    
    private func configureTargets(){
        let tapGestureRecognizerLike = UITapGestureRecognizer(target: self, action: #selector(likedCat(tapGestureRecognizer:)))
        like_cat.isUserInteractionEnabled = true
        like_cat.addGestureRecognizer(tapGestureRecognizerLike)
        
        let tapGestureRecognizerDislike = UITapGestureRecognizer(target: self, action: #selector(dislikedCat(tapGestureRecognizer:)))
        dislike_cat.isUserInteractionEnabled = true
        dislike_cat.addGestureRecognizer(tapGestureRecognizerDislike)
    }
    
    @objc func likedCat(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.nextCat(liked: true)
    }
    
    @objc func dislikedCat(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.nextCat(liked: false)
    }
    
    private func nextCat(liked: Bool){
        if index < 9 {
            insertLikeOrDislike(liked: liked)
            index += 1
            cat_image.downloaded(from: breeds[index].urlImage)
        } else {
            hideOrShowEmptyData(show: true)
        }
    }
    
    private func insertLikeOrDislike(liked: Bool){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.VariablesAPI.format_date
        VoteViewModel.insertLikeOrDislike(liked: liked, dateLiked: dateFormatter.string(from: date), idCat: breeds[index].id){
            (isCorrect) in
            
        }
    }

    @IBAction func actionReload(_ sender: Any) {
        VoteViewModel.deleteAllLikes(){
            (isCorrect) in
            if isCorrect {
                self.index = 0
                self.hideOrShowEmptyData(show: false)
            }
        }
    }
    
    private func hideOrShowEmptyData(show: Bool){
        lblSeen.isHidden = !show
        btnReload.isHidden = !show
        cat_image.isHidden = show
        like_cat.isHidden = show
        dislike_cat.isHidden = show
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func checkAndInsertBreeds(breed: [Breed]?){
        if let breedsData = breed {
            self.breeds = breedsData
            self.configureData()
        }
    }
    
    private func configureData(){
        cat_image.downloaded(from: breeds[index].urlImage)
        configureTargets()
    }
    
    @IBAction func actionLikees(_ sender: Any) {
        let vc = Controller.HistoryCatViewController()
        self.present(vc, animated: true)
    }
}

