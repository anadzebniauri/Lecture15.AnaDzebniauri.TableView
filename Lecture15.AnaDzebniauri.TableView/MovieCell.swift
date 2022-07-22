//
//  MovieCell.swift
//  Lecture15.AnaDzebniauri.TableView
//
//  Created by Ana Dzebniauri on 21.07.22.
//

import UIKit

protocol MovieCellDelegate {
    func moveToListBtn(_ cell: MovieCell)
}

class MovieCell: UITableViewCell {
    
    var delegate: MovieCellDelegate?
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var moveToListBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func moveToListBtn(_ sender: Any) {
        delegate!.moveToListBtn(self)
        }
    }

