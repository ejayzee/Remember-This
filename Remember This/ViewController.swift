//
//  ViewController.swift
//  Remember This
//
//  Created by EMMANUEL J ZAFRA on 1/7/17.
//  Copyright © 2017 EMMANUEL J ZAFRA. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import Speech

class ViewController: UIViewController {

    @IBOutlet weak var helpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func requestPhotoPermissions() {
        
        PHPhotoLibrary.requestAuthorization { [unowned self] authStatus in
            
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.requestRecordPermissions()
                    
                } else {
                    self.helpLabel.text = "Photos permission was declined; please enable it in settings then tap Continue again."
                }
            }
        }
    }

    func requestRecordPermissions() {
        
        AVAudioSession.sharedInstance().requestRecordPermission() { [unowned self] allowed in
            
            DispatchQueue.main.async {
                if allowed {
                    
                    self.requestTranscribePermissions()
                    
                } else {
                    self.helpLabel.text = "Recording permission was declined; please enable it in settings then tap Continue again."
                }
            }
        }
    }
    
    func requestTranscribePermissions() {
        
        SFSpeechRecognizer.requestAuthorization { [unowned self] authStatus in
            
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    
                    self.authorizationComplete()
                    
                } else {
                    self.helpLabel.text = "Transcription permission was declined; please enable it in settings then tap Continue again."
                }
            }
        }
    }
    
    func authorizationComplete() {
        
        dismiss(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestPermissions(_ sender: Any) {
        
        requestPhotoPermissions()
        
    }

}

