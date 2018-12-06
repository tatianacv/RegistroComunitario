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
    
    var indexes = 0
    
    @IBAction func newEncuesta(_ sender: Any){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDict.count
    }
    
    var surveyCounter = arrayOfDict.count
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = "Encuesta " + String(indexPath.row + 1)
        
//        surveyCounter = surveyCounter - 1
//        print(indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Encuestas"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "ResultadosCellViewController") as! ResultadosCellViewController
        DvC.getNumber = indexPath.row
        print(indexPath.row)
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
}
