//
//  ViewController.swift
//  Strorm Viewer
//
//  Created by Nikita  on 6/5/22.
//

import UIKit

class ViewController: UITableViewController {

    
    var pictures: [String] = []{
        didSet{
            pictures = pictures.sorted(by: {
                s1, s2 in s1.prefix(8) < s2.prefix(8)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
        print(pictures)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "picture") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            vc.images = pictures
        }
        else{
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
  

}

