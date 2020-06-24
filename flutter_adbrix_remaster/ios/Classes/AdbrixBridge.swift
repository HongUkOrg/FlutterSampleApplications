//
//  AdbrixBridge.swift
//  flutter_adbrix_remaster
//
//  Created by bleo on 2020/06/24.
//

import Foundation
import AdBrixRM
import Flutter

class AdbrixBridge {
 
    // MARK: - Properties
    let adbrix: AdBrixRM = AdBrixRM.getInstance
    
    
    // MARK: - Initialize
    init() {
        
    }
}

extension AdbrixBridge {
    
    func listenMethodCall(_ call: FlutterMethodCall) {
        
        let adbrixEvent = AdbrixEvent(rawValue: call.method)
        let arguments = call.arguments.flatMap { $0 as? [String: Any] }

        handleEvent(adbrixEvent, arguments)
    }
    
    func handleEvent(_ event: AdbrixEvent?, _ arguments: [String: Any]? = nil) {
        
        guard let event = event else {
            print("Inavlid event name")
            return
        }
        
        print("bleo: catch \(event), arguments \(arguments)")
    }
}
