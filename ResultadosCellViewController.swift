//
//  ResultadosCellViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/4/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit

class ResultadosCellViewController: UIViewController {
    
    @IBOutlet weak var resultados: UILabel!
    var getNumber = Int()
    func Function() {
//        let indexNumb = getNumber
//        var contestaciones = String()
        self.resultados.text = resultsInJSON
//        for q in 1..<arrayOfDict[getNumber].count{
//                if(q == 38 || q == 39 || q == 40 || q == 41 || q == 42 || q == 43){
//                    let yes = arrayOfDict[getNumber][String(q)]
//                    contestaciones = contestaciones + "\nPregunta " + String(q) + ": " + String(yes)
//                }
//                else if(q == 1 || q==12 || q == 39 || q == 44 || q == 37){
//                    contestaciones = contestaciones + "\nInstrucciones"
//                }
//                else{
//                    let number = arrayOfDict[getNumber][String(q)]
//                    contestaciones = contestaciones + "\nPregunta " + String(q) +": " + String(number)
//                }
//            }
    }
    override func viewDidLoad() {
        Function()
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
