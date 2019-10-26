//
//  ViewController.swift
//  Voichange
//
//  Created by S.Serkan Çay on 26.10.2019.
//  Copyright © 2019 S.Serkan Çay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    @IBOutlet weak var recordingInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
    }

    @IBAction func startRecording(_ sender: Any) {
        print("Start recording")
        recordingButton.isEnabled = false
        stopRecordingButton.isEnabled = true
        recordingInfoLabel.text = "Recording voice.."
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("Stop recording")
        recordingButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingInfoLabel.text = "Tap to record"
    }
    
}

