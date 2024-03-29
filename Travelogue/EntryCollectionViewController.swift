//
//  EntryCollectionViewController.swift
//  Travelogue
//
//  Created by Danae N Nash on 12/4/19.
//  Copyright © 2018 Danae N Nash. All rights reserved.
//

import UIKit

private let reuseIdentifier = "entryIdentifier"

class EntryCollectionViewController: UICollectionViewController {

    var trip: Trip?
    var entries = [Entry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
        title = "Entries"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addEntry))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadEntries()
        collectionView.reloadData()
    }
    
    func loadEntries() {
        entries = trip?.rawEntries?.array as? [Entry] ?? [Entry]()
    }

    @objc
    func addEntry() {
        performSegue(withIdentifier: "showCreateEntry", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CreateEntryViewController {
            let indexPaths: NSArray = collectionView.indexPathsForSelectedItems! as NSArray
            if indexPaths.count > 0 {
                let index: IndexPath = indexPaths[0] as! IndexPath
                destination.entry = entries[index.row]
            }
            destination.trip = trip
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        let row = indexPath.row
    
        if let cell = cell as? EntryCollectionViewCell {
            if let image = entries[row].image as Data? {
                cell.entryImageView.image = UIImage(data: image)
            }
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showCreateEntry", sender: self)
    }
}
