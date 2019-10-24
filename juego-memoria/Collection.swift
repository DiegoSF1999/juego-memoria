
import Foundation

import UIKit

class Collection: UICollectionViewController {




    var images: [UIImage] = []


    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = images.shuffled()
       // cuadricula.dataSource = self
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaImagen", for: indexPath) as! Cell
        // Rellenar celda
        celda.Imageview.image = images[indexPath.row]
        return celda
    }
}
