//
//  QRViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/03/21.
//

import UIKit
import AVFoundation
import Alamofire
import SwiftyJSON

class QRViewController: UIViewController {
    var qrString: String?
    var themeName: String?
    var tourName: String?
    var currentId: String?
    
    let captureSession = AVCaptureSession()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        basicSetting()
        let preferences = UserDefaults.standard
        if preferences.object(forKey: "insertedId") == nil {
            print("Doesn't exist!")
        } else {
            currentId = preferences.string(forKey: "insertedId")
        }
        
    }
}

extension QRViewController {
    func basicSetting() {
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            fatalError("No video device found")
        }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
            let output = AVCaptureMetadataOutput()
            captureSession.addOutput(output)
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            setVideoLayer()
            setGuideCrossLineView()
            captureSession.startRunning()
        } catch {
            print("error")
        }
    }
    
    func setVideoLayer() {
        let videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoLayer.frame = view.layer.bounds
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(videoLayer)
    }
    
    func setGuideCrossLineView() {
        let guideCrossLine = UIImageView()
        guideCrossLine.image = UIImage(systemName: "plus")
        guideCrossLine.tintColor = .green
        guideCrossLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(guideCrossLine)
        NSLayoutConstraint.activate([
            guideCrossLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guideCrossLine.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            guideCrossLine.widthAnchor.constraint(equalToConstant: 30),
            guideCrossLine.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension QRViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject, let stringValue = readableObject.stringValue else {
                return
            }
            
            
            
            if stringValue.hasPrefix("http://") || stringValue.hasPrefix("https://") {
                if stringValue == qrString {
                    
                    let urlString = "http://192.168.0.9:3000/userInfo/\(currentId!)/tourInfo/\(themeName!)/\(tourName!)"
                    let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    let url = URL(string: encodedString)!
                    let alamo = AF.request(url, method: .patch,
                                encoding: URLEncoding.httpBody)
                    
                    alamo.responseJSON() {
                        response in
                        print("업데이트 성공")
                        print(url)
                    }
            
                    self.navigationController?.popViewController(animated: true)
                }
                
                self.captureSession.stopRunning()
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

