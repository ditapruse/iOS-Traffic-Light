//
//  ViewController.swift
//  TrafficLight
//
//  Created by Students on 26/02/2019.
//  Copyright © 2019 AnnijaViktorija. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let 👽 = "Annija Viktorija Zaķe"
    let 😸 = "Dita Prūse"
    
    var lastColor = "green"
    
    @IBOutlet var time: UIDatePicker!
    @IBOutlet var lightGreen: UIView!
    @IBOutlet var lightYellow: UIView!
    @IBOutlet var lightRed: UIView!
    @IBOutlet weak var countDown: UILabel!
    @IBOutlet weak var nextLight: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lightGreen.layer.cornerRadius = lightGreen.frame.size.width / 2
        lightYellow.layer.cornerRadius = lightYellow.frame.size.width / 2
        lightRed.layer.cornerRadius = lightRed.frame.size.width / 2
        greenLight()
        nextLight.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        self.countDown.text="in 2"
        
    }
    func findLastColor(){
        if lastColor=="green" {
            nextLight.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        else {
            nextLight.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        }
        self.countDown.text="in 1"
    }
    
    func greenLight(){
        lightGreen.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        lightYellow.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lightRed.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextLight.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    }
    func yellowLight(){
        lightGreen.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lightYellow.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        lightRed.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    @IBAction func changeTime(_ sender: UIDatePicker) {
        
        let 📅 = DateFormatter()
        📅.dateFormat = "HH"
        let h = Int(📅.string(from: time.date)) ?? 6
        📅.dateFormat = "mm"
        let m = Int(📅.string(from: time.date)) ?? 0
        let 🕐 = ((h - 6)*60 + m) % 7
        
        switch ( 🕐 ){
        case (0):
            greenLight()
            self.countDown.text="in 2"
            lastColor = "green"
        case (1):
            greenLight()
            self.countDown.text="in 1"
        case (2):
            yellowLight()
            findLastColor()
        case (6):
            yellowLight()
            findLastColor()
        default:
            lightGreen.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            lightYellow.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            lightRed.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            nextLight.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            if (🕐==3){
                self.countDown.text="in 3"
            }
            if (🕐==4){
                self.countDown.text="in 2"
            }
            else if (🕐==5){
                self.countDown.text="in 1"
            }
            lastColor = "red"
        }
    }
}
