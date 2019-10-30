import UIKit

class Images {
    
    let intro_image:UIImage
    let end_image:UIImage
    let win_level_image: UIImage
    let lose_level_image: UIImage
    let images:[UIImage]
    
    
    init() {
        
        self.intro_image = #imageLiteral(resourceName: "intro_image")
        self.end_image = #imageLiteral(resourceName: "victory")
        self.win_level_image = #imageLiteral(resourceName: "win_level_def")
        self.lose_level_image = #imageLiteral(resourceName: "lose_level_def")
        self.images = [#imageLiteral(resourceName: "pyke"), #imageLiteral(resourceName: "kata"), #imageLiteral(resourceName: "garen"), #imageLiteral(resourceName: "ashe"), #imageLiteral(resourceName: "varus"), #imageLiteral(resourceName: "syndra")]
        
    }
    
}
