//
//  SentMemeCollectionViewController.swift
//  Meme
//
//  Created by MacAir11 on 2019/11/5.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

// MARK: - SentMemeCollectionViewController: UICollectionViewController

class SentMemeCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: Collection View Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemeCollectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
        let meme = memes[indexPath.row]
        
        // Set the name and image
        cell.sentMemeImage?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
       
        //Get the object of MemeDetailViewController from the Storyboard
        let meme = memes[(indexPath as NSIndexPath).row]
        let memeImage = meme.memedImage
        let memeDetails = self.storyboard!.instantiateViewController(withIdentifier: "SentMemeDetailViewController") as! SentMemeDetailViewController

        memeDetails.memesImage = memeImage
        
        //Pass the Meme Date
        memeDetails.meme = self.memes[(indexPath as NSIndexPath).row]
        
        //Push to the scene
        self.navigationController!.pushViewController(memeDetails, animated: true)
        
    }
}

