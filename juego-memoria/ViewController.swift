//
//  ViewController.swift
//  juego-memoria
//
//  Created by alumnos on 15/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    


    @IBOutlet weak var Showview: UIStackView!
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Imageview: UIImageView!

    
    var instance_images: Images
    var images: [UIImage]
    
    required init?(coder aDecoder: NSCoder) {
        self.instance_images = Images()
        self.images = instance_images.suffled_images
        
        super.init(coder: aDecoder)
    }
    
    
    
    
    // Codigo
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Imageview.image = instance_images.intro_image
        Label.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.Start()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (Double(images.count * 2)) + 4.5) {

            self.performSegue(withIdentifier: "change", sender: nil)

        }

    }
    


    func Start() {


        for i in 0...self.images.count-1 {

        DispatchQueue.main.asyncAfter(deadline: .now() + Double((i*2)+2)) {

            self.Label.text = String(i+1)

            self.Imageview.image = self.images[i]


            }

        }

     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! UICollectionViewController
        
        
        
    }
    
    
}


