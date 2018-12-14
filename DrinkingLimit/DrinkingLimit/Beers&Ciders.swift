//
//  Beers&Ciders.swift
//  DrinkingLimit
//
//  Created by Ryan Sands on 12/12/2018.
//  Copyright © 2018 Ryan Sands. All rights reserved.
//

import UIKit

class Beers_Ciders: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // Inital variables set
    var beer = "Carling"
    var volume = 4.0
    var container = "can"
    // y denoted for integer of drinks per week
    var y = 1
    
    @IBOutlet weak var resultsText: UILabel!
    @IBOutlet weak var resultsText1: UILabel!
    @IBOutlet weak var resultsText2: UILabel!
    @IBOutlet weak var pickerViewBeers: UIPickerView!
    var BeerList1: [String:Float] = ["Carling":4.0, "Budweiser":4.5, "Fosters Original":4.0, "Stella Artois": 4.8, "San Miguel": 5.0, "Peroni": 5.1]
    private let BeerList = ["Carling", "Budweiser", "Fosters Original", "Stella Artois", "San Miguel", "Peroni"]
    
    @IBOutlet weak var segmentButtons: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pickerView source referenced below
        pickerViewBeers.delegate = self
    
    }
    // Following pickerView-related functions were used using information
    // from the following reference: https://codewithchris.com/uipickerview-example/
    
    func numberOfComponents(in pickerViewBeers: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerViewBeers: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return BeerList.count
    }
    func pickerView(_ pickerViewBeers: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            beer = BeerList[row]
            return BeerList[row]
    }

    // Use of segmented controls were sourced from the followig resource:
    // https://www.youtube.com/watch?v=WrHUCZf7FJA
    // Combined with variable and switch-case statement for beverage container and volume information
    @IBAction func volumeControl(_ sender: UISegmentedControl) {
        let getIndex = segmentButtons.selectedSegmentIndex
        print(getIndex)
        
        switch (getIndex) {
        case 0:
            container = "pint"
            volume = 568.0
        case 1:
            container = "can"
            volume = 330.0
        case 2:
            container = "can"
            volume = 440.0
        case 3:
            container = "bottle"
            volume = 500.0
        default:
            container = "pint"
            volume = 568.0
        }
        
    }
    
    @IBAction func resultsButton(_ sender: Any) {
        let index = BeerList1.index(forKey: beer)
        // x denoted for units per drink
        let x = Float(Float(volume) * BeerList1[index!].value) / Float(1000)
        y = Int(14.0 / Float(x))
        resultsText.text = "Alcohol ABV (Alcohol By Volume): \(BeerList1[index!].value)%"
        resultsText1.text = "Each \(container) contains \(x) units, meaning \(y) \(container)s or less should be consumed each week as advised by the NHS."
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
