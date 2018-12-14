//
//  Liqueur.swift
//  DrinkingLimit
//
//  Created by Ryan Sands on 13/12/2018.
//  Copyright © 2018 Ryan Sands. All rights reserved.
//

import UIKit

class Liqueur: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    // Inital variables set, appended with 3 for error prevention
    var Liqueur = "Baileys Original"
    var volume3 = 17.0
    var container3 = "serving"
    // y denoted for integer of drinks per week
    var y3 = 1
    
    
    
    @IBOutlet weak var resultsText7: UILabel!
    @IBOutlet weak var resultsText8: UILabel!
    
    @IBOutlet weak var pickerViewLiqueurs: UIPickerView!
    var LiqueurList1: [String:Float] = ["Baileys Original":17.0, "Disaronno Amaretto":28.0, "Tia Maria": 20.0, "Cointreau Liqueur": 40.0, "Drambuie": 40.0]
    private let LiqueurList = ["Baileys Original", "Disaronno Amaretto", "Tia Maria", "Cointreau Liqueur", "Drambuie"]

    

    @IBOutlet weak var segmentButtons5: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewLiqueurs.delegate = self
        
        // Following pickerView-related functions were used using information
        // from the following reference: https://codewithchris.com/uipickerview-example/
    }
    func numberOfComponents(in pickerViewLiqueurs: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerViewLiqueurs: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return LiqueurList.count
    }
    func pickerView(_ pickerViewLiqueurs: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Liqueur = LiqueurList[row]
        return LiqueurList[row]
    }
    
    // Use of segmented controls were sourced from the followig resource:
    // https://www.youtube.com/watch?v=WrHUCZf7FJA
    // Combined with variable and switch-case statement for beverage container and volume information
    
    @IBAction func volumeControl3(_ sender: Any) {
    let getIndex = segmentButtons5.selectedSegmentIndex
        print(getIndex)
        
        switch (getIndex) {
        case 0:
            volume3 = 25.0
        case 1:
            volume3 = 50.0
        case 2:
            volume3 = 75.0
        default:
            volume3 = 25.0
        }
        
    }
    
    
    
    @IBAction func resultsButton3(_ sender: UIButton) {
    let index = LiqueurList1.index(forKey: Liqueur)
        // x3 denoted for units per drink
        let x3 = Float(Float(volume3) * LiqueurList1[index!].value) / Float(1000)
        y3 = Int(14.0 / Float(x3))
        resultsText7.text = "Alcohol ABV (Alcohol By Volume): \(LiqueurList1[index!].value)%"
        resultsText8.text = "Each \(container3) contains \(x3) units, meaning \(y3) \(container3)s or less should be consumed each week as advised by the NHS."
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
