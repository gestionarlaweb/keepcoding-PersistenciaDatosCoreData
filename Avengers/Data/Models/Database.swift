//
//  Database.swift
//  Avengers
//
//  Created by David Rabassa Planas on 30/04/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit
import CoreData

// Acceso a la BBDD
class Database {
    // MARK: - Properties
    private let entityVillano = "Villanos"
    private let entityHeroe = "Heroes"
    private let entityBatalla = "Batallas"
    private let entityID = "idBatalla"
    
    
    // MARK: - Managed Object Context
    private func context() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
        
        
    }
    
    // MARK: - Database methods
    // CREAR Heroes
    func createDataHeroe() -> NSManagedObject? {
        guard let contextMOB = context(),
            let entity = NSEntityDescription.entity(forEntityName: entityHeroe, in: contextMOB) else {
            return nil
        }
        return Heroes(entity: entity, insertInto: context())
    }
    
    // CREAR Villanos
    func createDataVillano() -> NSManagedObject? {
        guard let contextMOB = context(),
            let entity = NSEntityDescription.entity(forEntityName: entityVillano, in: contextMOB) else {
                return nil
        }
        return Villanos(entity: entity, insertInto: context())
    }
    
    // CREAR BATALLA
    func createDataBatalla() -> NSManagedObject? {
        guard let contextMOB = context(),
            let entity = NSEntityDescription.entity(forEntityName: entityBatalla, in: contextMOB) else {
                return nil
        }
        return Batallas(entity: entity,
                        insertInto: context())
    }
    
    
    
    
    
    // PERSISTIR en la BBDD el contexto y se lo paso a la
    func persistAll() {
        //try? context()?.save()
        guard let contextMOB = context() else {
            return
        }
        try? contextMOB.save()
    }
   
    // Hacer la CARGA
    func fecthAllData(_ entity: String) -> [NSManagedObject]? {
        
        return try? context()?.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entity)) as? [NSManagedObject]
    }
    
    // Hacer la CARGA de las batallas por ID de forma ordenada en ascending
     func fetchBatallas() -> [NSManagedObject]?{
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityBatalla)
         fetchRequest.sortDescriptors = [NSSortDescriptor(key: entityID, ascending: true)]
         return try? context()?.fetch(fetchRequest)
     }
    
   
    

}
