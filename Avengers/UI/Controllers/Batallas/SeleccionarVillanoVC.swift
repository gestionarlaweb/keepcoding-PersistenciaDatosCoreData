//
//  SeleccionarVillanoVC.swift
//  Avengers
//
//  Created by David Rabassa Planas on 10/06/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

protocol TransferirVillanoDelegado {
    func transferirVillano(nombreVillano: String, imagenVillano: String)
}

class SeleccionarVillanoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var delegateVillano: TransferirVillanoDelegado?
    
    private var villano: [Villanos] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        showData()
        updateAllData()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 200
    }
    
    private func loadData() {
        let dataProvider = DataProvider()
        self.villano = dataProvider.loadAllVillanos()
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
        return villano.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellVillano", for: indexPath) as! SeleccionarVillanoCell
        
        cell.name?.text = "\(villano[indexPath.row].nameVillano ?? "")"
        
        let image = UIImage.init(named: villano[indexPath.row].imageVillano ?? "")
        cell.avatar?.image = image
        
        switch villano[indexPath.row].powerVillano {
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
        delegateVillano?.transferirVillano(nombreVillano: villano[indexPath.row].nameVillano ?? "", imagenVillano: villano[indexPath.row].imageVillano ?? "")
        // Al clicar en la celda paso a otra pantalla
        dismiss(animated: true, completion: nil)
     }
}
