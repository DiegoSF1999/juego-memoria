//
//  ViewController.swift
//  juego-memoria
//
//  Created by alumnos on 15/10/2019.
//  Copyright © 2019 alumnos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
// Outlets
    
    

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Imageview: UIImageView!
    let intro_image = #imageLiteral(resourceName: "memory")
    let images = [#imageLiteral(resourceName: "pyke"), #imageLiteral(resourceName: "kata"), #imageLiteral(resourceName: "garen"), #imageLiteral(resourceName: "ashe")]
    
    // Codigo
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    Start()
    
        
    
    
        
        
        
    
    

    }
    
    
    func Start() {
        Imageview.image = intro_image
        Label.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.Show()
        }
       
    }
    
    func Show() {
        var suffled_images = images
        suffled_images.shuffle()
        
        let Count: Int = suffled_images.count
        
        //for i in 0...Count-1 {
            
            Label.text = String(1)
            
            Imageview.image = suffled_images[0]
            
            sleep(4)
            
            
        //}
        
        
    }
    
}

