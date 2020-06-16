//
//  editPowerVillanoController.swift
//  Avengers
//
//  Created by David Rabassa Planas on 05/06/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class editPowerVillanoController: UIViewController {
    
    //    MARK: IBOutlets
    @IBOutlet weak var btnActualizar: UIButton!
    @IBOutlet weak var valorSlider: UISlider!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelVillano: UILabel!
    @IBOutlet weak var imageVillano: UIImageView!
    
    private let dataProvider = DataProvider()
    
    var valorSliderFinal: Int16 = 0
    
    // Variable para el valor del PowerCambiado
    var heroe: Heroes?
    
    // Variables que contienen los datos del SEGUE
    var nombreVillano: String?
    var avatarVillano: UIImage?
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Desabilito el boton actualizar
        self.btnActualizar.isHidden = true
        
        // Recupero los datos del SEGUE y los muestro
        labelVillano.text = nombreVillano
        imageVillano.image = avatarVillano
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Al activarse el Slider entra aquí
    @IBAction func powerSliderValue(_ sender: UISlider) {
        
        let currentValue = Int(sender.value)
          if currentValue == 0 {
              // Desactivo boton actualizar
              self.btnActualizar.isHidden = true
          } else {
              // Activo boton actualizar
              self.btnActualizar.isHidden = false
          }
         // Mostrar el valor del Slider
         self.labelValue.text = ("\(currentValue)")
        valorSliderFinal = Int16(currentValue)
        print(valorSliderFinal)
        
    }
    
    @IBAction func actualizar(_ sender: Any) {
        // Guardar nuevo valor Power
        print("Actualizando a \(valorSliderFinal)")
        // Persistimos todo
        heroe?.powerHeroe = valorSliderFinal
        dataProvider.saveAll()
        // y volver atrás
        self.dismiss(animated: true, completion: nil)
    }
}
