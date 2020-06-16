//
//  BatallasViewCell.swift
//  Avengers
//
//  Created by David Rabassa Planas on 13/06/2020.
//  Copyright © 2020 David Rabassa. All rights reserved.
//

import UIKit

class BatallasViewCell: UITableViewCell {

    @IBOutlet weak var nombreBatalla: UILabel!
    @IBOutlet weak var labelHeroe: UILabel!
    @IBOutlet weak var labelVillano: UILabel!
    @IBOutlet weak var avatarHeroe: UIImageView!
    @IBOutlet weak var avatarVillano: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
