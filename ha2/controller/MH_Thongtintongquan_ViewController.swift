//
//  MH_Thongtintongquan_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class MH_Thongtintongquan_ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var txt_1: UITextField!
    @IBOutlet weak var txt_2: UITextField!
    @IBOutlet weak var txt_3: UITextField!
    @IBOutlet weak var txt_4: UITextField!
    @IBOutlet weak var txt_5: UITextField!
    @IBOutlet weak var txt_6: UITextField!
    @IBOutlet weak var txt_7: UITextField!
    @IBOutlet weak var txt_8: UITextField!
    @IBOutlet weak var txt_9: UITextField!
    @IBOutlet weak var picker_2: UIPickerView!
    @IBOutlet weak var picker_3: UIPickerView!
    @IBOutlet weak var picker_4: UIPickerView!
    @IBOutlet weak var picker_5: UIPickerView!
    @IBOutlet weak var picker_6: UIPickerView!
    @IBOutlet weak var picker_7: UIPickerView!
    @IBOutlet weak var picker_8: UIPickerView!
    var currentUser: UngVien_New = UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: currentUser_1.email, linkAvatar: currentUser_1.linkAvatar, hoso: currentUser_1.status_HS), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: ""))
    
    
    
    let mangtong:Array<Array<String>> = [
        ["Chọn cấp bậc hiện","Nhân viên","Trưởng nhóm","Chuyên Trưởng phó","Chuyên gia","Quản lý cấp cao"],
        ["Chọn cấp bậc","Nhân viên","Trưởng nhóm","Chuyên Trưởng phó","Chuyên gia","Quản lý cấp cao"],
        ["Chọn ngành nghề","Tài chính/Kế toán/Kiểm toán","Hành chính/Thư ký/Trợ lý","PG/PB/Lễ tân","Kinh doanh","Nhân sự","Khác","Chăn sóc khách hàng","Bán hàng","Giáo /Đào tạo/Thư viện","Báo chí/Biên tập viên"],
                                         ["An Giang",
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
                                          "Vĩnh Long"],
                                         ["Chọn học vấn","Cao học","Đại học","Cao đẳng","Trung cấp","Trung học","Chứng chỉ","Lao động phổ  "],
                                         ["Chọn số năm","Chưa có kinh nghiệm","Dưới 1 năm","1 năm","2 năm","3 năm","4 năm","5 năm","Trên 5 năm"],
                                         ["Chọn hình thức làm việc","Nhân viên chính thức","Nhân viên thời vụ","Bán thời gian","Làm thêm ngoài giờ","Thực tập và dự án"]
        ]
    var x:Int! = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker_2.delegate = self
        picker_2.dataSource = self
        picker_3.delegate = self
        picker_3.dataSource = self
        addright_image(txtField: txt_2)
        addright_image(txtField: txt_3)
        addright_image(txtField: txt_4)
        addright_image(txtField: txt_5)
        addright_image(txtField: txt_6)
        addright_image(txtField: txt_7)
        addright_image(txtField: txt_8)
//        addright_image(txtField: txt_9)
//        add_close(picker_0: picker_2)
        picker_2.reloadInputViews()
        
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
                    self.get_data_thongtintongquan()
                }
                
            }else{
                print("khong co du lieu!")
            }
            
        })
        
        
    }
    
    func get_data_thongtintongquan() {
        
        get_ungvien.shared.fetchData(tableName: ref.child("Nguoidung/Ungvien"), currentUserId: currentUser_1.id) { (UngVien_New, err) in
            if err != "" {
                print(err)
            }
            else {
                self.currentUser = UngVien_New
                self.txt_1.text = self.currentUser.Thongtintongquan?.vitrimongmuon
                self.txt_2.text = self.currentUser.Thongtintongquan?.capbachientai
                self.txt_3.text = self.currentUser.Thongtintongquan?.capbacmongmuon
                self.txt_4.text = self.currentUser.Thongtintongquan?.nghanhnghemongmuon
                self.txt_5.text = self.currentUser.Thongtintongquan?.diadiemmongmuon
                self.txt_6.text = self.currentUser.Thongtintongquan?.trinhdohocvan
                self.txt_7.text = self.currentUser.Thongtintongquan?.sonamkinhnghiem
                self.txt_8.text = self.currentUser.Thongtintongquan?.hinhthuclamviec
                self.txt_9.text = self.currentUser.Thongtintongquan?.mucluongtoithieu
            }
        }
        
        
    }
    
    @IBAction func bt_Luu(_ sender: Any) {
        print("...txt_1....\(txt_1.text!).....\n")
        print("...txt_1....\(txt_2.text!).....\n")
        print("...txt_1....\(txt_3.text!).....\n")
        print("...txt_1....\(txt_4.text!).....\n")
        print("...txt_1....\(txt_5.text!).....\n")
        print("...txt_1....\(txt_6.text!).....\n")
        print("...txt_1....\(txt_7.text!).....\n")
        print("...txt_1....\(txt_8.text!).....\n")
        print("...txt_1....\(txt_9.text!).....\n")
//        print("......user hien tai la :\(currenUser.email!).....\n")
        // luu len firebase
        
        ///////////////
        if(txt_1.text! == "" || txt_2.text! == "" || txt_3.text! == "" || txt_4.text! == "" || txt_5.text! == "" || txt_6.text! == "" || txt_7.text! == "" || txt_8.text! == "" || txt_9.text! == "" )
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
                    var tablename2 = ref.child("Nguoidung").child("Ungvien").child("\(snapshot.key)").child("Thongtintongquan")
                    let tt:Dictionary<String,String> = [
                        "vitrimongmuon": self.txt_1.text!,
                        "capbachientai": self.txt_2.text!,
                        "capbacmongmuon": self.txt_3.text!,
                        "nghanhnghemongmuon": self.txt_4.text!,
                        "diadiemmongmuon":self.txt_5.text!,
                        "trinhdohocvan": self.txt_6.text!,
                        "sonamkinhnghiem": self.txt_7.text!,
                        "hinhthuclamviec": self.txt_8.text!,
                        "mucluongtoithieu": self.txt_9.text!
                    ]
                    
                    tablename2.setValue(tt)
                    let alert:UIAlertController = UIAlertController(title: "Đã lưu", message: "", preferredStyle: .alert)
                    let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(bt)
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    print("khong tim thay ung vien !")
                }
            })
            
            
        }

        tttq = 1
        
        
        ////////////////
        
        let alert:UIAlertController = UIAlertController(title: "Đã lưu", message: "", preferredStyle: .alert)
        let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(bt)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    // lam viec voi huy picker
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        if(x == 2)
        {
            self.picker_2.isHidden = false
        }
        if(x == 3)
        {
            self.picker_3.isHidden = false
        }
        if(x == 4)
        {
            self.picker_4.isHidden = false
        }
        if(x == 5)
        {
            self.picker_5.isHidden = false
        }
        if(x == 6)
        {
            self.picker_6.isHidden = false
        }
        if(x == 7)
        {
            self.picker_7.isHidden = false
        }
        if(x == 8)
        {
            self.picker_8.isHidden = false
        }
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(MH_Thongtintongquan_ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(MH_Thongtintongquan_ViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }

    @objc func doneClick() {
        if(x == 2)
        {
            txt_2.resignFirstResponder()
        }
 
        if(x == 3)
        {
            txt_3.resignFirstResponder()
        }
        if(x == 4)
        {
            txt_4.resignFirstResponder()
        }
        if(x == 5)
        {
            txt_5.resignFirstResponder()
        }
        if(x == 6)
        {
            txt_6.resignFirstResponder()
        }
        if(x == 7)
        {
            txt_7.resignFirstResponder()
        }
        if(x == 8)
        {
            txt_8.resignFirstResponder()
        }
        self.hide_piker()
    }
    @objc func cancelClick() {
        if(x == 2)
        {
            txt_2.text = ""
            txt_2.resignFirstResponder()
        }
        if(x == 3)
        {
            txt_3.text = ""
            txt_3.resignFirstResponder()
        }
        if(x == 4)
        {
            txt_4.text = ""
            txt_4.resignFirstResponder()
        }
        if(x == 5)
        {
            txt_5.text = ""
            txt_5.resignFirstResponder()
        }
        if(x == 6)
        {
            txt_6.text = ""
            txt_6.resignFirstResponder()
        }
        if(x == 7)
        {
            txt_7.text = ""
            txt_7.resignFirstResponder()
        }
        if(x == 8)
        {
            txt_8.text = ""
            txt_8.resignFirstResponder()
        }
        self.hide_piker()
    }
    
    func hide_piker()  {
        if(x == 2)
        {
            self.picker_2.isHidden = true
        }
        if(x == 3)
        {
            self.picker_3.isHidden = true
        }
        if(x == 4)
        {
            self.picker_4.isHidden = true
        }
        if(x == 5)
        {
            self.picker_5.isHidden = true
        }
        if(x == 6)
        {
            self.picker_6.isHidden = true
        }
        if(x == 7)
        {
            self.picker_7.isHidden = true
        }
        if(x == 8)
        {
            self.picker_8.isHidden = true
        }
    }
    // hien thi dau down tren textfield
    func addright_image(txtField: UITextField) {
        var btnColor = UIButton(type: .custom)

        btnColor.frame = CGRect(x: CGFloat(txtField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        btnColor.setBackgroundImage(UIImage(named: "down.png"), for: [])
        txtField.addSubview(btnColor)
        
    }

    func add_close(picker_0: UIPickerView) {
        var btnColor = UIButton(type: .custom)
        
        btnColor.frame = CGRect(x: CGFloat(picker_0.frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        btnColor.setBackgroundImage(UIImage(named: "person.png"), for: [])
        picker_0.addSubview(btnColor)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countRows : Int = mangtong[0].count
        if(pickerView == picker_3 )
        {
            countRows = mangtong[1].count
        }
        if(pickerView == picker_4 )
        {
            countRows = mangtong[2].count
        }
        if(pickerView == picker_5 )
        {
            countRows = mangtong[3].count
        }
        if(pickerView == picker_6 )
        {
            countRows = mangtong[4].count
        }
        if(pickerView == picker_7 )
        {
            countRows = mangtong[5].count
        }
        if(pickerView == picker_8 )
        {
            countRows = mangtong[6].count
        }
       return countRows
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == picker_2)
        {
            return mangtong[0][row]
        }
        else if(pickerView == picker_3)
        {
            return mangtong[1][row]
        }
        else if(pickerView == picker_4)
        {
            return mangtong[2][row]
        }
        else if(pickerView == picker_5)
        {
            return mangtong[3][row]
        }
        else if(pickerView == picker_6)
        {
            return mangtong[4][row]
        }
        else if(pickerView == picker_7)
        {
            return mangtong[5][row]
        }
        else if(pickerView == picker_8)
        {
            return mangtong[6][row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(x == 2)
        {
           self.txt_2.text = mangtong[0][row]
        }
        if(x == 3)
        {
           self.txt_3.text = mangtong[1][row]
        }
        if(x == 4)
        {
            self.txt_4.text = mangtong[2][row]
        }
        if(x == 5)
        {
            self.txt_5.text = mangtong[3][row]
        }
        if(x == 6)
        {
            self.txt_6.text = mangtong[4][row]
        }
        if(x == 7)
        {
            self.txt_7.text = mangtong[5][row]
        }
        if(x == 8)
        {
            self.txt_8.text = mangtong[6][row]
        }

    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.txt_2)
        {
            show_border_textfield(txt_2)
            removed_border_textfield(txt_3)
            removed_border_textfield(txt_4)
            removed_border_textfield(txt_5)
            removed_border_textfield(txt_6)
            removed_border_textfield(txt_7)
            removed_border_textfield(txt_8)
            x = 2
            self.pickUp(txt_2)
            
        }
        if(textField == self.txt_3)
        {
            show_border_textfield(txt_3)
            removed_border_textfield(txt_2)
            removed_border_textfield(txt_4)
            removed_border_textfield(txt_5)
            removed_border_textfield(txt_6)
            removed_border_textfield(txt_7)
            removed_border_textfield(txt_8)
            x = 3
             self.pickUp(txt_3)
        }
        if(textField == self.txt_4)
        {
            show_border_textfield(txt_4)
            removed_border_textfield(txt_3)
            removed_border_textfield(txt_2)
            removed_border_textfield(txt_5)
            removed_border_textfield(txt_6)
            removed_border_textfield(txt_7)
            removed_border_textfield(txt_8)
            x = 4
            self.pickUp(txt_4)
        }
        if(textField == self.txt_5)
        {
            show_border_textfield(txt_5)
            removed_border_textfield(txt_3)
            removed_border_textfield(txt_4)
            removed_border_textfield(txt_2)
            removed_border_textfield(txt_6)
            removed_border_textfield(txt_7)
            removed_border_textfield(txt_8)
            x = 5
            self.pickUp(txt_5)
        }
        if(textField == self.txt_6)
        {
            show_border_textfield(txt_6)
            removed_border_textfield(txt_3)
            removed_border_textfield(txt_4)
            removed_border_textfield(txt_5)
            removed_border_textfield(txt_2)
            removed_border_textfield(txt_7)
            removed_border_textfield(txt_8)
            x = 6
            self.pickUp(txt_6)
        }
        if(textField == self.txt_7)
        {
            show_border_textfield(txt_7)
            removed_border_textfield(txt_3)
            removed_border_textfield(txt_4)
            removed_border_textfield(txt_5)
            removed_border_textfield(txt_6)
            removed_border_textfield(txt_2)
            removed_border_textfield(txt_8)
            x = 7
            self.pickUp(txt_7)
        }
        if(textField == self.txt_8)
        {
            show_border_textfield(txt_8)
            removed_border_textfield(txt_3)
            removed_border_textfield(txt_4)
            removed_border_textfield(txt_5)
            removed_border_textfield(txt_6)
            removed_border_textfield(txt_7)
            removed_border_textfield(txt_2)
            x = 8
            self.pickUp(txt_8)
        }
    }
    
    func removed_border_textfield(_ textField: UITextField) {

            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.borderWidth = 0.0
    }
    
    func show_border_textfield(_ textField: UITextField) {
       
            textField.layer.borderColor = UIColor.blue.cgColor
            textField.layer.borderWidth = 2.0
    }
    
}
