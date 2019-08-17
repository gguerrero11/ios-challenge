//
//  ImageDownloaderViewController.swift
//  ios-challenge
//
//  Created by Gabe Guerrero on 8/17/19.
//  Copyright © 2019 Owlet Baby Care Inc. All rights reserved.
//

import UIKit

class ImageDownloaderViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func CloseModalAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageStringURL = "https://cdn.shopify.com/s/files/1/1004/3036/files/Homepage_Product_Images_sock_f724561e-61db-4899-92ba-dc43b27d9445_x587.jpg?v=1553278733"
        if let imageURL = URL(string: imageStringURL)
        {
            imageView.load(url: imageURL)
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

