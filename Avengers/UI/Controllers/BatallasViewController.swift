//
//  BatallasViewController.swift
//  Avengers
//
//  Created by David Rabassa Planas on 30/04/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class BatallasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var batalla: [Batallas] = []
    
   let dataProvider = DataProvider()
     
    @IBOutlet weak var tableView: UITableView!
    
    //    MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate=self
        tableView.dataSource=self
        tableView.rowHeight = 200
        
        tableView.reloadData()
        
        loadData()
        showData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Notifica al controlador de vista que su vista está a punto de eliminarse de una jerarquía de vistas.
        super.viewDidAppear(animated)
        
        // Después de crear la batalla entra aquí
        
        loadData() // Recargo Batallas
        showData() // Recargo tableView
    }
    /*
     override func viewWillAppear(_ animated: Bool) {
         // Notifica al controlador de vista que su vista está a punto de agregarse a una jerarquía de vistas.
         super.viewWillAppear(animated)
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         // Notifica al controlador de vista que su vista está a punto de agregarse a una jerarquía de vistas.
         super.viewWillDisappear(animated)
     }
     
     override func viewDidDisappear(_ animated: Bool) {
         // Notifica al controlador de vista que su vista se eliminó de una jerarquía de vistas.
         super.viewDidDisappear(animated)
     }
     */
    
    // isBeingDismissed
    // Un valor booleano que indica si el controlador de vista se está descartando.
    
    // isBeingPresented
    // Un valor booleano que indica si se presenta el controlador de vista.
    
    // isMovingFromParent
    //Un valor booleano que indica si el controlador de vista se está eliminando de un controlador de vista principal.
    
    // isMovingToParent
    // Un valor booleano que indica si el controlador de vista se está moviendo a un controlador de vista principal.
    
    
    // Carga las batallas
    private func loadData() {
        self.batalla = dataProvider.loadBatallas()
    }
    // Recargar la tabla
    private func showData() {
        tableView.reloadData()
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batalla.count
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellBatallas", for: indexPath) as! BatallasViewCell
        
        /// Listar ganadores y perdedores
        // Número de batalla
        cell.nombreBatalla.text = "Batalla \(batalla[indexPath.row].idBatalla)"
        /// No utilizo las relaciones porque no consigo saberlas trabajar
        // Nombres y imagenes luchadores
       
        cell.labelHeroe.text = batalla[indexPath.row].ganadorHeroe
        cell.labelVillano.text = batalla[indexPath.row].ganadorVillano
        cell.avatarHeroe.image = UIImage(named: "\(batalla[indexPath.row].avatarHeroe ?? "")")
        cell.avatarVillano.image = UIImage(named: "\(batalla[indexPath.row].avatarVillano ?? "")")
        
       
       return cell
    }
    
    /// Si lo quito me peta
    @IBAction func nuevaBatalla(_ sender: Any) {
    }
    
   
}

