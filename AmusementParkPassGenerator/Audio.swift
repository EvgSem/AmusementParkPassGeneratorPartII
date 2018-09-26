//
//  Audio.swift
//  AmusementParkPassGenerator
//
//  Created by Ievgeniia Bondini on 9/26/18.
//  Copyright © 2018 Ievgeniia Bondini. All rights reserved.
//

import Foundation


import Foundation
import AudioToolbox



extension SwipeArea {
    
    var soundEffrectName: String {
        if accessGranted {
           return "AccessGranted"
        } else {
            return "AccessDenied"
        }
    }
    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffrectName, ofType: "wav")!
        return URL(fileURLWithPath: path)
    }
}

class SoundEffectsPalyer {
    
    static var sound: SystemSoundID = 0
    
    static func playSound(for swipeArea: SwipeArea) {
        
        let soundURL = swipeArea.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        AudioServicesPlaySystemSound(sound)
    }
    
}
