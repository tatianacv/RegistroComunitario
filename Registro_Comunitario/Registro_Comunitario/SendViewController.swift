//
//  SecondViewController.swift
//  Bluetooth_v3.0
//
// This is a modification done by Juan Lugo of:
//
//  BTLEPeripheralViewController.swift
//  Bluetooth
//
//  Created by Mick on 12/20/14.
//  Copyright (c) 2014 MacCDevTeam LLC. All rights reserved.
//

import UIKit
import CoreBluetooth
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

class SendViewController: UIViewController, CBPeripheralManagerDelegate, UITextViewDelegate {
    
    @IBOutlet fileprivate weak var advertisingSwitch: UISwitch!
    @IBOutlet fileprivate weak var textView: UITextView!
    
    fileprivate var peripheralManager: CBPeripheralManager?
    fileprivate var transferCharacteristic: CBMutableCharacteristic?
    
    // This will, hopefully, be the case JSON.
    fileprivate var dataToSend: Data?
    fileprivate var sendDataIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textView.text = contestaciones
        // Starting the peripheralManager.
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Stop advertising when not in view.
        peripheralManager?.stopAdvertising()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Required protocol method, manages the states and builds the service tree.
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if (peripheral.state != .poweredOn) {
            // Must deal with the other states.
            return
        }
        
        // Print to console BTLE is powerd on.
        print("self.peripheralManager powered on.")
        
        // To build our service start with the characteristics.
        transferCharacteristic = CBMutableCharacteristic(
            type: transferCharacteristicUUID,
            properties: CBCharacteristicProperties.notify,
            value: nil,
            permissions: CBAttributePermissions.readable
        )
        
        // And then the service.
        let transferService = CBMutableService(
            type: transferServiceUUID,
            primary: true
        )
        
        // Add the characteristic to the service
        transferService.characteristics = [transferCharacteristic!]
        
        // And add it to the peripheral manager
        peripheralManager!.add(transferService)
    }
    
    // Notice when a something subscribes to the characteristic and strat sending data.
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        // Print to console that a central subscribed
        print("Central subscribed to characteristic")
        
        // Get the data
        // Must put case JSON in a variable to be able to send
        dataToSend = textView.text.data(using: String.Encoding.utf8)
        
        // Reset the index.
        sendDataIndex = 0;
        
        // Start sending.
        sendData()
    }
    
    // Notice when central unsubscribes. Why? No clue.
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        print("Central unsubscribed from characteristic")
    }
    
    // First up, check if we're meant to be sending an EOM
    fileprivate var sendingEOM = false;
    
    /** Sends the next amount of data to the connected central
     */
    fileprivate func sendData() {
        if sendingEOM {
            // send it
            let didSend = peripheralManager?.updateValue(
                "EOM".data(using: String.Encoding.utf8)!,
                for: transferCharacteristic!,
                onSubscribedCentrals: nil
            )
            
            // Did it send?
            if (didSend == true) {
                
                // It did, so mark it as sent
                sendingEOM = false
                
                print("Sent: EOM")
            }
            
            // It didn't send, so we'll exit and wait for peripheralManagerIsReadyToUpdateSubscribers to call sendData again
            return
        }
        
        // We're not sending an EOM, so we're sending data
        
        // Is there any left to send?
        guard sendDataIndex < dataToSend?.count else {
            // No data left.  Do nothing
            return
        }
        
        // There's data left, so send until the callback fails, or we're done.
        var didSend = true
        
        while didSend {
            // Make the next chunk
            
            // Work out how big it should be
            var amountToSend = dataToSend!.count - sendDataIndex!;
            
            // Can't be longer than 20 bytes
            if (amountToSend > NOTIFY_MTU) {
                amountToSend = NOTIFY_MTU;
            }
            
            // Copy out the data we want
            let chunk = dataToSend!.withUnsafeBytes{(body: UnsafePointer<UInt8>) in
                return Data(
                    bytes: body + sendDataIndex!,
                    count: amountToSend
                )
            }
            
            // Send it
            didSend = peripheralManager!.updateValue(
                chunk as Data,
                for: transferCharacteristic!,
                onSubscribedCentrals: nil
            )
            
            // If it didn't work, drop out and wait for the callback
            if (!didSend) {
                return
            }
            
            let stringFromData = NSString(
                data: chunk as Data,
                encoding: String.Encoding.utf8.rawValue
            )
            
            print("Sent: \(stringFromData)")
            
            // It did send, so update our index
            sendDataIndex! += amountToSend;
            
            // Was it the last one?
            if (sendDataIndex! >= dataToSend!.count) {
                
                // It was - send an EOM
                
                // Set this so if the send fails, we'll send it next time
                sendingEOM = true
                
                // Send it
                let eomSent = peripheralManager!.updateValue(
                    "EOM".data(using: String.Encoding.utf8)!,
                    for: transferCharacteristic!,
                    onSubscribedCentrals: nil
                )
                
                if (eomSent) {
                    // It sent, we're all done
                    sendingEOM = false
                    print("Sent: EOM")
                }
                
                return
            }
        }
    }
    
    /** This callback comes in when the PeripheralManager is ready to send the next chunk of data.
     *  This is to ensure that packets will arrive in the order they are sent
     */
    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
        // Start sending again
        sendData()
    }
    
    /** This is called when a change happens, so we know to stop advertising
     */
    func textViewDidChange(_ textView: UITextView) {
        // If we're already advertising, stop
        if (advertisingSwitch.isOn) {
            advertisingSwitch.setOn(false, animated: true)
            peripheralManager?.stopAdvertising()
        }
    }
    
    /** Start advertising
     */
    @IBAction func switchChanged(_ sender: UISwitch) {
        if advertisingSwitch.isOn {
            // All we advertise is our service's UUID
            peripheralManager!.startAdvertising([
                CBAdvertisementDataServiceUUIDsKey : [transferServiceUUID]
                ])
        } else {
            peripheralManager?.stopAdvertising()
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        print(error ?? "UNKNOWN ERROR")
    }
}

