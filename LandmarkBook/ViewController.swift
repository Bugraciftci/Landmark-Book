//  Created by Muhammed Buğra on 2.11.2023.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var LandmarkNames = [String()]
    var landmarkImages = [UIImage()]

    var chosenlabel = ""
    var chosenimage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        LandmarkNames.append("Colosseum")
        LandmarkNames.append("Greet Wall")
        LandmarkNames.append("Kremlin Palace")

        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "greetwall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return LandmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = LandmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenlabel = LandmarkNames[indexPath.row]
        chosenimage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedlabel = chosenlabel
            destinationVC.selectedimage = chosenimage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.LandmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}



