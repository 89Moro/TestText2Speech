//
//  ViewController.swift
//  TestText2Speech
//
//  Created by Ospite on 07/06/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import UIKit
import AVFoundation
//buba
class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var sldRate: UISlider!
    @IBOutlet weak var sldPitch: UISlider!
    @IBOutlet weak var btnSpeech: UIButton!
    @IBOutlet weak var tvText: UITextView!
    @IBOutlet weak var sldVolume: UISlider!

    @IBOutlet weak var pvVoices: UIPickerView!
    let speechSynth = AVSpeechSynthesizer()
    let voices = AVSpeechSynthesisVoice.speechVoices()
    var whoSpeaks:[String] = []
    var myString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pvVoices.delegate = self
        pvVoices.dataSource = self
        
        var thisVoice:AVSpeechSynthesisVoice
        for thisVoice in voices
        {
            myString = "\(thisVoice.name)"
            whoSpeaks.append(myString)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return whoSpeaks.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return whoSpeaks[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myString = whoSpeaks[row]
    }

    @IBAction func btnSpeech_TouchUp(_ sender: Any) {
        let speechUtterance = AVSpeechUtterance(string:tvText.text)
        
        speechUtterance.rate = sldRate.value
        speechUtterance.pitchMultiplier = sldPitch.value
        speechUtterance.volume = sldVolume.value
        speechUtterance.voice = AVSpeechSynthesisVoice.init(identifier: myString)
        
        speechSynth.speak(speechUtterance)
    }
    
    
}

