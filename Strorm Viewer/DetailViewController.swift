//
//  DetailViewController.swift
//  Strorm Viewer
//
//  Created by Nikita  on 6/5/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage{
            imageView.image = UIImage(named: image)
        }
        

       
    }
    

  
}
