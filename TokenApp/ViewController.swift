//
//  ViewController.swift
//  TokenApp
//
//  Created by Sahilpasha on 2/15/19.
//  Copyright © 2019 Sahilpasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var activeIndex = 0
    var buttonCount = 25
    
    var image = UIImage(named: "Unknown.png")
  
    @IBOutlet weak var colletionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colletionView.delegate = self
        colletionView.dataSource = self
        colletionView.backgroundColor = UIColor.clear
        
    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonCount
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? arrayCollectionViewCell
        
        if activeIndex == indexPath.row {
            
            cell?.outerView.backgroundColor = UIColor.white
        } else {
            
            cell?.outerView.backgroundColor = UIColor.gray
        }
        
        
        
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? arrayCollectionViewCell {
            
            if activeIndex == indexPath.row {
                cell.imageView.image = image
                activeIndex = indexPath.row + 1
            } else  if  activeIndex == indexPath.row + 1 {
                cell.imageView.image = UIImage()
                activeIndex = indexPath.row
            }else {
                
                return
            }
            
            let index = IndexPath(item: indexPath.row + 1, section: 0)
            
            collectionView.reloadItems(at: [index])
        }
        
    }
    
}
