
//import Foundation
//
//import UIKit
//
//class Collection: UIViewController, UICollectionViewDataSource {
//
//
//
//
//    let images: [UIImage] = [#imageLiteral(resourceName: "kata")]
//
//
//    @IBOutlet weak var cuadricula: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        cuadricula.dataSource = self
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imagenes.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaImagen", for: indexPath) as! ImageCell
//        // Rellenar celda
//        celda.imagen.image = imagenes[indexPath.row]
//        return celda
//    }
//}
