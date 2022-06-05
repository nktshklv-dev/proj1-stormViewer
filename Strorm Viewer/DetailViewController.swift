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
    var images: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage{
            imageView.image = UIImage(named: image)
        }
        
        title = "Picture \(Int(images.firstIndex(of: selectedImage ?? "")!) + 1) of \(images.count)"
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

  
}
