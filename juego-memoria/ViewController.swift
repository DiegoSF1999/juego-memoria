import UIKit

public var Score: Int = 0   //CAMBIAME A 1 PARA JUGUAR

public var ShowImages: [UIImage] = []

class ViewController: UIViewController {

    @IBOutlet weak var Showview: UIStackView!
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Imageview: UIImageView!

    
    var instance_images: Images
    
    required init?(coder aDecoder: NSCoder) {
        self.instance_images = Images()
        
        super.init(coder: aDecoder)
    }
    
    
    // Codigo
    override func viewDidLoad() {
        super.viewDidLoad()
        
      Next()

    }
    
    func StartGame() {

        ShowImages = getImagesToPlay()
        
        for i in 0...ShowImages.count-1 {

        DispatchQueue.main.asyncAfter(deadline: .now() + Double(i+i+2)) {

            self.Label.text = String(i+1)

            self.Imageview.image = ShowImages[i]

            }

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (Double(ShowImages.count * 2)) + 3.5) {
            
           self.performSegue(withIdentifier: "change", sender: nil)
            
        }

     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let vc = segue.destination as! Collection
        
        vc.main = self

    }
    
    
    func getImagesToPlay()-> [UIImage]{
        
        var temp: [UIImage] = []
        
        for i in 0...Score+1 {
            
            temp.append(self.instance_images.images[i])
            
        }
        
        return temp.shuffled()
        
    }
    
    func End() {
        Imageview.image = instance_images.end_image
        Label.text = "ENORABUENA Has completado el juego"
    }
    
    func Next() {
        
        if Score+1 ==  self.instance_images.images.count {
            End()
            
        } else {
        
        Imageview.image = instance_images.intro_image
        Label.text = "Nivel " + String(Int(Score+1))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.StartGame()
            
        }
      
    }
    
    
}


}
