//
//  ViewController.swift
//  Registro_Comunitario
//
//  Created by Tatiana Castro on 12/1/18.
//  Copyright © 2018 Tatiana Castro. All rights reserved.
//
import UIKit
import ResearchKit

class ViewController: UIViewController {
    
    @IBAction func Survey(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
    }
    
}
