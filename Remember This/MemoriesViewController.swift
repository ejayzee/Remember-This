//
//  MemoriesViewController.swift
//  Remember This
//
//  Created by EMMANUEL J ZAFRA on 1/7/17.
//  Copyright © 2017 EMMANUEL J ZAFRA. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import Speech

class MemoriesViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func checkPermissions() {
        
        // check status for all 3 permissions
        
        let photosAuthorized = PHPhotoLibrary.authorizationStatus() == .authorized
        let recordingAuthorized = AVAudioSession.sharedInstance().recordPermission() == .granted
        let transcribeAuthorized = SFSpeechRecognizer.authorizationStatus() == .authorized
        
        // make a single boolean out of all three
        
        let authorized = photosAuthorized && recordingAuthorized && transcribeAuthorized
        
        // if we are missing one, show the first run screen
        
        if authorized == false {
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "FirstRun") {
                
                navigationController?.present(vc, animated: true)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkPermissions()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
