//
//  MovieCell.swift
//  Lecture15.AnaDzebniauri.TableView
//
//  Created by Ana Dzebniauri on 21.07.22.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var moveToWatchlist: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func moveToWatchlist(_ sender: Any) {
    }
}
