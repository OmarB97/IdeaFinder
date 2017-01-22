//
//  ViewController.swift
//  ideaApp
//
//  Created by Omar Baradei on 1/21/17.
//  Copyright © 2017 Omar Baradei. All rights reserved.
//

import UIKit

class ChooseController: UICollectionViewController {
    
    let categories = ["food", "health", "transportation", "technology", "business", "conservation", "literature", "gaming", "entertainment"]
    var segueString: String?
    var tagCounter = 0
    let identifier = "ideaSegue"
    
    @IBAction func categoryButton(_ sender: Any) {
        let button = sender as! UIButton
        segueString = categories[button.tag]
        performSegue(withIdentifier: identifier, sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.isScrollEnabled = false
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as! CategoryCell
        let imageName = categories[indexPath.item]
        cell.image = UIImage(named: imageName)
        cell.buttonOutlet.setImage(cell.image, for: .normal)
        cell.buttonOutlet.tag = tagCounter
        tagCounter += 1
        cell.categoryName.text = imageName.capitalized
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifier {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! IdeaViewController
            vc.categoryTitle = segueString?.capitalized
        }
    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

