//
//  KeyboardAutolayoutViewController.swift
//  KeyboardInteraction
//
//  Created by Jason Garrett on 7/6/15.
//  Copyright (c) 2015 jg. All rights reserved.
//

import UIKit


class KeyboardAutolayoutViewController : UIViewController {
   
   var baseConstraint:NSLayoutConstraint!
   
   func enableKeyboardConstraints(){
      
      NSNotificationCenter.defaultCenter().addObserver(self,
         selector: "keyboardWillShow:",
         name: UIKeyboardWillShowNotification,
         object: nil)
      
      NSNotificationCenter.defaultCenter().addObserver(self,
         selector: "keyboardWillHide:",
         name: UIKeyboardWillHideNotification,
         object: nil)
      
   }
   
   func disableKeyboardConstraints(){
      NSNotificationCenter.defaultCenter().removeObserver(self)
   }
   
   func animateWithKeyboard(notification: NSNotification) {
      
      let userInfo = notification.userInfo!
      
      let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
      let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
      let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! UInt
      
      if notification.name == UIKeyboardWillShowNotification {
         baseConstraint.constant = -keyboardSize.height  // move up
      } else {
         baseConstraint.constant = 0 // move down
      }
      
      view.setNeedsUpdateConstraints()
      weak var weakSelf = self
      let options = UIViewAnimationOptions(curve << 16)
      UIView.animateWithDuration(duration, delay: 0, options: options,
         animations: {
            weakSelf?.view.layoutIfNeeded()
         }, completion: nil)
      
   }
   
   func keyboardWillShow(notification: NSNotification) {
      animateWithKeyboard(notification)
   }
   
   func keyboardWillHide(notification: NSNotification) {
      animateWithKeyboard(notification)
   }
   
   
}

