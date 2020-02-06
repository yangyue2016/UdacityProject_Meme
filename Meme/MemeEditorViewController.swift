//
//  ViewController.swift
//  Meme
//
//  Created by MacAir11 on 2019/10/3.
//  Copyright © 2019 Udacity. All rights reserved.
//
/*
import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var topBar: UIToolbar!
    @IBOutlet weak var bottomBar: UIToolbar!
    
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imagePickerView: UIImageView!
    
    var textFieldTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topText.text = "Top"
        bottomText.text = "Buttom"
        topText.delegate = self
        bottomText.delegate = self
        
        prepareTextField(textField: topText, defaultText:"TOP")
        prepareTextField(textField: bottomText, defaultText:"BOTTOM")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let center = NotificationCenter.default
        center.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    // MARK: Keyboard Setting
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if textFieldTag == 1 && self.view.frame.origin.y == 0 {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let keyboardFrame: NSValue = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        return keyboardHeight
    }
    // MARK: Font Style
    
    let strokeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor : UIColor.black,
        NSAttributedString.Key.foregroundColor : UIColor.white,
        .strokeWidth : -2,
        .font : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40 )!,
        ] as [NSAttributedString.Key : Any]
    
    // MARK: textField Setting
    
    func prepareTextField(textField: UITextField, defaultText: String) {
        topText.defaultTextAttributes = strokeTextAttributes
        bottomText.defaultTextAttributes = strokeTextAttributes
        topText.textAlignment = .center
        bottomText.textAlignment = .center
        // topText.adjustsFontSizeToFitWidth = true
        // bottomText.adjustsFontSizeToFitWidth = true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.textFieldTag = textField.tag
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 0 { topText.text = "" }
        if textField.tag == 1 { bottomText.text = "" }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    func pickImage(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func pickAnImage(_ sender: Any) {
        pickImage(sourceType: .photoLibrary)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        pickImage(sourceType: .camera)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imagePickerView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: generate Meme
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func shareImg(_ sender: Any) {
        
        let memedImage = generateMeme()
        
        let shareController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { (activityType, completed, returnedItems, activityError) -> Void in
            if (completed) {
                self.save(memedImage: memedImage)
                //Dismiss the shareActivityViewController
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        present(shareController, animated: true, completion: nil)
    }
    
    
    func generateMeme() -> UIImage {
        
        self.topBar.isHidden = true
        self.bottomBar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.topBar.isHidden = false
        self.bottomBar.isHidden = false
        
        return memedImage
    }
    func save(memedImage: UIImage) {
        // Create the meme
        let meme = Meme(topText: topText.text!, bottomText: bottomText.text!, originalImage: imagePickerView.image!, memedImage: memedImage)

        // Add it to the memes array in the Application Delegate
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
}
*/
import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    let textFieldDelegate = TextFieldDelegate()

    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet var imagePickerView: UIImageView!
    @IBOutlet weak var imageAlbumPicker: UIBarButtonItem!
    @IBOutlet weak var imageCameraPicker: UIBarButtonItem!
    @IBOutlet weak var textTOP: UITextField!
    @IBOutlet weak var textBOTTOM: UITextField!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var pickBar: UIToolbar!
    
    //IBActions
    
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        pickImage(sourceType: UIImagePickerController.SourceType.photoLibrary)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        pickImage(sourceType: UIImagePickerController.SourceType.camera)
    }
    
    func pickImage(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func textTOPEditingChanged(_ sender: Any) {
        
        if (textTOP.text?.count)!>0 && (imagePickerView.image != nil)
        {
            shareButton.isEnabled = true
            cancelButton.isEnabled = true
        }
        else{
            shareButton.isEnabled = false
            cancelButton.isEnabled = false
            
        }
    }
    
    @IBAction func textTOPEditingDidBegin(_ sender: Any) {
        if textTOP.text == "TOP"{
            textTOP.text = ""
        }
    }
    
    @IBAction func textBOTTOMEditingChanged(_ sender: Any) {
        if (textBOTTOM.text?.count)!>0 && (imagePickerView.image != nil)
        {
            shareButton.isEnabled = true
            cancelButton.isEnabled = true
        }
        else{
            shareButton.isEnabled = false
            cancelButton.isEnabled = false
        }
    }
    
    @IBAction func textBOTTOMEditingDidBegin(_ sender: Any) {
        if textBOTTOM.text == "BOTTOM"{
            textBOTTOM.text = ""
        }
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let memedImage = generateMemedImage()
        let activityViewController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        // setting up dismissal of the activity view once the meme is successfully shared:
        activityViewController.completionWithItemsHandler = {
            (activity, success, items, error) in
            if (success) {
                self.dismiss(animated: true, completion: nil)
                self.reset()
            }
        }
        present(activityViewController, animated: true, completion: saveMeme)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        reset()
    }
    
    
    func reset(){
        textTOP.text = "TOP"
        textBOTTOM.text = "BOTTOM"
        imagePickerView.image = nil
        textTOP.isEnabled = false
        textBOTTOM.isEnabled = false
        imageAlbumPicker.isEnabled = true
        imageCameraPicker.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        shareButton.isEnabled = false
        view.bringSubviewToFront(textTOP)
        view.bringSubviewToFront(textBOTTOM)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imagePickerView.contentMode = .scaleAspectFit
            imagePickerView.image = image
            textTOP.isEnabled = true
            textBOTTOM.isEnabled = true
            imageAlbumPicker.isEnabled = false
            imageCameraPicker.isEnabled = false
        }
        
        dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields(textField: textTOP, defaultString: "TOP")
        configureTextFields(textField: textBOTTOM, defaultString: "BOTTOM")

        shareButton.isEnabled = false
        imageCameraPicker.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)

    }
    
    func configureTextFields(textField: UITextField, defaultString: String) {
        //MARK: code to set-up the textField
        
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: NSNumber.init(floatLiteral: 1.0)
        ]
        
        textField.delegate = self.textFieldDelegate
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .center
        textField.isEnabled = false
        textField.text = defaultString
        
        view.bringSubviewToFront(textField)
    }
    
    func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if textBOTTOM.isFirstResponder {
            view.frame.origin.y =  -getKeyboardHeight(notification)
        }
    }

    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func saveMeme(){
        // Create the meme
        let meme = Meme(topText:textTOP.text!, bottomText:textBOTTOM.text!, originalImage:imagePickerView.image!, memedImage:generateMemedImage())
        
        // Add it to the memes array in the Application Delegate
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
    
    func generateMemedImage() -> UIImage {
        navBar.isHidden = true
        pickBar.isHidden = true
       
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        navBar.isHidden = false
        pickBar.isHidden = false
        return memedImage
    }


    
}

