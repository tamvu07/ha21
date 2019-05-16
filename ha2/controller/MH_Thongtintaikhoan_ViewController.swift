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
    var lb_gt = ""
    var lb_hn = ""
    
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
                if let postDict = snapshot.value as? [String : AnyObject], currenUser.id == snapshot.key
                {
                    var tablename2 = ref.child("Nguoidung").child("Ungvien").child("\(snapshot.key)").child("Thongtinlienhe")
                    let tt:Dictionary<String,String> = [
                        "Hoten": self.txt_hoten.text!,
                        "Ngaysinh": self.txt_date.text!,
                        "Gioitinh": self.lb_gt,
                        "Honnhan": self.lb_hn,
                        "Email":currenUser.email,
                        "Điachi": self.txt_diachi.text!,
                        "SDT": "....",
                        "Thanhpho": self.text_TP.text!
                    ]
                    
                    tablename2.setValue(tt)
                    let alert:UIAlertController = UIAlertController(title: "Đã lưu", message: "", preferredStyle: .alert)
                    let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(bt)
                    self.present(alert, animated: true, completion: nil)
                    
//                    let User_current = (postDict["Thongtincanhan"]) as! NSMutableDictionary
//                    let email:String = (User_current["Email"])! as? String ?? "taolao@gmail.com"
//                    let quyen:String = (User_current["Quyen"])! as? String ?? "taolao"
//                    let linkAvatar:String = (User_current["LinkAvatar"])! as? String ?? "taolao"
//
//                    let user:User = User(id: snapshot.key, email: email, linkAvatar: linkAvatar, quyen: Int(quyen)!)
//                    currenUser = user
//
//                    if(Int(currenUser.quyen) == 1)
//                    {
//                        print("---------------- Chuyen man hinh cho user voi quyen la 1 ---------------")
//                        self?.goto_Screen_Main_khach_hang()
//                        return
//                    }
//                    else {
//
//                    }
                }else{
                    print("khong tim thay ung vien !")
                    print(".....id 1:..\(currenUser.id)......id 2: \(snapshot.key)...")
                }
            })
            
            
            

        }
//        print("...ten....\(txt_hoten.text!).....\n")
//        print("....ngay...\(txt_date.text!).....\n")
//        print("....dia chi...\(txt_diachi.text!).....\n")
//        print("....TP...\(text_TP.text!).....\n")
//        print(".....hon nhan la :..\(self.lb_hn).....\n")
//        print(".....gioi tinh la :..\(self.lb_gt).....\n")
//        print("......user hien tai la :\(currenUser.email!).....\n")
        

        
        tttk = 1
        print("....vua bam 1:.\(tttk).....\n")
        
//        print("............current ủe la :\(currenUser.email)....\n")
        // dua du lieu len database
//        let tablename = ref.child("Thong Tin User")
//        let congtys = tablename.child("Thong Tin")
//        // khoi tao 1 user de up len fire base
//        let ct:Dictionary<String,String> = ["ten cong ty":"phat dat",
//                                            "cong viec":"công nghệ thực phẩm",
//                                            "dia chi":"123/123 duong so 2",
//                                            "avatar":"https://newimageasia.vn/image/catalog/newimage/Home3-091.png",
//                                            "luong":"1000 $",
//                                            "motacongviec":"làm việc toàn thời gian, độ tuổi: lớn hơn 17 nhỏ hơn 31, siêng năng, có tinh thần học hỏi, biết tiếng anh. ",
//                                            "email":"phatdai@gmail.com",
//                                            "sdt":"0956211155"
//
//        ]
//        congtys.setValue(ct)
    }
    
    
    
    
}
