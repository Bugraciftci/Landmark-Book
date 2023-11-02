//
//  detailVC.swift
//  LandmarkBook
//
//  Created by Muhammed Buğra on 2.11.2023.
//

import UIKit

class DetailsVC: UIViewController{
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    
    var selectedlabel = ""
    var selectedimage = UIImage()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        label.text = selectedlabel
        image.image = selectedimage
    }
    
    
    
    
}
