//
//  DetectPencilViewController.swift
//  DetectPencil
//
//  Created by Troy Stribling on 2/15/20.
//  Copyright © 2020 Troy Stribling. All rights reserved.
//

import UIKit
import CoreBluetooth

class DetectPencilViewController: UIViewController, CBCentralManagerDelegate {

    @IBOutlet weak var statusLabel: UILabel!

    var central: CBCentralManager!
    var timer: Timer?

    override func viewDidLoad() {
        central = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        super.viewDidLoad()
    }

    // CBCentralManagerDelegate

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            getConnectedPeripherals()
            startTimer()
        default:
            stopTimer()
        }
    }

    func getConnectedPeripherals() {
        guard central.state == .poweredOn else {
            return
        }
        var status = false
        let peripherals = central.retrieveConnectedPeripherals(withServices: [CBUUID(string: "180A")])
        for peripheral in peripherals {
            if let name = peripheral.name, name == "Apple Pencil" {
                status = true
                break
            }
        }
        if status {
            setConnectedStatus()
        } else {
            setDisconnectedStatus()
        }

    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.getConnectedPeripherals()
        }
    }

    func setDisconnectedStatus() {
        statusLabel.text = "Disconnected"
        statusLabel.textColor = .red
    }

    func setConnectedStatus() {
        statusLabel.text = "Connected"
        statusLabel.textColor = .green
    }
}
