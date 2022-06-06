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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    @objc func shareTapped(){
        guard let image = (imageView.image?.jpegData(compressionQuality: 1)) else{
            print("No image found ")
            return
        }
        let dc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        dc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(dc, animated: true, completion: nil)
    }
    

  
}
