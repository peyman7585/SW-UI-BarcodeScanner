//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Peyman on 2/7/25.
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
struct BarcodeScannerView: View {
    
    @State private var  scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
            VStack{
                ScannerView(scannedCode: $scannedCode,alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
