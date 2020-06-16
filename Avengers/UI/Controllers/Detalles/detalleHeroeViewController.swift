//
//  detalleHeroeViewController.swift
//  Avengers
//
//  Created by David Rabassa Planas on 02/05/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class detalleHeroeViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var power: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    
    // Necesario para poder trasmitir los datos al otro controldor
    var heroeVC2: Heroes?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = heroeVC2?.nameHeroe
        des.text = heroeVC2?.bioHeroe
        avatar.image = UIImage(named: "\(heroeVC2?.imageHeroe ?? "")")
        
        switch heroeVC2?.powerHeroe {
        case 1:
            power.image = UIImage(named: "ic_stars_1")
        case 2:
            power.image = UIImage(named: "ic_stars_2")
        case 3:
            power.image = UIImage(named: "ic_stars_3")
        case 4:
            power.image = UIImage(named: "ic_stars_4")
        case 5:
            power.image = UIImage(named: "ic_stars_5")
        default:
            power.image = UIImage(named: "ic_stars_0")
        }
        
        
        
    }
    
    @IBAction func atras(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    // Donde vamos a ir
    @IBAction func editar(_ sender: Any) {
        self.performSegue(withIdentifier: "editPowerHeroe", sender: nil)
    }
    // Que datos pasar
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (segue.identifier == "editPowerHeroe") {
             let datosParaEnviar = segue.destination as! editPowerHeroeController
            datosParaEnviar.nombreHeroe = heroeVC2?.nameHeroe
            datosParaEnviar.avatarHeroe = UIImage(named: "\(heroeVC2?.imageHeroe ?? "")")
         }
     }
    
   
}
