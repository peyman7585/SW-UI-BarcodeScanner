//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Sean Allen on 11/5/20.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView){
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraErrors) {
            switch error{
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInpute
            case .invalidScannValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
        
        
        }
}


#Preview {
//    ScannerView(scannedCode: .constant("123456"), alertItem: alertItem)
}
