//
//  HeroesViewController.swift
//  Avengers
//
//  Created by David Rabassa Planas on 30/04/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class HeroesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    //    MARK: Properties
          private let dataProvider = DataProvider()
          private var heroe: [Heroes] = []
      
     
      //    MARK: IBOutlets
       @IBOutlet weak var tableView: UITableView!
    
    //    MARK: Lifecycle methods
      override func viewDidLoad() {
          super.viewDidLoad()
         
          self.setupUI()
          self.setData()
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
    
       func setData() {
        /// PARA EL ARRANQUE, Comprueba si hay datos, si no los hay los crea
        if dataProvider.checkBool() {
            dataProvider.saveHeroes()
            dataProvider.saveVillanos()
            //dataProvider.saveBatallaInicial()
            // Aquí le digo que ya es FALSE para que no me lo vuelva a guardar
            dataProvider.saveChageUserDefault()
        } else { return }
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
      
          
      
      // MARK: TableView Methods
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroe.count
       }
       
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesViewCell", for: indexPath) as! HeroesViewCell
          
          if indexPath.row < heroe.count {
              cell.name.text = heroe[indexPath.row].nameHeroe
              cell.avatar.image = UIImage(named: "\(heroe[indexPath.row].imageHeroe ?? "")")
              
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
               
              
          }
          return cell
       }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         // SEGUE :  performSegue(withIdentifier: "idSegue", sender: self)
        
         let idCeldaSeleccionada = indexPath.row
         self.performSegue(withIdentifier: "segueHeroe", sender: idCeldaSeleccionada)
        
        // Deselecciono la celda
        tableView.deselectRow(at: indexPath, animated: true)
       
     }
     
    
    
    // MARK: override func SEGUE
        // Pasar los datos de una pantalla a otra
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if (segue.identifier == "segueHeroe") {
               if let indexPath = self.tableView.indexPathForSelectedRow {
                   guard let destinationVC = segue.destination as? detalleHeroeViewController else { return }
                // Aquí los datos a recibir del otro controlador
                destinationVC.heroeVC2 = heroe[indexPath.row]
               }
           }
      
       }
    


}
