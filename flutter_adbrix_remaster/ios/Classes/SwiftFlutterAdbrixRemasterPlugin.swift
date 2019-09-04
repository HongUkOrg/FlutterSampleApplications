import Flutter
import UIKit

public class SwiftFlutterAdbrixRemasterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_adbrix_remaster", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAdbrixRemasterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
