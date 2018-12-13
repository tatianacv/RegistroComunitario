//
//  ResultadosTableViewCell.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/5/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit

class ResultadosTableViewCell: UITableViewCell {

    //Esto se hace para mandar entre view controller
    @IBOutlet weak var Encuesta: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
