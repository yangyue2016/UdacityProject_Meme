//
//  SentMemeDetailViewController.swift
//  Meme
//
//  Created by MacAir11 on 2019/11/5.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

// MARK: - VillainDetailViewController: UIViewController

class SentMemeDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var meme: Meme!
    var memesImage: UIImage?
    
    // MARK: Outlets
    
    @IBOutlet weak var detailImageView: UIImageView!

    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        if let memeimage = memesImage {
            detailImageView.image = memeimage
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.detailImageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}

