//
//  EncuestaTableTableViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/1/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit
import Foundation

class EncuestaTVC: UITableViewController {
    
    //Botón que corresponde a crear una nueva encuesta
    @IBAction func newEncuesta(_ sender: Any){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    //Número de secciones que tendrá el tableview
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Cuantas celdas tendra, depende de cuantas encuestas se creen
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDict.count
    }
    
    //Nombre que tendra la celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = "Encuesta " + String(indexPath.row + 1)

        return cell
    }
    
    //Título del Header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Encuestas"
    }
    
    //Coger la información del view controller y mandarselo al de la celda para saber que encuesta es la que se toco para desplegar los resultados de esa encuesta
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "ResultadosCellViewController") as! ResultadosCellViewController
        print(indexPath.row)
        DvC.getNumber = indexPath.row
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
}
