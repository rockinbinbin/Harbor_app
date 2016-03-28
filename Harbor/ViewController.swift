//
//  ViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/27/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

let blueColor = UIColor(red:0.0, green:0.73, blue:0.74, alpha:1.0)
let seaGreenColor = UIColor(red:0.0, green:0.9, blue:0.53, alpha:1.0)

class ViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var newView: UIView = {
        let newview = UIView()
        let gradientLayer = CAGradientLayer()
        
        let color1 = blueColor.CGColor as CGColorRef
        let color2 = seaGreenColor.CGColor as CGColorRef
        gradientLayer.colors = [color2, color1]
        gradientLayer.locations = [0.0, 0.5, 0.65, 0.75, 1.0]
        gradientLayer.type = kCAGradientLayerAxial
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1.0, 1)
        gradientLayer.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.view.layer.addSublayer(gradientLayer)
        
        self.view.addSubview(newview)
        return newview
    }()
    
    private lazy var logoimageView: UIImageView = {
        let logoimageView = UIImageView(image: UIImage(named: "white-seahorse"))
        self.view.addSubview(logoimageView)
        return logoimageView
    }()
    
    var keyboardUp = false
    
    internal lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false;
        emailTextField.delegate = self
        emailTextField.textColor = blueColor
        
        let attributes = [
            NSForegroundColorAttributeName: blueColor
        ]
        
        let attrString = NSMutableAttributedString(string: "USERNAME", attributes:attributes)
        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 14)!, range: NSMakeRange(0, attrString.length))
        emailTextField.attributedPlaceholder = attrString
        emailTextField.layer.cornerRadius = 0
        emailTextField.backgroundColor = UIColor.whiteColor()
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = blueColor.CGColor
        emailTextField.textAlignment = .Center
        emailTextField.returnKeyType = .Next
        emailTextField.autocorrectionType = .No
        self.view.addSubview(emailTextField)
        return emailTextField
    }()
    
    internal lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
        passwordTextField.delegate = self
        passwordTextField.textColor = blueColor
        passwordTextField.secureTextEntry = true
        
        let attributes = [
            NSForegroundColorAttributeName: blueColor
        ]
        
        let attrString = NSMutableAttributedString(string: "PASSWORD", attributes:attributes)
        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 14)!, range: NSMakeRange(0, attrString.length))
        passwordTextField.attributedPlaceholder = attrString
        passwordTextField.layer.cornerRadius = 0
        passwordTextField.backgroundColor = UIColor.whiteColor()
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = blueColor.CGColor
        passwordTextField.textAlignment = .Center;
        passwordTextField.returnKeyType = .Done
        passwordTextField.autocorrectionType = .No
        
        self.view.addSubview(passwordTextField)
        return passwordTextField
    }()
    
    private lazy var signUpLabel: UILabel = {
        let signUpLabel = UILabel()
        signUpLabel.textColor = UIColor(red: 0.047, green: 0.569, blue: 0.773, alpha: 1.0)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        let attrString = NSMutableAttributedString(string: "SIGN UP")
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
        signUpLabel.attributedText = attrString
        signUpLabel.textAlignment = .Center
        
        self.view.addSubview(signUpLabel)
        return signUpLabel
    }()
    
    private lazy var alreadyHaveAccountLabel: UILabel = {
        let alreadyHaveAccountLabel = UILabel()
        alreadyHaveAccountLabel.textColor = UIColor.whiteColor()
        let attrString = NSMutableAttributedString(string: "Already have an account?")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 14)!, range: NSMakeRange(0, attrString.length))
        alreadyHaveAccountLabel.attributedText = attrString
        alreadyHaveAccountLabel.textAlignment = .Center
        return alreadyHaveAccountLabel
    }()
    
    internal lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .RoundedRect)
        loginButton.layer.cornerRadius = 0
        loginButton.backgroundColor = UIColor.clearColor()
        loginButton.layer.borderWidth = 0
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        loginButton.tintColor = UIColor.whiteColor()
        
        let attrString = NSMutableAttributedString(string: "LOG IN")
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 14)!, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
//        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "Lato-Regular", size: 12)!, range: NSMakeRange(0, attrString.length))
        
        loginButton.setAttributedTitle(attrString, forState: .Normal)
        
        //self.view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: Selector("loginPressed"), forControlEvents: .TouchUpInside)
        
        return loginButton
    }()
    
    internal lazy var letsGo: UIButton = {
        let letsGo = UIButton(type: .RoundedRect)
        letsGo.layer.cornerRadius = 0
        letsGo.backgroundColor = UIColor.whiteColor()
        letsGo.layer.borderWidth = 0
        letsGo.layer.borderColor = UIColor.whiteColor().CGColor
        letsGo.tintColor = blueColor
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        let attrString = NSMutableAttributedString(string: "SIGN UP")
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSKernAttributeName, value: 1.5, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!, range: NSMakeRange(0, attrString.length))
        letsGo.setAttributedTitle(attrString, forState: .Normal)
        
//        letsGo.titleLabel?.font = UIFont(name: "Lato–Regular", size: 20)
        
        self.view.addSubview(letsGo)
        
        letsGo.addTarget(self, action: Selector("letsGoPressed"), forControlEvents: .TouchUpInside)
        
        return letsGo
    }()
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        newView.pinToEdgesOfSuperview()
        
        self.navigationController?.navigationBarHidden = true
        
        logoimageView.pinToTopEdgeOfSuperview(offset: self.view.frame.size.height * 0.1)
        logoimageView.centerHorizontallyInSuperview()
        
        emailTextField.positionBelowItem(logoimageView, offset: 20)
        emailTextField.centerHorizontallyInSuperview()
        emailTextField.sizeToWidth(self.view.frame.size.width - 80)
        emailTextField.sizeToHeight(self.view.frame.size.height * 0.08)
        
        passwordTextField.positionBelowItem(emailTextField, offset: 20)
        passwordTextField.centerHorizontallyInSuperview()
        passwordTextField.sizeToWidth(self.view.frame.size.width - 80)
        passwordTextField.sizeToHeight(self.view.frame.size.height * 0.08)
        
        self.view.addSubview(alreadyHaveAccountLabel)
        self.view.addSubview(loginButton)
        alreadyHaveAccountLabel.positionBelowItem(passwordTextField, offset: 17)
        alreadyHaveAccountLabel.centerHorizontallyToItem(passwordTextField, offset: (-self.view.frame.size.width * 0.065))
        
        loginButton.positionToTheRightOfItem(alreadyHaveAccountLabel, offset: 5)
        loginButton.positionBelowItem(passwordTextField, offset: 10)
        
        letsGo.positionBelowItem(alreadyHaveAccountLabel, offset: 20)
        letsGo.centerHorizontallyInSuperview()
        letsGo.sizeToWidth(self.view.frame.size.width - 80)
        letsGo.sizeToHeight(self.view.frame.size.height * 0.08)
        
        let button = UIButton()
        button.setTitle("By signing up, you agree to our Terms of Service.", forState: .Normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.titleLabel?.numberOfLines = 0
        
        button.addTarget(self, action: Selector("termsPressed:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        button.pinToBottomEdgeOfSuperview(offset: 20)
        button.centerHorizontallyInSuperview()
        
        
        // Dismisses the keyboard if the user taps outside of the keyboard region.
        let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    // Dismisses the keyboard.
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func termsPressed(sender: UIButton!) {
        
        let rtfVC = TermsViewController(title: "Terms of Service", fileName: "Terms")
        let termsViewController = UINavigationController(rootViewController: rtfVC)
        termsViewController.navigationBar.tintColor = UIColor(red: 0.047, green: 0.569, blue: 0.773, alpha: 1.0)
        termsViewController.navigationBar.backgroundColor = UIColor(red: 0.047, green: 0.569, blue: 0.773, alpha: 1.0)
        
        
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "dismissSettings")
        doneButton.tintColor = UIColor.whiteColor()
        let attributes = [NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 19)!]
        doneButton.setTitleTextAttributes(attributes, forState: UIControlState.Normal)
        rtfVC.navigationItem.rightBarButtonItem = doneButton
        
        self.presentViewController(termsViewController, animated: true, completion: nil)
    }
    
    func dismissSettings() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if keyboardUp {
            return
        }
        if let info = notification.userInfo {
            let movementHeight = -(info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().size.height
            UIView.beginAnimations("keyboardGoinUP", context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: info[UIKeyboardAnimationCurveUserInfoKey]!.integerValue)!)
            self.view.frame = CGRectOffset(self.view.frame, 0, movementHeight + self.view.frame.size.height * 0.22)
            keyboardUp = true
        } else {
            print("Error: No user info for keyboardWillShow")
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if !keyboardUp {
            return
        }
        
        if let info = notification.userInfo {
            UIView.beginAnimations("keyboardGoinDOWN", context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: info[UIKeyboardAnimationCurveUserInfoKey]!.integerValue)!)
            self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
            UIView.commitAnimations()
            
            keyboardUp = false
        } else {
            print("Error: No user info for keyboardWillShow")
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == emailTextField) {
            passwordTextField.becomeFirstResponder()
        }
        else if (textField == passwordTextField) {
            passwordTextField.endEditing(true)
        }
        return true
    }
    
    
    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func letsGoPressed() {
        let password = self.passwordTextField.text
        let email = emailTextField.text
        let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if (email?.characters.count) < 5 {
            let alert = UIAlertView(title: "Oops!", message: "Please enter a valid email address", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            return
        }
        if (password?.characters.count) < 5 {
            let alert = UIAlertView(title: "Oops!", message: "Password must be greater than 5 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            return
        }
        else {
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            let newUser = PFUser()
            
            newUser.username = finalEmail
            newUser.password = password
            newUser.email = finalEmail
            
            let cal = NSCalendar.currentCalendar()
            let date = cal.dateByAddingUnit(.Month, value: 1, toDate: NSDate(), options: [])
            newUser.setValue(date, forKey: "nextPluck")
            
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                spinner.stopAnimating()
                if ((error) != nil) {
                    let alert = UIAlertView(title: "Sorry about that!", message: "We're having trouble signing you up. Try again or use Facebook to login!", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                else {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                        self.navigationController?.pushViewController(AccountViewController(), animated: true)
                    })
                }
            })
        }
    }
    
    // MARK: - Login Handlers
    
    func handleLoginFailed(error: NSError, sender: CustomLoginButton!) {
        print("Login failed with error \(error)")
        
        UIView.animateWithDuration(0.25, animations: {
            sender.indicator.alpha = 0.0
        })
        
        UIView.animateWithDuration(0.25, delay: 0.25, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            sender.titleLabel?.alpha = 1.0
            }, completion: nil)
        
        
        let alertController = UIAlertController(
            title: "Uh oh! Login failed.",
            message: "In Facebook > Settings > Apps, make sure that “Apps, Websites, and Plugins” is enabled.",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        let continueAction = UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(continueAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func handleReturningUser(user: PFUser?, setupComplete: Bool) {
        // User has entered the app and completed setup
        
//        if (user?.valueForKey("City") != nil) {
//            self.navigationController?.pushViewController(AccountViewController(), animated: true)
//        }
//        else {
//            self.navigationController?.pushViewController(AccountViewController(), animated: true)
//        }
    }
    
    func loginPressed() {
//        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    internal func closePressed() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}

