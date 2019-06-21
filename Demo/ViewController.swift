//
//  ViewController.swift
//  Demo
//
//  Created by iMac on 2019/6/20.
//  Copyright © 2019 iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray: [UIImage] = []
    var pickerCol1: [Int] = []
    var pickerCol2: [Int] = []
    var pickerCol3: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // set value of array
        imageArray = [#imageLiteral(resourceName: "dimond"),#imageLiteral(resourceName: "crown"),#imageLiteral(resourceName: "bar"),#imageLiteral(resourceName: "seven"),#imageLiteral(resourceName: "cherry"),#imageLiteral(resourceName: "lemon")]
        // set value of label
        resultLabel.text = " "
        // set value of pickerArray
        for _ in 0...99 {
            pickerCol1.append(Int.random(in: 0...imageArray.count-1))
            pickerCol2.append(Int.random(in: 0...imageArray.count-1))
            pickerCol3.append(Int.random(in: 0...imageArray.count-1))
        }
        
        // select row of pickerView
        for i in 0...2 {
            picker.selectRow(50, inComponent: i, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // spin pickerView
    @IBAction func buttonClicked(_ sender: Any) {
        for i in 0...2 {
            picker.selectRow(Int.random(in: 1...98), inComponent: i, animated: true)
        }
        let col1 = pickerCol1[picker.selectedRow(inComponent: 0)]
        let col2 = pickerCol2[picker.selectedRow(inComponent: 1)]
        let col3 = pickerCol3[picker.selectedRow(inComponent: 2)]
        
        
        if (col1 == col2) && (col2 == col3) {
            resultLabel.text = "Bingo!!"
        } else {
            resultLabel.text = " "
        }
    }
    
    // UIPickerViewDataSource
    // set rowNum
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    // set colNum
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // // UIPickerViewDelegate
    // set width
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return imageArray[component].size.width + 35
    }
    
    // set height
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return imageArray[component].size.height + 5
    }
    
    // set content
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var img: UIImage = UIImage.init()
        switch component {
        case 0:
            img = imageArray[pickerCol1[row]]
        case 1:
            img = imageArray[pickerCol2[row]]
        case 2:
            img = imageArray[pickerCol3[row]]
        default:
            print("Error")
        }
        
        return UIImageView(image: img)
    }
    
}

