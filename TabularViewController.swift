//
//  TabularViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/3/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit

class TabularViewController: UIViewController {
    @IBOutlet weak var comunidad: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    
//    @IBAction func getVal(_ sender: Any) {
//        let zipcodeIdentificador: String!
//        let comunidadIdentificador: String!
//
//        zipcodeIdentificador = zipcode.text
//        comunidadIdentificador = comunidad.text
//    }
    
    @IBAction func nexVCAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "tabulacion", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "tabulacion" {
            let vc = segue.destination as! TabulacionResultadosViewController
            vc.comunidadIdentificador = comunidad.text! 
            vc.zipCodeIdentificador = zipcode.text!
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
