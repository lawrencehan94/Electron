//
//  PrecStatsPopupVC.swift
//  Capitalize
//
//  Created by Lawrence Han on 11/10/17.
//  Copyright © 2017 Lawrence Han. All rights reserved.
//

import UIKit

class PrecStatsPopupVC: UIViewController {
    
    var deals = [Deal]()
    var chosenMetric = "ltmEVRev"
    var dealCount: Int = 0
    var dealValue = 0.0
    var high = 0.0
    var thirdQuartile = 0.0
    var average = 0.0
    var median = 0.0
    var firstQuartile = 0.0
    var low = 0.0
    
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var thirdQuartileLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var medianLabel: UILabel!
    @IBOutlet weak var firstQuartileLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateAverage()
        updateUI()
    }
    
    func calculateAverage() {
        
        for deal in deals {
            dealCount += 1
            
            if dealCount == 1 {
                
                high = 0
                thirdQuartile = 0
                average = 0
                median = 0
                firstQuartile = 0
                low = 0
                
            } else {
                
                if chosenMetric == "ltmEVRev" {
                    dealValue += deal.ltmEVRev
                } else if chosenMetric == "ntmEVRev" {
                    dealValue += deal.ntmEVRev
                } else if chosenMetric == "ltmEVEBITDA" {
                    dealValue += deal.ltmEVEBITDA
                } else if chosenMetric == "ntmEVEBITDA" {
                    dealValue += deal.ntmEVEBITDA
                } else if chosenMetric == "ltmPE" {
                    dealValue += deal.ltmPE
                } else if chosenMetric == "ntmPE" {
                    dealValue += deal.ntmPE
                } else if chosenMetric == "oneDay" {
                    dealValue += (100*deal.oneDay)
                } else if chosenMetric == "thirtyDay" {
                    dealValue += (100*deal.thirtyDay)
                }
            }
            average = dealValue / Double(dealCount)
            
            let highCount: Int = 0
            let thirdQuartileCount = Int(round(Double(dealCount*(1/4))))
            let medianCount: Int = Int(round(Double(dealCount/2)))
            let firstQuartileCount = Int(round(Double(dealCount*3/4)))
            let lowCount: Int = dealCount - 1
            
            let isEven: Bool
            
            if dealCount % 2 == 0 {
                isEven = true
            } else {
                isEven = false
            }
            
            if chosenMetric == "ltmEVRev" {
                high = deals[highCount].ltmEVRev
                thirdQuartile = deals[thirdQuartileCount].ltmEVRev
                
                if isEven {
                    median = (deals[medianCount].ltmEVRev + deals[medianCount - 1].ltmEVRev)/2
                } else {
                    median = deals[medianCount].ltmEVRev
                }
                
                firstQuartile = deals[firstQuartileCount].ltmEVRev
                low = deals[lowCount].ltmEVRev
            } else if chosenMetric == "ntmEVRev" {
                high = deals[highCount].ntmEVRev
                thirdQuartile = deals[thirdQuartileCount].ntmEVRev
                median = deals[medianCount].ntmEVRev
                firstQuartile = deals[firstQuartileCount].ntmEVRev
                low = deals[lowCount].ntmEVRev
            } else if chosenMetric == "ltmEVEBITDA" {
                high = deals[highCount].ltmEVEBITDA
                thirdQuartile = deals[thirdQuartileCount].ltmEVEBITDA
                median = deals[medianCount].ltmEVEBITDA
                firstQuartile = deals[firstQuartileCount].ltmEVEBITDA
                low = deals[lowCount].ltmEVEBITDA
            } else if chosenMetric == "ntmEVEBITDA" {
                high = deals[highCount].ntmEVEBITDA
                thirdQuartile = deals[thirdQuartileCount].ntmEVEBITDA
                median = deals[medianCount].ntmEVEBITDA
                firstQuartile = deals[firstQuartileCount].ntmEVEBITDA
                low = deals[lowCount].ntmEVEBITDA
            } else if chosenMetric == "ltmPE" {
                high = deals[highCount].ltmPE
                thirdQuartile = deals[thirdQuartileCount].ltmPE
                median = deals[medianCount].ltmPE
                firstQuartile = deals[firstQuartileCount].ltmPE
                low = deals[lowCount].ltmPE
            } else if chosenMetric == "ntmPE" {
                high = deals[highCount].ntmPE
                thirdQuartile = deals[thirdQuartileCount].ntmPE
                median = deals[medianCount].ntmPE
                firstQuartile = deals[firstQuartileCount].ntmPE
                low = deals[lowCount].ntmPE
            } else if chosenMetric == "oneDay" {
                high = 100*deals[highCount].oneDay
                thirdQuartile = 100*deals[thirdQuartileCount].oneDay
                median = 100*deals[medianCount].oneDay
                firstQuartile = 100*deals[firstQuartileCount].oneDay
                low = 100*deals[lowCount].oneDay
            } else if chosenMetric == "thirtyDay" {
                high = 100*deals[highCount].thirtyDay
                thirdQuartile = 100*deals[thirdQuartileCount].thirtyDay
                median = 100*deals[medianCount].thirtyDay
                firstQuartile = 100*deals[firstQuartileCount].thirtyDay
                low = 100*deals[lowCount].thirtyDay
            }
            
        }
        
    }
    
    func updateUI() {
        
        if deals.count == 1  {
            
            highLabel.text = "N.A."
            thirdQuartileLabel.text = "N.A."
            averageLabel.text = "N.A."
            medianLabel.text = "N.A."
            firstQuartileLabel.text = "N.A."
            lowLabel.text = "N.A."
            
        } else {
            
            if chosenMetric == "ltmEVRev" || chosenMetric == "ntmEVRev" || chosenMetric == "ltmEVEBITDA" || chosenMetric == "ntmEVEBITDA" || chosenMetric == "ltmPE" || chosenMetric == "ntmPE" {
                
                highLabel.text = "\(String(format: "%.1f", high))x"
                thirdQuartileLabel.text = "\(String(format: "%.1f", thirdQuartile))x"
                averageLabel.text = "\(String(format: "%.1f", average))x"
                medianLabel.text = "\(String(format: "%.1f", median))x"
                firstQuartileLabel.text = "\(String(format: "%.1f", firstQuartile))x"
                lowLabel.text = "\(String(format: "%.1f", low))x"
                
            } else if chosenMetric == "oneDay" || chosenMetric == "thirtyDay" {
                
                highLabel.text = "\(String(format: "%.0f", high))%"
                thirdQuartileLabel.text = "\(String(format: "%.0f", thirdQuartile))%"
                averageLabel.text = "\(String(format: "%.0f", average))%"
                medianLabel.text = "\(String(format: "%.0f", median))%"
                firstQuartileLabel.text = "\(String(format: "%.0f", firstQuartile))%"
                lowLabel.text = "\(String(format: "%.0f", low))%"
                
            } else {
                highLabel.text = "N.A."
                thirdQuartileLabel.text = "N.A."
                averageLabel.text = "N.A."
                medianLabel.text = "N.A."
                firstQuartileLabel.text = "N.A."
                lowLabel.text = "N.A."
            }
        }
    }
    
    @IBAction func viewTouched(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closePopup(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
