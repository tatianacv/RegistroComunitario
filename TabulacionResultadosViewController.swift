//
//  TabulacionResultadosViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/5/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit

class TabulacionResultadosViewController: UIViewController {
    
    var comunidadIdentificador:String = ""
    var zipCodeIdentificador:String = ""
    var tabulate_arrays: [Dictionary<String, Any>] = []

    @IBOutlet weak var dumpInfo: UILabel!
    
    override func viewDidLoad() {
        var contestaciones = String()
        var count = 0
        var yes = 0
        var no = 0
        
        for i in 0..<arrayOfDict.count{
            if(arrayOfDict[i]["2"] as! String == comunidadIdentificador || arrayOfDict[i]["3"] as! String == zipCodeIdentificador){
                tabulate_arrays.append(arrayOfDict[i])
            }
        }
        print(tabulate_arrays[0].count)
        for q in 1..<tabulate_arrays[0].count{
            for i in 0..<tabulate_arrays.count{
                if(q == 38 || q == 39 || q == 40 || q == 41 || q == 42 || q == 43){
                    if let yesOrNo = tabulate_arrays[i][String(q)] as? Bool {
                        if(yesOrNo == true){
                            yes = yes + 1
                        }
                        if(yesOrNo == false){
                            no = no + 1
                        }
                    } else {
                        // nil
                    }
                }
                else if(q == 1 || q==12 || q == 39 || q == 2 || q == 3 || q == 44 || q == 37){
                }
                else{
                    if let number = tabulate_arrays[i][String(q)] as? Int {
                        count = count + number
                    } else {
                        // nil
                    }
                }
            }
                if(q == 38 || q == 39 || q == 40 || q == 41 || q == 42 || q == 43){
                contestaciones = contestaciones + "\n Cantidad de sí para la pregunta "+String(q)+" :"+String(yes)
                contestaciones = contestaciones + "\n Cantidad de no para la pregunta "+String(q)+" :"+String(no)
                }
                else if(q == 1 || q==12 || q == 39 || q==44 || q==37){
                    contestaciones = contestaciones + "\n La pregunta " + String(q) + " es una instruccion"
                }
                else if(q == 2 || q == 3 ){
                    contestaciones = contestaciones + "\n La pregunta " + String(q) + " es para saber el identificador"
                }
                else{
                contestaciones = contestaciones + "\n Cantidad de personas para la pregunta " + String(q) + " son: " + String(count)
                }
                count = 0
                yes = 0
                no = 0
        }
        print(contestaciones)
        self.dumpInfo.text = contestaciones
        
        super.viewDidLoad()
    }
}

