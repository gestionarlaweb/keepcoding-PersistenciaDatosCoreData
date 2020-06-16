//
//  detalleVillanoViewController.swift
//  Avengers
//
//  Created by David Rabassa Planas on 02/05/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class detalleVillanoViewController: UIViewController{
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var power: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var des: UILabel!
    
    var villanoVC2: Villanos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = villanoVC2?.nameVillano
        des.text = villanoVC2?.bioVillano
        avatar.image = UIImage(named: "\(villanoVC2?.imageVillano ?? "")")
        
        switch villanoVC2?.powerVillano {
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
    
    @IBAction func volverAtras(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editar(_ sender: Any) {
        self.performSegue(withIdentifier: "editPowerVillano", sender: nil)
    }
    
    // Que datos pasar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editPowerVillano") {
            let datosParaEnviar = segue.destination as! editPowerVillanoController
            datosParaEnviar.nombreVillano = villanoVC2?.nameVillano
           datosParaEnviar.avatarVillano = UIImage(named: "\(villanoVC2?.imageVillano ?? "")")
        }
    }
    
    
    
}
