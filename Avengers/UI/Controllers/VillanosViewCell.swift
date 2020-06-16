//
//  VillanosViewCell.swift
//  Avengers
//
//  Created by David Rabassa Planas on 01/05/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class VillanosViewCell: UITableViewCell {
    
     //    MARK: Properties
    // IDentificador de la celda
   // static let cellIdentifier: String = String(describing: VillanosViewCell.self)
    
   
    //    MARK: IBOutlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var power: UIImageView!
    
    // Cuando se crea por primera la vez la celda no cuando se vuelve a utilizar
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
