import UIKit

class Images {
    
    let intro_image:UIImage
    let end_image:UIImage
    let win_level_image: UIImage
    let lose_level_image: UIImage
    let images:[UIImage]
    
    
    init() {
        
        self.intro_image = #imageLiteral(resourceName: "intro_image")                           // imagen del principio. solo sale al principio del juego
        self.end_image = #imageLiteral(resourceName: "victory")                             // imagen del final. Solo sale al final del juego
        self.win_level_image = #imageLiteral(resourceName: "win_level_def")                       // imagen de victoria. Aparece cada vez que se completa con exito un nivel
        self.lose_level_image = #imageLiteral(resourceName: "lose_level_def")                      // imagen de derrota. Aparece cada vez que no se supera un nivel
        self.images = [#imageLiteral(resourceName: "pyke"), #imageLiteral(resourceName: "kata"), #imageLiteral(resourceName: "garen"), #imageLiteral(resourceName: "ashe"), #imageLiteral(resourceName: "varus"), #imageLiteral(resourceName: "syndra")]          // Imagenes del juego. Estas son las imagenes que se han de memorizar
                                                        // para mas tarde clickearen orden
    }
    
    
    // Aquí se ha utilizado un objeto llamado "imagenes" donde se guarda el "arte" del juego. Aunque no es un objeto realmente, he usado
    // esta lógica para poder cambiar fácilmente las imagenes que usa la aplicación y poder usar otra ambientación o tema en un futuro
    
    // otra opción sería declarar antes de la clase todas las imagenes, sin embargo es peor opción en cuanto a organización y a legibilidad
}
