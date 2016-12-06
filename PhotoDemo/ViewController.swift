//
//  ViewController.swift
//  PhotoDemo
//
//  Created by Shikha Gupta on 05/12/16.
//  Copyright © 2016 shikha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func importImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }else{
            displayAlert(title: "Photo Library not Available", message: "Sorry!!Your device does not support photo Library")
        }
        
    }
    
    
    @IBAction func clickImage(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.sourceType = UIImagePickerControllerSourceType.camera
            cameraPicker.allowsEditing = false
            cameraPicker.cameraCaptureMode = .photo
            cameraPicker.modalPresentationStyle = .fullScreen
            present(cameraPicker, animated: true, completion: nil)
        
        }else{
            displayAlert(title: "Camera not avaibale", message: "Sorry!!Your device does not support Camera")
        }
        
    }
    
    
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageView.image = image
        }else{
            print("Image is null")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
   
    
    func displayAlert(title: String, message: String)
    {
        let alertDialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertDialog.addAction(okAction)
        self.present(alertDialog, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

