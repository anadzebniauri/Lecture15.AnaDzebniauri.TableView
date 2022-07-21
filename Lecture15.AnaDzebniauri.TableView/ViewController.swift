//
//  ViewController.swift
//  Lecture15.AnaDzebniauri.TableView
//
//  Created by Ana Dzebniauri on 19.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var movies: [Movie] = [Movie(title: "Gone Girl", releaseDate: "October 3, 2014", imdb: 8.1, mainActor: "Ben Affleck", seen: true, isFavourite: true), Movie(title: "The Game", releaseDate: "September 12, 1997", imdb: 7.7, mainActor: "Michael Douglas", seen: false, isFavourite: false), Movie(title: "The Social Network", releaseDate: "October 27, 2010", imdb: 7.8, mainActor: "Jesse Eisenberg", seen: true, isFavourite: true), Movie(title: "Se7en", releaseDate: "September 22, 1995", imdb: 8.6, mainActor: "Morgan Freeman", seen: true, isFavourite: false), Movie(title: "Fight Club", releaseDate: "November 11, 1999", imdb: 8.8, mainActor: "Brad Pitt", seen: true, isFavourite: false), Movie(title: "The Girl with the Dragon Tattoo", releaseDate: "December 20, 2011", imdb: 7.8, mainActor: "Daniel Craig", seen: false, isFavourite: false), Movie(title: "Panic Room", releaseDate: "March 18, 2002", imdb: 6.8, mainActor: "Jodie Foster", seen: false, isFavourite: false), Movie(title: "Mank", releaseDate: "November 13, 2020", imdb: 6.8, mainActor: "Gary Oldman", seen: false, isFavourite: true), Movie(title: "Alien3", releaseDate: "May 22, 1992 ", imdb: 6.4, mainActor: "Sigourney Weaver", seen: false, isFavourite: false), Movie(title: "The Girl in the Spider's Web", releaseDate: "October 26, 201", imdb: 6.1, mainActor: "Claire Foy", seen: true, isFavourite: true)]
    
    func getSortedMovies(seenFirst: Bool) -> [Movie] {
        return movies.sorted {
            return $0.title < $1.title
        }.sorted {
            return $0.seen == seenFirst || $1.seen == seenFirst
        }
    }
    
    func getSeenMovies() -> [Movie] {
        return movies.filter {
            return $0.seen == true
        }
    }
    
    func getUnseenMovies() -> [Movie] {
        return movies.filter {
            return $0.seen == false
        }
    }

}



struct Movie {
    let title: String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    let seen: Bool
    let isFavourite: Bool
    let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForHeader = UIView()
        if section == 0 {
            viewForHeader.backgroundColor = .purple
            let label = UILabel()
                    label.frame = CGRect.init(x: 5, y: 5, width: viewForHeader.frame.width+500, height: viewForHeader.frame.height+10)
                    label.text = "Seen"
                    label.font = .systemFont(ofSize: 16)
                    label.textColor = .white
            viewForHeader.addSubview(label)
        } else {
            viewForHeader.backgroundColor = .systemPink
            let label = UILabel()
                    label.frame = CGRect.init(x: 5, y: 5, width: viewForHeader.frame.width+500, height: viewForHeader.frame.height+10)
                    label.text = "Watch list"
                    label.font = .systemFont(ofSize: 16)
                    label.textColor = .white
            viewForHeader.addSubview(label)
        }
        return viewForHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return getSeenMovies().count
        } else {
            return getUnseenMovies().count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let seenMovies = getSeenMovies()
        let unseenMovies = getUnseenMovies()
        
        let currentMovie : Movie = indexPath.section == 0 ? seenMovies[indexPath.row] : unseenMovies[indexPath.row]
        
        cell.title.text = currentMovie.title
        cell.imdb.text = String(currentMovie.imdb)
        
        return cell
    }
}
