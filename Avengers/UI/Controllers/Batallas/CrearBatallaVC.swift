//
//  CrearBatallaVC.swift
//  Avengers
//
//  Created by David Rabassa Planas on 10/06/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class CrearBatallaVC: UIViewController, TransferirHeroeDelegado, TransferirVillanoDelegado {
    
    
    @IBOutlet weak var avatarHeroe: UIImageView!
    @IBOutlet weak var nameHeroe: UILabel!
    @IBOutlet weak var avatarVillano: UIImageView!
    @IBOutlet weak var nameVillano: UILabel!
    
    @IBOutlet weak var botonCrearBatalla: UIButton!
    
    // Estado de Avenger seleccionado inicializado a false
    var heroeSeleccinado: Bool = false
    var villanoSeleccionado: Bool = false
    
    //private var heroe: [Heroes] = []
    //private var villano: [Villanos] = []
    private var batalla: [Batallas] = []
    
    /// Para la batalla
    let dataProvider = DataProvider()
    var id: Int16?
    var HeroeGanador: String = ""
    var HeroeGanadorAvatar: String = ""
    var VillanoGanador: String = ""
    var VillanoGanadorAvatar: String = ""
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Para la batalla
        self.id = idBatalla()
        
        // Habilitar-Desabilitar boton
        self.botonCrearBatalla.isHidden = true
        comprovarStateBoton()
    }
    
    /// Para la batalla
    func idBatalla() -> Int16 {
        batalla = dataProvider.loadBatallas()
        // $ 0 significa el primer parámetro pasado
        let id_batalla: [Int16] = batalla.map({$0.idBatalla})
        // max() Devuelve el mayor de dos valores comparables
         if let numObtenido = id_batalla.max(){
            return numObtenido + 1
        }else{
            return 1
        }
    }
    
    func transferirHeroe(nombreHeroe: String, imagenHeroe: String){
        nameHeroe.text = nombreHeroe
        avatarHeroe.image = UIImage.init(named: imagenHeroe)
        avatarHeroe.alpha = 1.0
        heroeSeleccinado = true
        comprovarStateBoton()
        
        // Para persistirlos en la BBDD desde el boton crear batalla
        self.HeroeGanador = nombreHeroe
        self.HeroeGanadorAvatar = imagenHeroe
        
    }
    
    func transferirVillano(nombreVillano: String, imagenVillano: String){
        nameVillano.text = nombreVillano
        avatarVillano.image = UIImage.init(named: imagenVillano)
        avatarVillano.alpha = 1.0
        villanoSeleccionado = true
        comprovarStateBoton()
        
        // Para persistirlos en la BBDD desde el boton crear batalla
        self.VillanoGanador = nombreVillano
        self.VillanoGanadorAvatar = imagenVillano
       
    }
    func comprovarStateBoton(){
        if (heroeSeleccinado == true) && (villanoSeleccionado == true){
            // Activo boton
            self.botonCrearBatalla.isHidden = false
        } else {
            // Desactivo boton
            self.botonCrearBatalla.isHidden = true
        }
    }
    
    
    // Datos a enviar
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
         // Datos recibidos del segueHeroes y segueVillanos
         if (segue.identifier == "segueHeroes") {
             //guard segue.destination is SeleccionarHeroeVC else { return }
            let VC2 = segue.destination as! SeleccionarHeroeVC
            VC2.delegateHeore = self
            
         } else if (segue.identifier == "segueVillanos") {
             let VC2 = segue.destination as! SeleccionarVillanoVC
             VC2.delegateVillano = self
         }
     }
     
    @IBAction func volver(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // ACCIÓN BOTON CREAR BATALLA
    @IBAction func accionBotonCrearBatalla(_ sender: Any) {
         
      // Calcular GANADOR
      let numAleatorio = arc4random_uniform(6) // De 1 a 6
      let heroeNumAleatorio = numAleatorio // Asigno el valor a un Heroe
      
      let nuevaBatalla = dataProvider.createBatalla()
      if heroeNumAleatorio >= 3 {
          print("Gana Heroe con un \(heroeNumAleatorio). Los buenos siempre tienen ventaja :-)")
        nuevaBatalla?.setValue(HeroeGanador, forKey: "ganadorHeroe")
        nuevaBatalla?.setValue(HeroeGanadorAvatar, forKey: "avatarHeroe")
        // Villano derrotado
        VillanoGanador = "DERROTADO !"
        nuevaBatalla?.setValue(VillanoGanador, forKey: "ganadorVillano")
        nuevaBatalla?.setValue(VillanoGanadorAvatar, forKey: "avatarVillano")
        
      }else{
          print("Gana Villano porque el Heroe a puntuado menos de 3")
        nuevaBatalla?.setValue(VillanoGanador, forKey: "ganadorVillano")
               nuevaBatalla?.setValue(VillanoGanadorAvatar, forKey: "avatarVillano")
        // Heroe derrotado
        HeroeGanador = "DERROTADO !"
        nuevaBatalla?.setValue(HeroeGanador, forKey: "ganadorHeroe")
        nuevaBatalla?.setValue(HeroeGanadorAvatar, forKey: "avatarHeroe")
          
      }
      nuevaBatalla?.setValue(self.id, forKey: "idBatalla")
      
      
      dataProvider.saveAll()
         self.dismiss(animated: true, completion: nil)
        
    }
    
   
    
    

}
