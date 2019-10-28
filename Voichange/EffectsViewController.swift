//
//  EffectsViewController.swift
//  Voichange
//
//  Created by S.Serkan Çay on 27.10.2019.
//  Copyright © 2019 S.Serkan Çay. All rights reserved.
//

import UIKit
import AVFoundation

class EffectsViewController: UIViewController {

    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    var recordedVoiceUrl: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case slow = 0,  fast, high, low, echo, reverb}
    
    @IBAction func playSoundButtonsTapped(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .high:
            playSound(pitch: 1000)
        case .low:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureUI(.notPlaying)
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
