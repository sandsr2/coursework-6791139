//
//  Spirits.swift
//  DrinkingLimit
//
//  Created by Ryan Sands on 13/12/2018.
//  Copyright © 2018 Ryan Sands. All rights reserved.
//

import UIKit

class Spirits: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    // Inital variables set, appended with 2 for error prevention
    var spirits = "Smirnoff Vodka"
    var volume2 = 37.5
    var container2 = "serving"
    // y denoted for integer of drinks per week
    var y2 = 1
    
    
    
    @IBOutlet weak var resultsText5: UILabel!
    @IBOutlet weak var resultsText6: UILabel!
    @IBOutlet weak var pickerViewSpirits: UIPickerView!
    var SpiritList1: [String:Float] = ["Smirnoff Vodka":37.5, "Jack Daniels":40.0, "Bells Whiskey":40.0, "Gordons Pink Gin": 37.5, "Captain Morgan": 35.0]
    private let SpiritList = ["Smirnoff Vodka", "Jack Daniels", "Bells Whiskey", "Gordons Pink Gin", "Captain Morgan"]
    
    
    
    
    

    @IBOutlet weak var segmentButtons3: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewSpirits.delegate = self
        
        // Following pickerView-related functions were used using information
        // from the following reference: https://codewithchris.com/uipickerview-example/
    }
    func numberOfComponents(in pickerViewSpirits: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerViewSpirits: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SpiritList.count
    }
    func pickerView(_ pickerViewSpirits: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        spirits = SpiritList[row]
        return SpiritList[row]
    }
    
    
    
    // Use of segmented controls were sourced from the followig resource:
    // https://www.youtube.com/watch?v=WrHUCZf7FJA
    // Combined with variable and switch-case statement for beverage container and volume information
    @IBAction func volumeControl2(_ sender: UISegmentedControl) {
        let getIndex = segmentButtons3.selectedSegmentIndex
        print(getIndex)
        
        switch (getIndex) {
        case 0:
            container2 = "serving"
            volume2 = 30.0
        case 1:
            container2 = "glasse"
            volume2 = 60.0
        default:
            container2 = "pint"
            volume2 = 568.0
        }
        
    }
    
    
    
    @IBAction func resultsButton2(_ sender: Any) {
        let index = SpiritList1.index(forKey: spirits)
        // x2 denoted for units per drink
        let x2 = Float(Float(volume2) * SpiritList1[index!].value) / Float(1000)
        y2 = Int(14.0 / Float(x2))
        resultsText5.text = "Alcohol ABV (Alcohol By Volume): \(SpiritList1[index!].value)%"
        resultsText6.text = "Each \(container2) contains \(x2) units, meaning \(y2) \(container2)s or less should be consumed each week as advised by the NHS."
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
