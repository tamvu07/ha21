//
//  MH_Search_01_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
var Ng:String!

class MH_Search_01_ViewController: UIViewController {

    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    let Array_Nganh = [
        "Nhóm ngành sản xuất và chế biến",
        "Nhóm ngành kiến trúc và xây dựng",
        "Nhóm những ngành kinh doanh",
        "Nhóm các ngành công nghệ - thông tin",
        "Nhóm ngành luật - nhân văn",
        "Nhóm ngành nghệ thuật - thẩm mỹ - đồ họa",
        "Nhóm ngành báo chí - khoa học và xã hội",
        "Nhóm ngành khoa học cơ bản",
        "Nhóm ngành nông - lâm - ngư nghiệp"
    ]
    
    var search_department = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func goto_MH_Search_01_01()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Search_01_01")
        navigationController?.pushViewController(scr!, animated: true)
    }
}


extension MH_Search_01_ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return search_department.count
        }else{
            return Array_Nganh.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        if searching {
            cell.textLabel?.text = search_department[indexPath.row]
        }else{
            cell.textLabel?.text = Array_Nganh[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var text = ""
        if searching {
            text = search_department[indexPath.row]
        }else{
            text = Array_Nganh[indexPath.row]
        }
        Ng = text
        self.goto_MH_Search_01_01()
    }
}

extension MH_Search_01_ViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search_department = Array_Nganh.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text  = ""
        tableView.reloadData()
    }
}
