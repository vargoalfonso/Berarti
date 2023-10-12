//
//  Enums.swift
//  BerARTi
//
//  Created by cleanmac-ada on 10/11/22.
//

import Foundation
import SwiftUI
import HealthKit

enum MedicineType: Int {
    case unit = 0
    case combination = 1
}

enum StrengthUnit: Int {
    case g = 0
    case mg = 1
    case mcg = 2
    case mcghr = 3
    case mcgml = 4
    case meq = 5
    case iu = 6
    case ml = 7
    case percent = 8
    
    var toString: String {
        switch self.rawValue {
        case 0:
            return "g"
        case 1:
            return "mg"
        case 2:
            return "mcg"
        case 3:
            return "mcg/hr"
        case 4:
            return "mcg/ml"
        case 5:
            return "mEq"
        case 6:
            return "IU"
        case 7:
            return "mL"
        case 8:
            return "%"
        default:
            return ""
        }
    }
}


enum MedicineFrequency: Int {
    case oneTime = 1
    case twoTimes = 2
    case threeTimes = 3
    
    var toString: String {
        switch self.rawValue {
        case 1:
            return "1 Kali sehari"
        case 2:
            return "2 Kali sehari"
        case 3:
            return "3 Kali sehari"
        default:
            return ""
        }
    }
}

enum CTAModalType {
    case warning
    case success
    case neutral
    case greet
    
    var icon: String {
        switch self {
        case .warning:
            return Assets.ILLUSTRATION_MODAL_WARNING
        case .success:
            return Assets.ILLUSTRATION_MODAL_SUCCESS
        case .neutral:
            return Assets.ILLUSTRATION_MODAL_NEUTRAL
        case .greet:
            return Assets.ILLUSTRATION_MODAL_GREET
        }
    }
}

enum BloodResultStage {
    case highrisk
    case medrisk
    case lowrisk
    case undetected
    
    var icon: String {
        switch self {
        case .highrisk:
            return Assets.IC_HIV_HIGH_RISK
        case .medrisk:
            return Assets.IC_HIV_MED_RISK
        case .lowrisk:
            return Assets.IC_HIV_LOW_RISK
        case .undetected:
            return Assets.IC_HIV_UND
        }
    }
    
    var title: String {
        switch self {
        case .highrisk:
            return "Berisiko"
        case .medrisk:
            return "Cukup Berisiko"
        case .lowrisk:
            return "Risiko Rendah"
        case .undetected:
            return "Tidak Terdeteksi"
        }
    }
}

enum SupplementWeekday: Int {
    case mon = 0
    case tue = 1
    case wed = 2
    case thu = 3
    case fri = 4
    case sat = 5
    case sun = 6
    
    var title: String {
        switch self {
        case .mon:
            return "Sen"
        case .tue:
            return "Sel"
        case .wed:
            return "Rab"
        case .thu:
            return "Kam"
        case .fri:
            return "Jum"
        case .sat:
            return "Sab"
        case .sun:
            return "Min"
        }
    }
}

enum Emotion: Int {
    case angry = 90
    case anxious = 91
    case happy = 92
    case healthy = 93
    case loved = 94
    case normal = 95
    case sad = 96
    case sick = 97
    case stressed = 98
    
    var title: String {
        switch self {
        case .angry:
            return "Marah"
        case .anxious:
            return "Cemas"
        case .happy:
            return "Bahagia"
        case .healthy:
            return "Sehat"
        case .loved:
            return "Dicintai"
        case .normal:
            return "Normal"
        case .sad:
            return "Sedih"
        case .sick:
            return "Sakit"
        case .stressed:
            return "Tertekan"
        }
    }
    
    var imageName: String {
        switch self {
        case .angry:
            return Assets.IC_EMOTION_ANGRY
        case .anxious:
            return Assets.IC_EMOTION_ANXIOUS
        case .happy:
            return Assets.IC_EMOTION_HAPPY
        case .healthy:
            return Assets.IC_EMOTION_HEALTHY
        case .loved:
            return Assets.IC_EMOTION_LOVED
        case .normal:
            return Assets.IC_EMOTION_NORMAL
        case .sad:
            return Assets.IC_EMOTION_SAD
        case .sick:
            return Assets.IC_EMOTION_SICK
        case .stressed:
            return Assets.IC_EMOTION_STRESSED
        }
    }
    
    var backgroundName: String {
        switch self {
        case .angry:
            return Assets.ILLUSTRATION_BACKGROUND_ANGRY
        case .anxious:
            return Assets.ILLUSTRATION_BACKGROUND_ANXIOUS
        case .happy:
            return Assets.ILLUSTRATION_BACKGROUND_HAPPY
        case .healthy:
            return Assets.ILLUSTRATION_BACKGROUND_HEALTHY
        case .loved:
            return Assets.ILLUSTRATION_BACKGROUND_LOVED
        case .normal:
            return Assets.ILLUSTRATION_BACKGROUND_NORMAL
        case .sad:
            return Assets.ILLUSTRATION_BACKGROUND_SAD
        case .sick:
            return Assets.ILLUSTRATION_BACKGROUND_SICK
        case .stressed:
            return Assets.ILLUSTRATION_BACKGROUND_STRESSED
        }
    }
}

enum VitalType {
    case heartRate
    case oxygenSaturation
    case bloodPressureSystolic
    case bloodPressureDiastolic
    case respiratoryRate
    case unknown
    
    var icon: String {
        switch self {
        case .heartRate, .bloodPressureSystolic, .bloodPressureDiastolic:
            return "heart.fill"
        case .oxygenSaturation, .respiratoryRate:
            return "lungs.fill"
        case .unknown:
            return ""
        }
    }
    
    var title: String {
        switch self {
        case .bloodPressureDiastolic:
            return "Tekanan Darah"
        case .bloodPressureSystolic:
            return "Tekanan Darah"
        case .heartRate:
            return "Detak Jantung"
        case .oxygenSaturation:
            return "Oksigen Darah"
        case .respiratoryRate:
            return "Tingkat Pernapasan"
        case .unknown:
            return "-"
        }
    }
    
    var unit: String {
        switch self {
        case .bloodPressureDiastolic, .bloodPressureSystolic:
            return "mmHg"
        case .heartRate:
            return "BPM"
        case .oxygenSaturation:
            return "%"
        case .respiratoryRate:
            return "breaths/min"
        case .unknown:
            return "-"
        }
    }
    
    var colorTint: Color {
        switch self {
        case .heartRate, .bloodPressureSystolic, .bloodPressureDiastolic:
            return Color(hex: "#FF284F")
        case .oxygenSaturation, .respiratoryRate:
            return Color(hex: "#3CB0E3")
        case .unknown:
            return .black
        }
    }
    
    init?(from quantityType: HKQuantityTypeIdentifier) {
        switch quantityType {
        case .heartRate:
            self = .heartRate
        case .oxygenSaturation:
            self = .oxygenSaturation
        case .bloodPressureSystolic:
            self = .bloodPressureSystolic
        case .bloodPressureDiastolic:
            self = .bloodPressureDiastolic
        case .respiratoryRate:
            self = .respiratoryRate
        default:
            self = .unknown
        }
        
    }
}
