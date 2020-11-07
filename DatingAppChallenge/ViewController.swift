//
//  ViewController.swift
//  DatingAppChallenge
//
//  Created by Tom Riddle on 11/6/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
  
  var matches : [Int]!
  @IBOutlet weak var collectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    matches = [0,1,2,3,4,5,6]
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.reloadData()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return matches.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MyCollectionViewCell
    
    cell.index = matches[indexPath.item]
    cell.nameLabel.text = "Hello \(String(describing: cell.index))"
    
    //create tap gesture
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onCellTap(sender:))
    )
    tapGesture.delegate = self
    cell.addGestureRecognizer(tapGesture)
    return cell
  }
  
  @objc
  func onCellTap(sender : UITapGestureRecognizer) {
    if let cell = sender.view {
      let myCell = cell as! MyCollectionViewCell
      matches = matches.filter { (matchIndex) -> Bool in
        return matchIndex != myCell.index
      }
      collectionView.reloadData()
    }
  }
}

