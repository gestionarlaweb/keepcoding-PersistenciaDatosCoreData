//
//  SeleccionarHeroeVC.swift
//  Avengers
//
//  Created by David Rabassa Planas on 10/06/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

protocol TransferirHeroeDelegado {
    func transferirHeroe(nombreHeroe: String, imagenHeroe: String)
}

class SeleccionarHeroeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var delegateHeore: TransferirHeroeDelegado?
    
     private var heroe: [Heroes] = []
    
    @IBOutlet weak var tableView: UITableView!
    

    //    MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        showData()
        updateAllData()
        
        tableView.dataSource=self
        tableView.delegate=self
        tableView.rowHeight = 200
        
    }
    
    private func loadData() {
        let dataProvider = DataProvider()
        self.heroe = dataProvider.loadAllHeroes()
    }
    
    // Recargar la tabla
    private func showData() {
        tableView.reloadData()
    }
    
    private func updateAllData() {
        self.loadData()
        self.showData()
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHeroe", for: indexPath) as! SeleccionarHeroeCell
        // Recordar que... as! SeleccionarHeroeCell...nos relaciona los @IBOutlet del controlador SeleccionarHeroeCell
        
        cell.name?.text = "\(heroe[indexPath.row].nameHeroe ?? "")"
    
        let image = UIImage.init(named: heroe[indexPath.row].imageHeroe ?? "")
        cell.avatar?.image = image
        
        switch heroe[indexPath.row].powerHeroe {
        case 1:
           cell.power.image = UIImage(named: "ic_stars_1")
        case 2:
            cell.power.image = UIImage(named: "ic_stars_2")
        case 3:
            cell.power.image = UIImage(named: "ic_stars_3")
        case 4:
            cell.power.image = UIImage(named: "ic_stars_4")
        case 5:
            cell.power.image = UIImage(named: "ic_stars_5")
        default:
            cell.power.image = UIImage(named: "ic_stars_0")
        }
        
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         // Deselecciono la celda
        tableView.deselectRow(at: indexPath, animated: true)
        // TRNASFERIR DATOS POR DELEGADO
        delegateHeore?.transferirHeroe(nombreHeroe: heroe[indexPath.row].nameHeroe ?? "", imagenHeroe: heroe[indexPath.row].imageHeroe ?? "")
         // Al clicar en la celda paso a otra pantalla
        dismiss(animated: true, completion: nil)
     }
    
    /// No es necesario, lo hago con Protocolos y Delegados
    // MARK: override func SEGUE
    
    // Pasar los datos de una pantalla a otra
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "segueHeroes") {
           
            if let indexPath = self.tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? CrearBatallaVC else { return }
                // Aquí los datos a recibir del otro controlador
                // villano[indexPath.row].nameVillano
                //destinationVC.heroeRecibido = heroe[indexPath.row]
                destinationVC.heroeRecibido = heroe[indexPath.row]
            }
        }
    }*/
  
       
}
