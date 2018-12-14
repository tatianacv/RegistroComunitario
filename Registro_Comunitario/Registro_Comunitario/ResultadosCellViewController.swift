//
//  ResultadosCellViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/4/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit



class ResultadosCellViewController: UIViewController {
    
    //Text view, aquí es dónde se va a desplegar los resultados
    @IBOutlet weak var celda: UITextView!
    
    //Información del view controller pasado para saber cuál encuesta se toco para desplegar la información correcta
    var getNumber = Int()
    
    //Esta función hace
    func DesplegarBonito() {
        //String que va a guardar todas las contestaciones
        var contestaciones = String()
        //Loop que corre por todas las preguntas de la encuesta
        for q in 1..<arrayOfDict[getNumber].count{
            //Estas son las preguntas booleanas
            if(q == 38 || q == 39 || q == 40 || q == 41 || q == 42 || q == 43){
                if let yesOrNo = arrayOfDict[getNumber][String(q)] as? Bool {
                        if(yesOrNo == true){
                            contestaciones = contestaciones + "La contestación para la pregunta " + String(q) + " es cierta.\n"
                        }
                        if(yesOrNo == false){
                            contestaciones = contestaciones + "La contestación para la pregunta " + String(q) + " es falsa.\n"
                        }
                    }
                }
                //Los pasos que son instrucciones
                else if(q == 1 || q==12 || q == 39 || q == 44 || q == 37){
                    contestaciones = contestaciones + "La pregunta " + String(q) + " es una instrucción. \n"
                }
                //Nombre de la comunidad
                else if(q == 2 ){
                    if let comunidad = arrayOfDict[getNumber][String(q)] as? String {
                        contestaciones = contestaciones + "La pregunta " + String(q) + " nos dice que la comunidad a la que pertenece es " + comunidad + "\n"
                    }
                }
                //Número de Zipcode
                else if(q == 3){
                        if let zipcode = arrayOfDict[getNumber][String(q)] as? String {
                            contestaciones = contestaciones + "La pregunta " + String(q) + " nos dice que el zipcode al que pertenece es " + zipcode + "\n"
                        }
                }
                //Para las contestaciones númericas
                else{
                        if let number = arrayOfDict[getNumber][String(q)] as? Int {
                        contestaciones = contestaciones + "La contestación de la pregunta " + String(q) + " es " + String(number) + "\n"
                    }
            }
        }
        //Hace que el text fiel de celda coga la información que esta en la variable contestaciones y la despliegue
        self.celda.text = contestaciones
    }
    
    override func viewDidLoad() {
        //Llama a la función desplegar bonito
        DesplegarBonito()
        super.viewDidLoad()
        
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
