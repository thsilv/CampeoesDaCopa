//
//  WordCupViewController.swift
//  CampeoesDaCopa
//
//  Created by Thiago Silva on 28/07/22.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    var worldCup: WorldCup!
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WorldCup \(worldCup.year)"
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbScore.text = "\(worldCup.winnerScore) X \(worldCup.viceScore)"
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
        
    }

}

extension WorldCupViewController : UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trajectoryCell = tableView.dequeueReusableCell(withIdentifier: "trajectoryCell", for: indexPath) as! GamesTableViewCell
        
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
        
        trajectoryCell.prepare(with: game)
        
        return trajectoryCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
}

extension WorldCupViewController: UITableViewDelegate {
    
}
