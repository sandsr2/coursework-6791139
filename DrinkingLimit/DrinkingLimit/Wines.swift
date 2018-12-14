//
//  Wines.swift
//  DrinkingLimit
//
//  Created by Ryan Sands on 13/12/2018.
//  Copyright © 2018 Ryan Sands. All rights reserved.
//

import UIKit


class Wines: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    // Inital variables set
    var wine = "Mateus"
    var volume1 = 11.0
    var container1 = "glass"
    // y denoted for integer of drinks per week
    var y1 = 1
    
    
    @IBOutlet weak var resultsText3: UILabel!
    @IBOutlet weak var resultsText4: UILabel!
    @IBOutlet weak var pickerViewWines: UIPickerView!
    var WineList1: [String:Float] = ["Mateus":11.0, "Cloudy Bay":13.5, "Echo Falls Summer Berries":9.0, "Plaza Centro Prosecco": 8.3, "Dino Trebbiano Pinot Grigio ": 9.0]
    private let WineList = ["Mateus", "Cloudy Bay", "Echo Falls Summer Berries", "Plaza Centro Prosecco", "Dino Trebbiano Pinot Grigio "]
    
    @IBOutlet weak var segmentButtons: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pickerView source referenced below
        pickerViewWines.delegate = self

    }
    // Following pickerView-related functions were used using information
    // from the following reference: https://codewithchris.com/uipickerview-example/
    
    func numberOfComponents(in pickerViewWines: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerViewWines: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WineList.count
    }
    func pickerView(_ pickerViewWine: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        wine = WineList[row]
        return WineList[row]
    }
    

    // Use of segmented controls were sourced from the followig resource:
    // https://www.youtube.com/watch?v=WrHUCZf7FJA
    // Combined with variable and switch-case statement for beverage container and volume information
    @IBAction func volumeControl1(_ sender: UISegmentedControl)  {
        let getIndex = segmentButtons.selectedSegmentIndex
        print(getIndex)
        
        switch (getIndex) {
        case 0:
            container1 = "glass"
            volume1 = 415.0
        case 1:
            container1 = "bottle"
            volume1 = 750.0
        default:
            container1 = "serving"
            volume1 = 568.0
        }
        
    }
    
    @IBAction func resultsButton2(_ sender: Any) {
        let index = WineList1.index(forKey: wine)
        // x denoted for units per drink
        let x1 = Float(Float(volume1) * WineList1[index!].value) / Float(1000)
        y1 = Int(14.0 / Float(x1))
        resultsText3.text = "Alcohol ABV (Alcohol By Volume): \(WineList1[index!].value)%"
        resultsText4.text = "Each \(container1) contains \(x1) units, meaning \(y1) \(container1)s or less should be consumed each week as advised by the NHS."
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
