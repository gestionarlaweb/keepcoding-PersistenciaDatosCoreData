//
//  DataProvider.swift
//  Avengers
//
//  Created by David Rabassa Planas on 30/04/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import Foundation

// Único acceso para obtener datos
class DataProvider {
   
    private var database: Database? = nil   //  class Database {}
    private var myPreferences: checkPreferencies? = nil  // Para UserDefaults
    
    private let entityHeroe = "Heroes"
    private let entityVillano = "Villanos"
    
   
       
    init() {
        database = Database() // Inicializamos ....func saveAll() crea registros
        myPreferences = checkPreferencies() // Inicializa la clase checkPreferencies()
    }
    
    deinit { // No sería necesario pero nos aseguramos de elimnar nuestra class Database {}
        database = nil
    }
    
    // Si es la privera vez me retornas un Booleano
     func checkBool() -> Bool {
         guard let respBool = myPreferences?.comprovarForKey() else {
             return false
         }
         return respBool // responder
     }
    func saveChageUserDefault() {
        myPreferences?.asignarClave()
    }
    
    // Crear un AVENGER - Heroe
    func createHeroe() -> Heroes? {
        return database?.createDataHeroe() as? Heroes
    }
    
    // Crear un AVENGER - Villano
    func createVillano() -> Villanos? {
        return database?.createDataVillano() as? Villanos
    }
    
    // Crear BATALLA
     func createBatalla() -> Batallas? {
        return database?.createDataBatalla() as? Batallas
     }
     
    
    
    
    // CARGAR la entidad (tabla) Heroes
    func loadAllHeroes() -> [Heroes] {
        guard let data = database?.fecthAllData(entityHeroe) as? [Heroes] else {
            return []
            
        }
      //  print("Load HEROES \(data)")
        return data
    }
    
    // CARGAR la entidad (tabla) Villanos
    //  func loadAllVillanos() -> [Villanos] o también
    // func loadAllVillanos() -> [NSManagedObject]
    // (es lo mismo) porque hace referencia a la clase oculta     public class Villanos: NSManagedObject {}
    func loadAllVillanos() -> [Villanos] {
        guard let data = database?.fecthAllData(entityVillano) as? [Villanos] else {
            return []
        }
       // print("Load VILLANOS \(data)")
        return data
    }
    
    // Cargar las Batallas por ID
    func loadBatallas() -> [Batallas] {
        guard let data = database?.fetchBatallas() as? [Batallas] else {
            return []
        }
        print("Load BATALLAS \(data)")
        return data
    }
    
   
    
    
    
    // GUARDAR (persistimos) todos las modificaciones
    func saveAll() {
           database?.persistAll()
       }
       
       // Estas funciones saveHeroes ( ) - saveVillanos ( )
    ///  Las llamo desde el controlador principal HeroesViewController
    /// cuando no hay ningún dato y así le hago una primera carga inicial de datos
    
    func saveHeroes () {
        let capitanAmerica = createHeroe()
        let blackPanther = createHeroe()
        let laViudaNegra = createHeroe()
        let drStrange = createHeroe()
        let gamora = createHeroe()
        let hulk = createHeroe()
        let ironman = createHeroe()
        let capitanaMarvel = createHeroe()
        let spiderman = createHeroe()
        let thor = createHeroe()
        
        
        
        
        
        capitanAmerica?.nameHeroe = "Captain America"
        capitanAmerica?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        capitanAmerica?.imageHeroe = "heroe_america_captain"
        capitanAmerica?.powerHeroe = 5
        
        blackPanther?.nameHeroe = "Black Panther"
        blackPanther?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        blackPanther?.imageHeroe = "heroe_black_panther"
        blackPanther?.powerHeroe = 3
        
        laViudaNegra?.nameHeroe = "Black Widow"
        laViudaNegra?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        laViudaNegra?.imageHeroe = "heroe_black_widow"
        laViudaNegra?.powerHeroe = 3
        
        drStrange?.nameHeroe = "Dr. Strange"
        drStrange?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        drStrange?.imageHeroe = "heroe_dr_strange"
        drStrange?.powerHeroe = 3
        
        gamora?.nameHeroe = "Gamora"
        gamora?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        gamora?.imageHeroe = "heroe_gamora"
        gamora?.powerHeroe = 2
        
        hulk?.nameHeroe = "Hulk"
        hulk?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        hulk?.imageHeroe = "heroe_hulk"
        hulk?.powerHeroe = 4
        
        ironman?.nameHeroe = "Iron Man"
        ironman?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        ironman?.imageHeroe = "heroe_ironman"
        ironman?.powerHeroe = 5
        
        capitanaMarvel?.nameHeroe = "Captain Marvel"
        capitanaMarvel?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        capitanaMarvel?.imageHeroe = "heroe_marvel_captain"
        capitanaMarvel?.powerHeroe = 4
        
        spiderman?.nameHeroe = "Spiderman"
        spiderman?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        spiderman?.imageHeroe = "heroe_spiderman"
        spiderman?.powerHeroe = 4
        
        thor?.nameHeroe = "Thor"
        thor?.bioHeroe = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        thor?.imageHeroe = "heroe_thor"
        thor?.powerHeroe = 4
        
        
        saveAll()
        
    }
          
    func saveVillanos () {
        let dormammu = createVillano()
        let ego = createVillano()
        let hela = createVillano()
        let ivanVanko = createVillano()
        let johanSchmidt = createVillano()
        let malekith = createVillano()
        let ronan = createVillano()
        let thanos = createVillano()
        let ultron = createVillano()
        let yonRogg = createVillano()
        
        
        dormammu?.nameVillano = "Dormammu"
        dormammu?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        dormammu?.imageVillano = "villain_dormammu"
        dormammu?.powerVillano = 3
        
        ego?.nameVillano = "Ego"
        ego?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        ego?.imageVillano = "villain_ego"
        ego?.powerVillano = 3
        
        hela?.nameVillano = "Hela"
        hela?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        hela?.imageVillano = "villain_hela"
        hela?.powerVillano = 1
        
        ivanVanko?.nameVillano = "Ivan Vanko"
        ivanVanko?.bioVillano = "Descripción"
        ivanVanko?.imageVillano = "villain_ivan_vanko"
        ivanVanko?.powerVillano = 4
        
        johanSchmidt?.nameVillano = "Red Skull"
        johanSchmidt?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        johanSchmidt?.imageVillano = "villain_johann_schmidt"
        johanSchmidt?.powerVillano = 4
        
        malekith?.nameVillano = "Malekith"
        malekith?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        malekith?.imageVillano = "villain_malekith"
        malekith?.powerVillano = 5
        
        ronan?.nameVillano = "Ronan The Accuser"
        ronan?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        ronan?.imageVillano = "villain_ronan"
        ronan?.powerVillano = 3
        
        thanos?.nameVillano = "Thanos"
        thanos?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        thanos?.imageVillano = "villain_thanos"
        thanos?.powerVillano = 5
        
        ultron?.nameVillano = "Ultron"
        ultron?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        ultron?.imageVillano = "villain_ultron"
        ultron?.powerVillano = 4
        
        yonRogg?.nameVillano = "Yon-Rogg"
        yonRogg?.bioVillano = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        yonRogg?.imageVillano = "villain_yon_rogg"
        yonRogg?.powerVillano = 2
        
        
        saveAll()
        
    }
    /// Para prueba
   /*
     func saveBatallaInicial () {
         let hela = createBatalla() // Batalla inicial en caso de nomhaber datos !
         
         hela?.ganador = "Hela"
         hela?.idBatalla = 1
         
         print("BATALLA 1 Hela Guardada")
         saveAll()
     }
     */
    
     
     
    
    
}
