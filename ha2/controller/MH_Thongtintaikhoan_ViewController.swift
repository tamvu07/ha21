//
//  MH_Thongtintaikhoan_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import DLRadioButton

class MH_Thongtintaikhoan_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var RadioButtonValue:String!
    @IBOutlet weak var txt_date: UITextField!
    private var datePicker:UIDatePicker?
    @IBOutlet weak var Picker_TP: UIPickerView!
    @IBOutlet weak var text_TP: UITextField!
    @IBOutlet weak var txt_hoten: UITextField!
    @IBOutlet weak var txt_diachi: UITextField!
    @IBOutlet weak var bt_nam: DLRadioButton!
    @IBOutlet weak var bt_nu: DLRadioButton!
    @IBOutlet weak var bt_daLapgiaDinh: DLRadioButton!
    @IBOutlet weak var bt_docthan: DLRadioButton!
    
    
    
    var lb_gt = ""
    var lb_hn = ""
    
        var currentUser: UngVien_New = UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: currentUser_1.email, linkAvatar: currentUser_1.linkAvatar, hoso: currentUser_1.status_HS), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: ""))
    
    
    let arr_TP = [
        "An Giang",
        "Bà Rịa - Vũng Tàu",
        "Bắc Giang",
        "Bắc Kạn",
        "Bạc Liêu",
        "Bắc Ninh",
        "Bến Tre",
        "Bình Định",
        "Bình Dương",
        "Bình Phước",
        "Bình Thuận",
        "Cà Mau",
        "Cao Bằng",
        "Đắk Lắk",
        "Đắk Nông",
        "Điện Biên",
        "Đồng Nai",
        "Đồng Tháp",
        "Gia Lai",
        "Hà Giang",
        "Cần Thơ",
        "Đà Nẵng",
        "Hải Phòng",
        "Hà Nội",
        "Thành Phố Hồ Chí Minh",
        "Quảng Nam",
        "Quảng Ngãi",
        "Quảng Ninh",
        "Quảng Trị",
        "Sóc Trăng",
        "Sơn La",
        "Tây Ninh",
        "Thái Bình",
        "Thái Nguyên",
        "Thanh Hóa",
        "Thừa Thiên Huế",
        "Tiền Giang",
        "Trà Vinh",
        "Tuyên Quang",
        "Vĩnh Long"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Picker_TP.delegate = self
        Picker_TP.dataSource = self
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(MH_Thongtintaikhoan_ViewController.dataChanged(dataPicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MH_Thongtintaikhoan_ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        txt_date.inputView = datePicker
        
                var tablename = ref.child("Nguoidung").child("Ungvien")
                // Listen for new comments in the Firebase database
                tablename.observe(.childAdded, with: { (snapshot) in
                    // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict

                    if let postDict = snapshot.value as? [String : AnyObject], currentUser_1.id == snapshot.key
                    {
        
                        // lay thong tin ve cho thong tin tong quan
                        let User_current2 = (postDict["Thongtincanhan"]) as! NSMutableDictionary
                        let HS:String = (User_current2["Hoso"])! as? String ?? "0"
                        let hs  = Int(HS)
                        if(hs == 1)
                        {
                            self.get_data_thongtinlienhe()
                        }
        
                    }else{
                        print("khong co du lieu!")
                    }
        
                })
        
    }
    
    func get_data_thongtinlienhe() {
        
        get_ungvien.shared.fetchData(tableName: ref.child("Nguoidung/Ungvien"), currentUserId: currentUser_1.id) { (UngVien_New, err) in
            if err != "" {
                print(err)
            }
            else {
                self.currentUser = UngVien_New
                self.txt_hoten.text = self.currentUser.Thongtinlienhe?.hoten
                self.txt_date.text = self.currentUser.Thongtinlienhe?.ngaysinh
                let gioitinh = self.currentUser.Thongtinlienhe?.gioitinh
                let honnhan = self.currentUser.Thongtinlienhe?.honnhan
                self.txt_diachi.text = self.currentUser.Thongtinlienhe?.diachi
                self.text_TP.text = self.currentUser.Thongtinlienhe?.thanhpho
                if(gioitinh == "Nam")
                {
                    self.bt_nam.isSelected = true
                    self.lb_gt = "Nam"
                }else{
                    self.bt_nu.isSelected = true
                    self.lb_gt = "Nữ"
                }
               
                if(honnhan == "Đã lập gia đình")
                {
                    self.bt_daLapgiaDinh.isSelected = true
                    self.lb_hn = "Đã lập gia đình"
                }else{
                    self.bt_docthan.isSelected = true
                    self.lb_hn = "Độc thân"
                }

            }
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        lb_gt = ""
        lb_hn = ""
    }

    
    @IBAction func bt_huy(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Bạn chắc chắn muốn huỷ", message: "", preferredStyle: .alert)
        // tao ra 2 button
        let bt_1:UIAlertAction = UIAlertAction(title: "Huỷ", style: .default) { (UIAlertAction) in
            // nho man hinh chinh truy cap den no
//            self.isLogOut()
            tttk = 0
//            self.navigationController?.popToRootViewController(animated: false)
        }
        let bt_2:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(bt_1)
        alert.addAction(bt_2)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)  {
        view.endEditing(true)
    }
    
    // function ngay thang nam
    @objc func dataChanged(dataPicker: UIDatePicker) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MM/dd/yyyy"
        txt_date.text = dataFormatter.string(from: (datePicker?.date)!)
        view.endEditing(true)
    }
    //radio button
    @objc @IBAction private func logSelectedButton(_ radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected ha .\n", button.titleLabel!.text!));
            }
        } else {
            RadioButtonValue = radioButton.selected()?.titleLabel?.text!
            //            print(String(format: "%@ is selected.\n", RadioButtonValue));
            let x:String = String(format: "%@", RadioButtonValue);
            if(x == "Nam")
            {
                print("..............vua chon la:\(x)....................\n")
                lb_gt = x
            }else
                if(x == "Nữ")
                {
                   print("..............vua chon la:\(x)....................\n")
                    lb_gt = x
            }else if(x == "Độc thân")
            {
                print("..............vua chon la:\(x)....................\n")
                lb_hn = x
            }else
                if(x == "Đã lập gia đình")
                {
                    print("..............vua chon la:\(x)....................\n")
                    lb_hn = x
            }
        }
    }

    // lam viec voi chon thanh pho ppicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr_TP.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr_TP[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text_TP.text = arr_TP[row]
    }
    
    // khi bam nut luu
    @IBAction func bt_Luu(_ sender: Any) {
        if(txt_hoten.text! == "" || txt_date.text! == "" || txt_diachi.text! == "" || text_TP.text! == "" || self.lb_hn == "" || self.lb_gt == "")
        {
            let alert  = UIAlertController(title: "Thông báo", message: "Bạn vui lòng nhập đủ thông tin !", preferredStyle: .alert)
            let btn_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(btn_ok)
            present(alert, animated: true, completion: nil)
        }else{
            // luu du lieu len firebase
            // ref.child de truy van table trong database , lay ra ID current USER hien tai
            var tablename = ref.child("Nguoidung").child("Ungvien")
            // Listen for new comments in the Firebase database
            tablename.observe(.childAdded, with: { (snapshot) in
                // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
                if let postDict = snapshot.value as? [String : AnyObject], currentUser_1.id == snapshot.key
                {
                    var tablename2 = ref.child("Nguoidung").child("Ungvien").child("\(snapshot.key)").child("Thongtinlienhe")
                    let tt:Dictionary<String,String> = [
                        "Hoten": self.txt_hoten.text!,
                        "Ngaysinh": self.txt_date.text!,
                        "Gioitinh": self.lb_gt,
                        "Honnhan": self.lb_hn,
                        "Email": currentUser_1.email,
                        "Điachi": self.txt_diachi.text!,
                        "SDT": "....",
                        "Thanhpho": self.text_TP.text!
                    ]
                    
                    tablename2.setValue(tt)
                    tttk = 1
                    let alert:UIAlertController = UIAlertController(title: "Đã lưu", message: "", preferredStyle: .alert)
                    let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(bt)
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    print("khong tim thay ung vien !")
                }
            })
        }
        tttk = 1
    }
}
