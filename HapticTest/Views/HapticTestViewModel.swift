//
//  HapticTestViewModle.swift
//  HapticTest
//
//  Created by chihyung park on 2024/04/14.
//

import Foundation
import SwiftUI

final class  HapticTestViewModle: ObservableObject {
    
    @Published var counter = 0
    @Published var intensity = 0.5
    @Published var sensorStyle = 0
    @Published var flexibility = 0
    @Published var weight  = 0
    
    var hapticStyles = [
        "success",
        "error",
        "warning",
        "selection",
        "increase",
        "decrease",
        "start",
        "stop",
        "alignment",
        "levelChange",
        "impact",
        "increase"
    ]
    
    var flexibilityValues = [
        "soft",
        "rigid",
        "solid"
    ]
    
    var weightValues = [
        "light",
        "medium",
        "haevy"
    ]

    func increaseIntensity() ->  Void {
        intensity += 0.5
    }
    
    func decreaseIntensity() -> Void {
        intensity -= 0.5
    }
    
    func returnFlexibility() -> SensoryFeedback.Flexibility {
        if flexibility == 0 {
            return .soft
        } else if flexibility == 1 {
            return .rigid
        } else {
            return .solid
        }
    }
    
    func returnWeight() -> SensoryFeedback.Weight {
        if weight == 0 {
            return .light
        } else if flexibility == 1 {
            return .medium
        } else {
            return .heavy
        }
    }
    
    func returnSensoryFeedback() -> SensoryFeedback {
        switch (sensorStyle) {
        case 0 :
            return .success
        case 1 :
            return .error
        case 2 :
            return .warning
        case 3 :
            return .selection
        case 4 :
            return .increase
        case 5 :
            return .decrease
        case 6 :
            return .start
        case 7 :
            return .stop
        case 8 :
            return .alignment
        case 9 :
            return .levelChange
        case 10 :
            return .impact
        default:
            return .increase
        }
    }
}

