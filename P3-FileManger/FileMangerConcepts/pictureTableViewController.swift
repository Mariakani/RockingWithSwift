//
//  ViewController.swift
//  FileMangerConcepts
//
//  Created by Mariak Achuoth on 2019-03-20.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class pictureTableViewController: UITableViewController{
 var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        pictures = loadPictures()
        pictures.sort()
  
    }

    func loadPictures()->[String]{
        var temparray = [String]()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if item.hasPrefix("nssl")
            {
                temparray.append(item)
            }
        }
        return temparray
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedImageNumber = indexPath.row
            vc.totalPictureNumber = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

