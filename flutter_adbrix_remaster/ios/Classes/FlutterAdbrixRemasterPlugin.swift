import Flutter
import UIKit
import AdBrixRM

public class FlutterAdbrixRemasterPlugin: NSObject, FlutterPlugin {
    
    private static let adbrixBridge = AdbrixBridge()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_adbrix_remaster", binaryMessenger: registrar.messenger())
        let instance = FlutterAdbrixRemasterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)

        FlutterAdbrixRemasterPlugin.adbrixBridge.listenMethodCall(call)
    }
}


