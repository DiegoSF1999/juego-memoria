
import Foundation

import UIKit

class Collection: UICollectionViewController {

        var images: [UIImage] = []
        
        
    @IBOutlet var StackView: UICollectionView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            StackView.dataSource = self
            StackView.delegate = self
            
            StackView.isHidden = true
            
            properShow()
            
        }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
        
        }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! Cell
        
            // Rellenar celda
        
           
        cell.button.setBackgroundImage(self.images[indexPath.row], for: UIControl.State.normal)
        
        
        
        
            return cell
        
        }
    
    
    
    
    func properShow() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.5)) {
            
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(1)) {
            
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(1.35)) {
            
            self.StackView.isHidden = false
            
        }
    }
    
    
}
