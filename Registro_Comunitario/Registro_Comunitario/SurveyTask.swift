//
//  SurveyTask.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/1/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//

import UIKit
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Instrucciones"
    instructionStep.text = "Por favor conteste las siguientes preguntas de la mejor manera posible"
    steps += [instructionStep]
    
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "Cúal es tu nombre?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    let questQuestionStepTitle = "Cantidad de miembros en la familia"
    let textChoices = [
        ORKTextChoice(text: "1", value: 0 as NSNumber),
        ORKTextChoice(text: "2", value: 1 as NSNumber),
        ORKTextChoice(text: "3", value: 2 as NSNumber),
        ORKTextChoice(text: "4", value: 3 as NSNumber)
    ]
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]
    
    
    //    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    //    summaryStep.title = "Gracias por utilizar la aplicación"
    //    summaryStep.text = "La información fue recogida"
    //    steps += [summaryStep]
    
    let completionStep = ORKCompletionStep(identifier: "SummaryStep")
    completionStep.title = "Gracias por utilizar la aplicación"
    completionStep.text = "La información fue recogida"
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}

class SurveyClass: UIViewController {
    
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
