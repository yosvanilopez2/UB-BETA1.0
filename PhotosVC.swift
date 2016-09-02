//
//  PhotosVC.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 9/1/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import UIKit
import FirebaseDatabase
class PhotosVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var albumCollection: UICollectionView!
    var albums = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        albumCollection.delegate = self
        albumCollection.dataSource = self
        loadAlbums()
    }
    
    func loadAlbums() {
        
    }
    
    @IBAction func createNewAlbum(_ sender: UIButton) {
        // present the new album alert that asks for a title
        
        DataService.instance.createAlbum(title: "default title", photos: ["photo1", "photo2"])
        loadAlbums()
    }
    
/****************************************************************/
/* functions to manage album collection                         */
/****************************************************************/
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return AlbumCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // change the sender so that the information of the currently selected cell is transfered over
        performSegue(withIdentifier: "openAlbum", sender: nil)
    }


}
