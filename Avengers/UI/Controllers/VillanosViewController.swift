//
//  VillanosViewController.swift
//  Avengers
//
//  Created by David Rabassa Planas on 30/04/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class VillanosViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
  
    //    MARK: Properties
        private let dataProvider = DataProvider()
        private var villano: [Villanos] = []
    
        
    //    MARK: IBOutlets
       @IBOutlet weak var tableView: UITableView!
    
    //    MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setupUI()
       self.updateAllData()
    }
   
    //  MARK: ConfigureView
        func setupUI() {
            self.title = "Heroes"
            tableView.dataSource=self
            tableView.delegate=self
            // Altura de la celda de una manera más sencilla
            tableView.rowHeight = 300
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
    
        
    
    // MARK: TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return villano.count
     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillanosViewCell", for: indexPath) as! VillanosViewCell
        
        if indexPath.row < villano.count {
            cell.name.text = villano[indexPath.row].nameVillano
            cell.avatar.image = UIImage(named: "\(villano[indexPath.row].imageVillano ?? "")")
            
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
             
            
        }
        return cell
        
        
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         let idCeldaSeleccionada = indexPath.row
         self.performSegue(withIdentifier: "segueVillano", sender: idCeldaSeleccionada)
        // Deselecciono la celda
        tableView.deselectRow(at: indexPath, animated: true)
     }
     
    // MARK: override func SEGUE
     // Pasar los datos de una pantalla a otra
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            guard let destinationVC = segue.destination as? detalleVillanoViewController else { return }
            destinationVC.villanoVC2 = villano[indexPath.row]
        }
    
    }
    
}


   

