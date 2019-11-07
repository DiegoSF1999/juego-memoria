
import Foundation

import UIKit

class Collection: UICollectionViewController {

    
        var main: ViewController? = nil     // vista principal. Es necesario guardarla para lanzar la función Next() y que el juego continue
    
        var PressedImages : [UIImage] = []      // en esta variable se almacenarán las fotos que el jugador pulse
    
        var PickImages: [UIImage] = ShowImages  // en esta variable se almacenarán las imagenes que se han jugado. Es neceario guardarlas en otra variable para cambiar su orden y mostrarlas desordenadas en el collectionview
    
        override func viewDidLoad() {
            super.viewDidLoad()
            properShow()        // función necesaria para reajustar los margenes del collection view
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
            Is_initialized = true       // indicamos que se ha inicializado la aplicación
            
            PickImages.shuffle()        // desordenamos esta variable para mostrarlas desordenadas en el collectionview
            
            
            
        }

    @IBAction func Press(_ sender: UIButton) {      // se ejecuta cuando se pulsa un botón
        
        PressedImages.append(sender.backgroundImage(for: UIControl.State.normal)!)  // se añade la imagen de fondo del boton al array con el que luego compararemos con showimages
        
        sender.isEnabled = false        // el boton se desabilita para evitar que el jugador añada 2 veces la misma imagen y causa un bug
        
        sender.transform = .identity
        var affineTransform = CGAffineTransform.identity
        affineTransform = affineTransform.scaledBy(x: 0.001, y:
            0.001)
        UIView.animate(withDuration: 0.6, animations: {
            sender.transform = affineTransform
        })
        
                                // codigo que ejecuta una animacion de hacerse pequeño hasta desaparecer
        // se ha optado por desabilitar el boón y hacerlo más pequeño en vez de hacerlo desaparecer al instante con ".ishidden" debido a su fluidez visual
        
        self.Correct()  // Comprueba si se han presionado todos los botones y si es así comprueba si está bien el orden de las imagenes
        
        
    }
    
    func properShow() {     // funcion que gira la pantalla 2 veces en caso de estar en vertical. Esto es necesario para que los magenes se definan correctamente. Se ha elegido esta opción debio a que no existe ninguna otra.
        
        if UIDevice.current.orientation.isPortrait {      // comprueba si la pantalla está en vertical (en horizontal no surge este problema)
            
            
         collectionView.isHidden = true     // oculta la view para que el jugador no aprecie la operación
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.4)) {
            
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")         // despues de 0,4 segundos gira la pantalla en horizontal
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.8)) {     // despues de 0,8 segundos gira la pantalla en vertical
            
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(1.3)) {     // después de 1,3 segundos vuelve a mostrar la vista. esto es necesario debido al tiempo que dura la animacion de cambio de orientación
            
            self.collectionView.isHidden = false
            
        }
        }
    }
    
    func Correct() {
        
        if PressedImages.count == ShowImages.count {    // Comprueba si es momento de comparar los 2 arrays
            
            var check: Bool = true
            
            for i in 0...PressedImages.count-1 {        // bucle for que si detecta una discrepancia en la comaprativa niega la booleana
                
                if PressedImages[i] != ShowImages[i] {
                        check = false
                }
                
            }
            
            if check {      // si no hay discrepancias se sube de nivel y se declara el exito del nivel
                Score+=1
                Win = true
                
            } else {        // si existe alguna discrepancia se baja de nivel (excepto si es el primero) y de declara el fracaso del nivel
                
                Win = false
                
                if Score > 0 {
                Score-=1
                }
            }
            
            self.main!.Next()                                   // ejecuta la función Next() de la vista principal
            self.dismiss(animated: true, completion: nil)       // termina esta vista
        }
    }
    
    
    
        //ESTRUCTURA DE COLLECTIONVIEW
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return PickImages.count     // habrá tantas celdas como imagenes se hayan jugado
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! Cell
        
        // Rellenar celda
        
        cell.button.setBackgroundImage(PickImages[indexPath.row], for: UIControl.State.normal)      // la imagen se muestra en el background del boton de cada celda.
        
        return cell
        
    }

}
