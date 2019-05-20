//
//  DangKy_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import DLRadioButton
import FirebaseStorage
var RadioButtonValue:String!
var q:String = ""
class DangKy_ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txt_email: UITextField!
    
    @IBOutlet weak var txt_pass: UITextField!
    
    @IBOutlet weak var txt_repass: UITextField!
    @IBOutlet weak var avatar: UIImageView!
     var imgdata:Data!
    var handle:AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.isUserInteractionEnabled = true
        let TapGesture =  UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.avatar.addGestureRecognizer(TapGesture)
        // khi moi vao co anh tu may luon
        imgdata = UIImage(named: "person")!.pngData()
        txt_pass.resignFirstResponder()
    }
    
    // lam viec voi image
    @objc func handleTap(_ sender: UITapGestureRecognizer){
 
        let alert:UIAlertController = UIAlertController(title: "thong bao", message: "chon", preferredStyle: .alert)
        // tao ra 2 button
        let btphoto:UIAlertAction = UIAlertAction(title: "pho to", style: .default) { (UIAlertAction) in
            // chon vao thu muc anh va lay anh o thu vien
            let ImgPicker = UIImagePickerController()
            ImgPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            ImgPicker.delegate = self
            // khong cho thay doi anh
            ImgPicker.allowsEditing = false
            // nho man hinh chinh truy cap den no
            self.present(ImgPicker, animated: true, completion: nil)
        }
        
        let btcamera:UIAlertAction = UIAlertAction(title: "camera", style: .default) { (UIAlertAction) in
            // kiem tra xem co camera khong
            if(UIImagePickerController.isSourceTypeAvailable(.camera))
            {
                let ImgPicker = UIImagePickerController()
                ImgPicker.sourceType = UIImagePickerController.SourceType.camera
                ImgPicker.delegate = self
                // khong cho thay doi anh
                ImgPicker.allowsEditing = false
                // nho man hinh chinh truy cap den no
                self.present(ImgPicker, animated: true, completion: nil)
            }
            else
            {
                print("khong co camera......!")
            }
        }
        
        alert.addAction(btphoto)
        alert.addAction(btcamera)
        // phai dong no len
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // khi vao camera hay photo thi goi den ham nay
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // chua biet no tra ve kieu gi nen ap ve UIImage
        let chooseimage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // giam do phan giai cua tam hinh
        // lay ra gia tri nao cao nhat
        let imgvalue = max(chooseimage.size.width,chooseimage.size.height)
        if(imgvalue > 3000)
        {
            // giam do phan giai tam hinh xuong 0.1
            imgdata = chooseimage.jpegData(compressionQuality: 0.1)
        }
        else if(imgvalue > 2000)
        {
            // giam do phan giai tam hinh xuong 0.1
            imgdata = chooseimage.jpegData(compressionQuality: 0.3)
        }
        else
        {
            imgdata = chooseimage.pngData()
        }
        // truyen tam hinh moi lay vao UIImageView
        avatar.image = UIImage(data: imgdata)
        // sau do dong hop thoai lai
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func bt_X_thoat(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
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
            if(x == "Ứng viên")
            {
                q = x
                nguoidung = 0
            }else
                if(x == "Công ty")
                {
                    q = x
                    nguoidung = 1
            }
        }
    }
    
    @IBAction func bt_dangky(_ sender: Any) {
        let email:String = txt_email.text!
        let pass:String = txt_pass.text!
        let repass:String = txt_repass.text!
        
        if(email == "" || pass == "" || repass == "" || q  == "")
        {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Nhập Đủ Thông Tin", preferredStyle: .alert)
            let bt_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(bt_ok)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
        // tao tai khoan
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            if(error == nil)
            {
              
                // dua avatar len database khi dang ky
                let Avatar_Ref = storageRef.child("hinhs/\(email).jpg")
                // Upload the file to the path "images/rivers.jpg"
                let uploadTask = Avatar_Ref.putData(self.imgdata, metadata: nil) { (metadata, error) in
                    guard let metadata = metadata else {
                        print("loi up load lan 1")
                        return
                    }
                    // Metadata contains file metadata such as size, content-type.
                    let size = metadata.size
                    // You can also access to download URL after upload.
                    Avatar_Ref.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                            print("loi up load lan 2")
                            return
                        }
                        
                        // cah de luu ten va tam hinh len firebase
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.photoURL = downloadURL
                        changeRequest?.commitChanges { (error) in
                            if let error = error{
                                print("loi upload profile")
                            }else{
//                                print("dang ky thanh cong ...... chuyen trang ! \n")
                                // dang ky xong ma ko co loi thi cho dang nhap luon
                                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                                    if(error == nil)
                                    {
//                                        print("ok dang nhap thanh cong !")
                                        // them nguoi dung
                                        self.themnguoidung()
                                        if(nguoidung == 0)
                                        {
                                            User_name = currentUser_1.email
                                            User_flag = 1
                                             q = ""
                                            self.goto_MH_chucnang()
                                        }
                                        if(nguoidung == 1)
                                        {
                                            User_name = currentUser_2.email
                                            User_flag = 1
                                            q = ""
                                            print("di den man hinh cong ty .........\n")
                                            self.goto_MH_chucnang_CT()
                                            
                                        }
                                        
                                    }
                                }
                                
                            }
                        }
                    }
                }
                // de up load file len phai chay lenh uploadTask.resume()
                uploadTask.resume()
            }
            else
            {
               let alert = UIAlertController(title: "Thông Báo", message: "Lỗi Đăng Ký !", preferredStyle: .alert)
                let bt_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(bt_ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
      }
    }
//
    func goto_MH_chucnang()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_chucnang")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    func goto_MH_chucnang_CT()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_chucnang_CT")
        navigationController?.pushViewController(scr!, animated: true)
    }

    func themnguoidung() {
        // tao tai khoan thanh cong thi se luu thong tin nguoi dung vao database
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL

            
            if(nguoidung == 0)
            {
                
//                currenUser = User(id: uid, email: email!, linkAvatar: String("\(photoURL!)"))
                currentUser_1 = User_1(id: uid, email: email!, linkAvatar: String("\(photoURL!)"), status_HS: 0)
                let tableUser = ref.child("Nguoidung").child("Ungvien").child(currentUser_1.id).child("Thongtincanhan")
                
                let t1:Dictionary<String,String> = [
                    "Email": currentUser_1.email,
                    "LinkAvatar":currentUser_1.linkAvatar,
                    "Hoso": String(currentUser_1!.status_HS)
                ]
                
                tableUser.setValue(t1)
                let url:URL = URL(string: currentUser_1.linkAvatar)!
                do{
                    let data:Data = try Data(contentsOf: url)
                    currentUser_1.Avatar = UIImage(data: data)
                }
                catch{
                    print("loi load hinh")
                }
                
            }else
            {
                
//                currentUser_2 = User(id: uid, email: email!, linkAvatar: String("\(photoURL!)"))
                currentUser_2 = User(id: uid, email: email!, linkAvatar: String("\(photoURL!)"), diachi: "", sdt: "", tenCT: "")
                let tableUser = ref.child("Nguoidung").child("Congty").child(currentUser_2.id).child("Thongtincanhan")
                
                let t1:Dictionary<String,String> = [
                    "Email": currentUser_2.email,
                    "LinkAvatar":currentUser_2.linkAvatar,
                    "Diachi": "",
                    "SDT": "",
                    "TenCT": "" ]
                
                tableUser.setValue(t1)
                let url:URL = URL(string: currentUser_2.linkAvatar)!
                do{
                    let data:Data = try Data(contentsOf: url)
                    currentUser_2.Avatar = UIImage(data: data)
                }
                catch{
                    print("loi load hinh")
                }
            }

            

        }
    }


}
