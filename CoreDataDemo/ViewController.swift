//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Twinbit Limited on 27/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    //   createEmployee()
       fetchEmployee()
    }
    func createEmployee(){
        
        let employee = Employee(context: PersistantStorage.shared.context)
        
        employee.name = "Zaman"
        employee.name = "Emon"
        PersistantStorage.shared.saveContext()
        
    }
    
    func fetchEmployee(){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        debugPrint(path[0])
        do {
            guard let result =   try PersistantStorage.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else {return}
            
            print(result.forEach({debugPrint($0.name)}))
          
        } catch let error {
            debugPrint(error)
        }
    }
   
    
    


}

