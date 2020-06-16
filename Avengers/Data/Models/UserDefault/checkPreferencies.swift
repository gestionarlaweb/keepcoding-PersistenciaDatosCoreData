//
//  checkPreferencies.swift
//  Avengers
//
//  Created by David Rabassa Planas on 05/05/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import Foundation

// Guardo un TRUE en UserDefaults si ya hay datos en la Base de Datos
class checkPreferencies {
    // me creo la constante con la clave "PRIMRA_CARGA" por ejemplo
    private let key = "PRIMRA_CARGA"
    
    // Establecer la primera vez  guardamos (.set) VERDADERO en la clave keyItsFirstTime
    func asignarClave() {
        UserDefaults.standard.set(true, forKey: key)
    }
    
    // Es el primer momento
    func comprovarForKey() -> Bool {
        if UserDefaults.standard.bool(forKey: key) {
            // Si es TRUE me devuelve FALSE y no entrará en el bucle
            return false
        } else {
            // Si es FALSE me devuelve TRUE y entrará en el bucle
            return true
            
        }
    }
    
}
