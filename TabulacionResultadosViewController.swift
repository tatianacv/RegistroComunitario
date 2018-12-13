//
//  TabulacionResultadosViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/5/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit

var contestaciones = String()   //Guardar las contestaciones

class TabulacionResultadosViewController: UIViewController {
    
    //Guardar los valores de los identificadores
    var comunidadIdentificador:String = ""
    var zipCodeIdentificador:String = ""
    
    //Arreglo que guarda las encuestas que tengan los mismos identificadores
    var tabulate_arrays: [Dictionary<String, Any>] = []

    //El sitio donde se va a desplegar la tabulación
    @IBOutlet weak var tabInfo: UITextView!
    
    override func viewDidLoad() {
        var count = 0   //Llevar la cuenta de la tabulación
        var yes = 0     //Cuantos hay del sí
        var no = 0      //Cuantos hay del no
        
        //Hacer el arreglo de las encuestas que tengan los mismo identificadores
        if(arrayOfDict.isEmpty == true){
            self.tabInfo.text = "No ha llenado ninguna encuesta"
        }
        else{
            for i in 0..<arrayOfDict.count{
                if(arrayOfDict[i]["2"] as! String == comunidadIdentificador && arrayOfDict[i]["3"] as! String == zipCodeIdentificador){
                    tabulate_arrays.append(arrayOfDict[i])
                }
            }
            //Ir pregunta por pregunta de la encuesta
            if(tabulate_arrays.isEmpty == true){
                self.tabInfo.text = "No hay ninguna encuesta con esos identificadores"
            }
            else{
                for q in 1..<tabulate_arrays[0].count{
                    //Por cada encuesta de los que comparten los identificadores
                    for i in 0..<tabulate_arrays.count{
                        //Si son este número de pregunta entonces la contestacion es booleana
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
                        //Si son este numero de pregunta la contestación es un int
                        else{
                            if let number = tabulate_arrays[i][String(q)] as? Int {
                                count = count + number
                            } else {
                                // nil
                            }
                        }
                    }
                    //Guardar los resultados tabulados por preguntas en la variable contestaciones
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
            
                //Desplegar los resultados tabulados
                self.tabInfo.text = contestaciones
            }
            
        super.viewDidLoad()
    }
}
}
