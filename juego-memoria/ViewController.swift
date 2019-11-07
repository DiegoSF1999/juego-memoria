import UIKit

public var Score: Int = 0   //CAMBIAME A 0 PARA JUGAR Y A 5 PARA GANAR

public var ShowImages: [UIImage] = []   // imagenes que se van a mostrar y a clickear. Lo utiliza CollectionView

var Is_initialized: Bool = false        // Booleana que controla si la aplicación se ha iniciado para usar o no la imagen del principio

public var Win: Bool = true             // Booleana que se activa si el jugador compelta el juego


// Se ha guardado estas booleanas fuera de la clase para que nunca se eliminen de la RAM y poder acceder a ellas fácilmente desde las 2 vistas
// También se podrían declarar las variables en las 2 clases y enviar sus contenidos en a funcion "prepare to segue", sin embargo es peor opción ya que utiliza más memoria y ralentiza el funcionamiento de la aplicación
// -----------------------------------------------------------

class ViewController: UIViewController {

    @IBOutlet weak var Showview: UIStackView!
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Imageview: UIImageView!

    
    var instance_images: Images
    
    required init?(coder aDecoder: NSCoder) {
        self.instance_images = Images()
        
        super.init(coder: aDecoder)
    }
    
    // código necesario para obtener las imagenes que se mostraran antes de que la vista cargue
    // es necesario cargarlas en este momento ya que en dispositivos más lentos el jugador podría notar la ausencia de imagen
    // ----------------------------------------------------------------------------------
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      Next()

    }
    
    func StartGame() {

        ShowImages = getImagesToPlay()      // Guarda las imagenes que se van a jugar en la variable global ShowImages
        
        for i in 0...ShowImages.count-1 {   // bucle for con dispatch para que muestre las imagenes que se juegan con un retardo mayor cada una

        DispatchQueue.main.asyncAfter(deadline: .now() + Double(i+i+2)) {

            self.Label.text = String(i+1)

            self.Imageview.image = ShowImages[i]

            }

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (Double(ShowImages.count * 2)) + 3.5) {
            
           self.performSegue(withIdentifier: "change", sender: nil)  // realiza una navegación de vista después de que se hayan mostrado las imagenes
            
        }

     }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let vc = segue.destination as! Collection
        
        vc.main = self  // la vista en la que se clickea las imagenes en orden necesita la vista principal (esta) en una variable

    }
    
    
    func getImagesToPlay()-> [UIImage]{
        
        var temp: [UIImage] = []
        
        var suffled: [UIImage] = instance_images.images
        
        suffled.shuffle()
        
        for i in 0...Score+1 {      // Guarda las fotos necesarias para el nivel en el array temporal. Las coge de un array con todas las imagenes                                      desordenadas
            
            temp.append(suffled[i])
            
        }
        
        return temp.shuffled()  // devuelve tantas imagenes desordenadas como requiera el nivel
        
    }
    
    func End() {
        Imageview.image = instance_images.end_image
        Label.text = "ENORABUENA Has completado el juego"
    }
    
    func Next() {
        
        if Score+1 ==  self.instance_images.images.count {       // comprueba si se ha compeltado con exito el ultimo nivel
            
            End()       // si se ha acabado el juego lanza la función End()
            
        } else {        // si no se ha acabado el juego
            
            if !Is_initialized {            // si es la primera vez que se inicia la vista
                Imageview.image = instance_images.intro_image       // la imagen inicial será la de bienvenida
            } else {                        // si no es la priemra vez que se inicia la vista
                
                if Win {
                    Imageview.image = instance_images.win_level_image   // si ha ganado el nivel anterior muestra la imagen adecuada
                } else {
                    Imageview.image = instance_images.lose_level_image  // si ha perdido el nivel anterior muestra la imagen adecuada
                }
            }
        
        
        Label.text = "Nivel " + String(Int(Score+1))            // muestra el nivel actual en el Label de la parte superior de la pantalla
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            self.StartGame()        // Después de 3 segundos de estar apreciando la imagen de bienvenida, exito o fracaso, empieza el juego
            
        }
      
    }
    
    
}


}
