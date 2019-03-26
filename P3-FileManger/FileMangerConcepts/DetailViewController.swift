//
//  DetailViewController.swift
//  FileMangerConcepts
//
//  Created by Mariak Achuoth on 2019-03-20.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    var selectedImage: String?
    var selectedImageNumber: Int?
    var totalPictureNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedImagNum = selectedImageNumber, let totalNum = totalPictureNumber{
            title = "Picture \(selectedImagNum + 1) of \(totalNum)"
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareOnTapped))
        }
      
        navigationItem.largeTitleDisplayMode = .never
       
        if let imageToLoad = selectedImage{
            detailImageView.image = UIImage(named: imageToLoad)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
   @objc func shareOnTapped(){
    guard let image = detailImageView.image?.jpegData(compressionQuality: 0.8)else{
        print("No image found")
        return
    }
    guard let slctedImage = selectedImage else{return}
    //print("this is what i am trying\(slctedImage)")
    let vc = UIActivityViewController(activityItems: [image, slctedImage], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
 }
}
