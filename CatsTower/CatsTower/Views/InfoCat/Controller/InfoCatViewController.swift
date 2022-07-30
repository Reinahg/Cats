//
//  InfoCatViewController.swift
//  CatsTower
//
//  Created by Valeria Henao on 29/07/22.
//

import UIKit

class InfoCatViewController: UIViewController {
    var breed : Breed?
    
    @IBOutlet weak var descriptionCat: UILabel!
    @IBOutlet weak var wikipedia: UILabel!
    @IBOutlet weak var originCat: UILabel!
    @IBOutlet weak var TemperamentCat: UILabel!
    @IBOutlet weak var nameCat: UILabel!
    @IBOutlet weak var imageCat: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLabels()
    }
    
    private func setLabels(){
        if let infoGato = breed {
            descriptionCat.text = infoGato.description
            wikipedia.text = infoGato.wikipedia_url
            originCat.text = infoGato.origin
            TemperamentCat.text = infoGato.temperament
            nameCat.text = infoGato.name
            imageCat.downloaded(from: infoGato.urlImage)
        }
    }

}
