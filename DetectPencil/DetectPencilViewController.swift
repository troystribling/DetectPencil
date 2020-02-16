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

    enum SegueIdentifier: String {
        case detectPencilToConnectPeripherals
    }

    var tableView: ConnectPeripheralsTableViewController!
    var central: CBCentralManager!

    override func viewDidLoad() {
        central = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            return
        }
        switch segueIdentifier {
        case .detectPencilToConnectPeripherals:
            tableView = segue.destination as? ConnectPeripheralsTableViewController
        }
    }

    // CBCentralManagerDelegate

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            break
        default:
            break
        }
    }
}
