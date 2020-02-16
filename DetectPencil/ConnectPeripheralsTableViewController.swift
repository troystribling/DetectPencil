//
//  ConnectPeripheralsTableViewController.swift
//  DetectPencil
//
//  Created by Troy Stribling on 2/15/20.
//  Copyright © 2020 Troy Stribling. All rights reserved.
//

import UIKit
import CoreBluetooth

class ConnectPeripheralsTableViewController: UITableViewController {

    enum CellIdentifiers: String {
        case connectdPeripheralTableViewCell
    }

    var connectedPeripherals: [CBPeripheral]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.connectdPeripheralTableViewCell.rawValue,
                                                 for: indexPath) as! ConnectedPeripheralTableViewCell
        return cell
    }

}
