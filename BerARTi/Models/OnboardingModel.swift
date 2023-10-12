//
//  OnboardingModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 21/11/22.
//

import Foundation

struct OnboardingModel {
    var imageName: String
    var title: String
    
    init(page: Int) {
        self.imageName = Assets.ILLUSTRATION_REVAMPED_ONBOARDING(page)
        
        if page == 1{
            self.title =  "Kamu kece! Terima kasih sudah bersedia membagikan perasaanmu. \nMau kenal Berarti lebih dalam?"
        } else if page == 2 {
            self.title = "Di Berarti, kamu bisa melihat tanda-tanda vitalmu"
        } else if page == 3 {
            self.title = "Kamu pun bisa mengatur dan diingatkan terapi ARVmu"
        } else if page == 4 {
            self.title = "Berarti pun membuatmu mudah melihat jadwal konsultasimu"
        } else {
            self.title = "Kamu pun bisa mengakses artikel dan terhubung ke komunitas"
        }
    }
}
