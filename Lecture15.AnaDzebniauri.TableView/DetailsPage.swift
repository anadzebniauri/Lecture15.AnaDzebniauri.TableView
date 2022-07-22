//
//  DetailsPage.swift
//  Lecture15.AnaDzebniauri.TableView
//
//  Created by Ana Dzebniauri on 22.07.22.
//

import Foundation
import UIKit

class DetailsPage: UIViewController {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var lblIMDB: UILabel!
    @IBOutlet weak var mainActor: UILabel!
    @IBOutlet weak var isFavorite: UIImageView!
    
    var movie : Movie? {
        didSet {
            print(movie)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = movie?.title
        releaseDate.text = movie?.releaseDate
        lblIMDB.text = String(movie!.imdb)
        mainActor.text = movie?.mainActor
        
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        isFavorite.addGestureRecognizer(tapGR)
        isFavorite.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            movie!.isFavourite = !movie!.isFavourite
            
            let image = UIImage(systemName: movie!.isFavourite ? "star.fill" : "star")

            (sender.view as! UIImageView?)!.image = image
        }
    }
}

extension DetailsPage : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}

