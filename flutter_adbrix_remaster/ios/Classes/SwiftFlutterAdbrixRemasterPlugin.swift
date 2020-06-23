import Flutter
import UIKit
import AdBrixRM

public class SwiftFlutterAdbrixRemasterPlugin: NSObject, FlutterPlugin {
    
    private static let adbrixModule = AdbrixModule()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_adbrix_remaster", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterAdbrixRemasterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        adbrixModule.sayHello()
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
        NSLog("handle event \(call)")
    }
}

class AdbrixModule {
    
    let adbrix = AdBrixRM.getInstance
    
    init() {
        NSLog("init adbrixModule")
    }
    
    func sayHello() {
        NSLog("bleo: hello?")
    }
}
