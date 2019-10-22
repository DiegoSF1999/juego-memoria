import UIKit

class Images {
    
    let intro_image:UIImage
    let images:[UIImage]
    
    var suffled_images: [UIImage]
    
    
    init() {
        
        self.intro_image = #imageLiteral(resourceName: "memory")
        self.images = [#imageLiteral(resourceName: "pyke"), #imageLiteral(resourceName: "kata"), #imageLiteral(resourceName: "garen"), #imageLiteral(resourceName: "ashe")]
        
        self.suffled_images = self.images.shuffled()
        
    }
    
}
