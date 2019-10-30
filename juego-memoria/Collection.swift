
import Foundation

import UIKit

class Collection: UICollectionViewController {

    
        var main: ViewController? = nil
    
        var PressedImages : [UIImage] = []
    
        var PickImages: [UIImage] = ShowImages
    
        override func viewDidLoad() {
            super.viewDidLoad()
            properShow()
            collectionView.dataSource = self
            collectionView.delegate = self
            
            Is_initialized = true
            
            PickImages.shuffle()
            
            
            
        }

    @IBAction func Press(_ sender: UIButton) {
        
        PressedImages.append(sender.backgroundImage(for: UIControl.State.normal)!)
        
        sender.isEnabled = false
        
        sender.transform = .identity
        var affineTransform = CGAffineTransform.identity
        affineTransform = affineTransform.scaledBy(x: 0.001, y:
            0.001)
        UIView.animate(withDuration: 0.6, animations: {
            sender.transform = affineTransform
        })
        
       
        
        self.Correct()
        
        
    }
    
    func properShow() {
        
        if UIDevice.current.orientation.isPortrait {
            
            
         collectionView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.4)) {
            
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.8)) {
            
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(1.3)) {
            
            self.collectionView.isHidden = false
            
        }
        }
    }
    
    func Correct() {
        
        if PressedImages.count == ShowImages.count {
            
            var check: Bool = true
            
            for i in 0...PressedImages.count-1 {
                
                if PressedImages[i] != ShowImages[i] {
                        check = false
                }
                
            }
            
            if check {
                Score+=1
                Win = true
                
            } else {
                
                Win = false
                
                if Score > 0 {
                Score-=1
                }
            }
            
            self.main!.Next()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
        //ESTRUCTURA DE COLLECTIONVIEW
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return PickImages.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! Cell
        
        // Rellenar celda
        
        cell.button.setBackgroundImage(PickImages[indexPath.row], for: UIControl.State.normal)
        
        return cell
        
    }
    
  
}
