//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Peyman on 2/8/25.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInpute = AlertItem(title:"Invalid Device Input", message: "Somthing is wrong with the camera. we are unable to capture the input", dismissButton: .default(Text("OK")))
    
    static let invalidScannedType = AlertItem(title:"Invalid Scan Type", message: "The value Scanned is not valid. This app sans EAN-8, EAN-13.", dismissButton: .default(Text("OK")))
}
