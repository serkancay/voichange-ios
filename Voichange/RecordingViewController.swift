//
//  RecordingViewController.swift
//  Voichange
//
//  Created by S.Serkan Çay on 26.10.2019.
//  Copyright © 2019 S.Serkan Çay. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingViewController: UIViewController {
    
    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    @IBOutlet weak var recordingInfoLabel: UILabel!
    
    var recordingSession: AVAudioSession!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        recordingSession = AVAudioSession.sharedInstance()
    }

    @IBAction func recordButtonTapped(_ sender: Any) {
        do {
            try recordingSession.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() {
                [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.recordingButton.isEnabled = false
                        self.stopRecordingButton.isEnabled = true
                        self.recordingInfoLabel.text = "Recording voice.."
                        self.startRecording()
                    } else {
                        print("User doesn't give permission")
                    }
                }
            }
        } catch{
            print("Error: \(error)")
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        recordingButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingInfoLabel.text = "Tap to record"
        stopRecording()
    }
    
    func startRecording(){
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        do {
            try audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
        } catch{
            print("Error: \(error)")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        do {
            try recordingSession.setActive(false)
        }catch {
            print("Error: \(error)")
        }
    }
    
}

