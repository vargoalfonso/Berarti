//
//  CXProvider+Sample.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 19/11/22.
//

import CallKit

extension CXProvider {
    static var custom: CXProvider {
        let configuration = CXProviderConfiguration.custom
        let provider = CXProvider(configuration: configuration)
        
        return provider
    }
}
