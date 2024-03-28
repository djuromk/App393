//
//  HomeViewModel.swift
//  App393
//
//  Created by DJUROM on 25/03/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @AppStorage("curCur") var curCur = ""
    @AppStorage("curCurInfo") var curCurInfo = ""
    @Published var curInfT = ""
    @Published var curInfA = ""

    @Published var EC = "USD"
    @AppStorage("changeCur") var changeCur = ""

    @Published var curTitle: String = ""
    @Published var curAbr: String = ""
    @Published var curValue: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isNewCur: Bool = false
    
    @Published var currencies: [CurrencyModel] = []
    @Published var selectedCurrency: CurrencyModel?

    func addCurrency() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CurrencyModel", into: context) as! CurrencyModel

        loan.curTitle = curTitle
        loan.curAbr = curAbr
        loan.curValue = curValue

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCurrencies() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CurrencyModel>(entityName: "CurrencyModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.currencies = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.currencies = []
        }
    }

    @Published var conCurOne: String = ""
    @Published var conCurTwo: String = ""
    @Published var conValOne: String = ""
    @Published var conValTwo: String = ""
    @Published var random = String("\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")

    @Published var isChoose: Bool = false
    @Published var isCalculate: Bool = false
    @Published var isSaved: Bool = false

    @Published var operations: [ConvertModel] = []
    @Published var selectedOper: ConvertModel?

    func addOper() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ConvertModel", into: context) as! ConvertModel

        loan.conCurOne = conCurOne
        loan.conCurTwo = conCurTwo
        loan.conValOne = conValOne
        loan.conValTwo = conValTwo

        CoreDataStack.shared.saveContext()
    }
    
    func fetchOper() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ConvertModel>(entityName: "ConvertModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.operations = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.operations = []
        }
    }
}
