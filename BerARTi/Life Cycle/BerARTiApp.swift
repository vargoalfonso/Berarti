//
//  BerARTiApp.swift
//  berARTi
//
//  Created by cleanmac-ada on 20/10/22.
//

import SwiftUI

@main
struct BerARTiApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    let repository = CoreDataRepository.current

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, repository.managedContext)
        }
    }
}
