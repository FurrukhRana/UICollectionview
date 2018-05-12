//
//  ViewController.swift
//  Collectionview
//
//  Created by Rana on 08/05/2018.
//   2018 Rana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let wallpaers: [Any] = [1,2,3,4,5,6,7,"house"]
    @IBOutlet weak var collectionview: UICollectionView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionview.dataSource = self
        collectionview.showsVerticalScrollIndicator = false
        
        if let layout =  collectionview.collectionViewLayout as? PinterestLayout{
            layout.delegate = self
            
        }
        
        
        
        
    }
    
    
    
    
    
}
    
extension ViewController: UICollectionViewDataSource,PinterestLayoutDelegate{
    
    
        
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return wallpaers.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcell", for: indexPath)
                as? CustomCollectionViewCell {
                
                
                
              //  cell.cellimageview.image = UIImage(named: "\(wallpaers[indexPath.row])")
              
                
                cell.clipsToBounds = true
                cell.layer.cornerRadius = 15
               // cell.cellimageview.contentMode = .scaleAspectFill
                
                return cell
                
            }
            
        
   return UICollectionViewCell()
            
        }
        
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = UIImage(named: "\(wallpaers[indexPath.row])")
        if  let height = image?.size.height {
            return height / 4.0
            
        }
        return 0.0
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        print("The current value  is")
//         let cellimageview = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell
//        
//          myimageview.image = cellimageview.myImageView.image
//    }
//   
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        print("The current value  is")
        let cell = collectionView.cellForItem(at:indexPath)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: ({
            
            
            cell?.frame = collectionView.bounds
            cell?.superview?.bringSubview(toFront: cell!)
            
            
        }), completion: nil)
        
        
        
        
        return (cell != nil)
        
        
        
    }
   
    
    
    
        
}
    
    
    
    



