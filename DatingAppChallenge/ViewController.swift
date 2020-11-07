//
//  ViewController.swift
//  DatingAppChallenge
//
//  Created by Tom Riddle on 11/6/20.
//

import UIKit
import Differ

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
  
  var matches : [MatchModel]!
  @IBOutlet weak var collectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    matches = generateMatches()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.reloadData()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return matches.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MyCollectionViewCell
    
    //setup data for cell
    let match = matches[indexPath.item]
    cell.index = match.userId
    cell.nameLabel.text = match.name
    cell.matchImageView.image = UIImage(named: match.imageProfile)
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
      let newMatches = matches.filter { (match) -> Bool in
        return match.userId != myCell.index
      }
      collectionView.animateItemChanges(oldData: matches, newData: newMatches, updateData: {
        self.matches = newMatches
      })
    }
  }
  
  func generateMatches() -> [MatchModel] {
    let names = ["LeonardoDicaprio", "Pluffy", "ConanObrien", "Raj", "TomCruise", "WillSmith"]
    var result : [MatchModel] = []
    var userId : Int = 100
    for name in names {
      result.append(MatchModel(userId: userId, name: name, imageProfile: name))
      userId = userId + 1
    }
    return result
  }
}

