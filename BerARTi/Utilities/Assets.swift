//
//  Assets.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

struct Assets {
    static let ARTICLE: (Int) -> String = { id in
        guard id > 0 && id <= 6 else {
            return "article_1"
        }
        return "article_\(id)"
    }
    
    static let BANNER: (Int) -> String = { id in
        guard id > 0 && id <= 3 else {
            return "banner_1"
        }
        return "banner_\(id)"
    }
    
    static let ILLUSTRATION_ONBOARDING: (Int) -> String = { page in
        guard page > 0 && page <= 3 else {
            return "illustration_onboarding_1"
        }
        return "illustration_onboarding_\(page)"
    }
    
    static let ILLUSTRATION_REVAMPED_ONBOARDING: (Int) -> String = { page in
        guard page > 0 && page <= 5 else {
            return "illustration_revamped_onboarding_1"
        }
        return "illustration_revamped_onboarding_\(page)"
    }
    
    static let ILLUSTRATION_ONBOARDING_GREETING_1 = "illustration_onboarding_greeting_1"
    static let ILLUSTRATION_ONBOARDING_GREETING_2 = "illustration_onboarding_greeting_2"
    static let ILLUSTRATION_ONBOARDING_BACKGROUND = "illustration_onboarding_background"
    static let ILLUSTRATION_REVAMPED_ONBOARDING_BACKGROUND = "illustration_revamped_onboarding_background"
    static let ILLUSTRATION_DOCTOR_CIRCLE = "illustration_doctor_circle"
    static let ILLUSTRATION_MODAL_WARNING = "illustration_modal_warning"
    static let ILLUSTRATION_MODAL_SUCCESS = "illustration_modal_success"
    static let ILLUSTRATION_MODAL_NEUTRAL = "illustration_modal_neutral"
    static let ILLUSTRATION_MODAL_GREET = "illustration_modal_greet"
    
    static let ILLUSTRATION_BACKGROUND_ANGRY = "illustration_background_angry"
    static let ILLUSTRATION_BACKGROUND_ANXIOUS = "illustration_background_anxious"
    static let ILLUSTRATION_BACKGROUND_HAPPY = "illustration_background_happy"
    static let ILLUSTRATION_BACKGROUND_HEALTHY = "illustration_background_healthy"
    static let ILLUSTRATION_BACKGROUND_LOVED = "illustration_background_loved"
    static let ILLUSTRATION_BACKGROUND_NORMAL = "illustration_background_normal"
    static let ILLUSTRATION_BACKGROUND_SAD = "illustration_background_sad"
    static let ILLUSTRATION_BACKGROUND_SICK = "illustration_background_sick"
    static let ILLUSTRATION_BACKGROUND_STRESSED = "illustration_background_stressed"
    
    static let IC_LOGO = "ic_logo"
    static let IC_HIV_UND = "ic_hiv_und"
    static let IC_HIV_LOW_RISK = "ic_hiv_low_risk"
    static let IC_HIV_MED_RISK = "ic_hiv_med_risk"
    static let IC_HIV_HIGH_RISK = "ic_hiv_high_risk"
    static let IC_ADD_EMOTION = "ic_add_emotion"
    static let IC_PENCIL = "ic_pencil"
    
    static let IC_EMOTION_ANGRY = "ic_emotion_angry"
    static let IC_EMOTION_ANXIOUS = "ic_emotion_anxious"
    static let IC_EMOTION_HAPPY = "ic_emotion_happy"
    static let IC_EMOTION_HEALTHY = "ic_emotion_healthy"
    static let IC_EMOTION_LOVED = "ic_emotion_loved"
    static let IC_EMOTION_NORMAL = "ic_emotion_normal"
    static let IC_EMOTION_SAD = "ic_emotion_sad"
    static let IC_EMOTION_SICK = "ic_emotion_sick"
    static let IC_EMOTION_STRESSED = "ic_emotion_stressed"
    
    static let ANIMATION_EMOTION_LEVEL: (Emotion) -> String = { emotion in
        switch emotion {
        case .angry:
            return "animation_emotion_angry.json"
        case .anxious:
            return "animation_emotion_anxious.json"
        case .happy:
            return "animation_emotion_happy.json"
        case .loved:
            return "animation_emotion_loved.json"
        case .normal:
            return "animation_emotion_normal.json"
        case .healthy:
            return "animation_emotion_healthy.json"
        case .sad:
            return "animation_emotion_sad.json"
        case .sick:
            return "animation_emotion_sick.json"
        case .stressed:
            return "animation_emotion_stressed.json"
        }
    }
}
