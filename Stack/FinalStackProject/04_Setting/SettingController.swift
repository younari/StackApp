//
//  SettingViewController.swift
//  1018_Fanxy
//
//  Created by Kimkeeyun on 20/10/2017.
//  Copyright © 2017 younari. All rights reserved.
//

import UIKit
class SettingController: UIViewController,RouterProtocol {
    static var storyboardName: String = "Main"
    
    // MARK: - Data Property
    var settingData: [Setting]?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingData = GlobalState.shared.settings
    }
}

// MARK - Custom Cell Delegate
extension SettingController: SettingCellDelegate {
    func didChangedSwitchValue(_ sender: UISwitch) {
        // switch value changed code in here
    }
}

// MARK: - TableView Source
extension SettingController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = settingData?[section] else { return 0 }
        return data.cellContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        let data = GlobalState.shared.settings[indexPath.section]
        cell.index = indexPath.row
        cell.data = data
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = GlobalState.shared.settings[section]
        return section.sectionTitle
    }
    
    // MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect cell
        tableView.deselectRow(at: indexPath, animated: true)
        
        // cellMenuType (subscript grammar)
        let cell = tableView.cellForRow(at: indexPath) as? SettingTableViewCell
        let cellMenuType = cell?[indexPath.section, indexPath.row]
        switch cellMenuType {
        case .infoMenu?:
            /*SB instantiate으로 실행*/
            /*guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileInfoVC") else { return }
             self.navigationController?.pushViewController(nextVC, animated: true)*/

            /*Manual Segue로 실행*/
            performSegue(withIdentifier: "ProfileInfoVC", sender: self)
        case .logout?:
            print("")
        case .changePW?:
            print("")
        case .memberout?:
            print("")
        default:
            print("")
        }
    }
}
