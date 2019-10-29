import UIKit

class Images {
    
    let intro_image:UIImage
    let end_image:UIImage
    let images:[UIImage]
    
    
    init() {
        
        self.intro_image = #imageLiteral(resourceName: "memory")
        self.end_image = #imageLiteral(resourceName: "victory")
        self.images = [#imageLiteral(resourceName: "pyke"), #imageLiteral(resourceName: "kata"), #imageLiteral(resourceName: "garen"), #imageLiteral(resourceName: "ashe"), #imageLiteral(resourceName: "varus"), #imageLiteral(resourceName: "syndra")]
        
    }
    
}
