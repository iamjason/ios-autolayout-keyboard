//
//  ViewController.swift
//  KeyboardInteraction
//
//  Created by Jason Garrett on 7/6/15.
//  Copyright (c) 2015 jg. All rights reserved.
//

import UIKit
import SZTextView

class ViewController: KeyboardAutolayoutViewController {
   
   let bottomBar = UIView()
   let titleTF = UITextField()
   let line = UIView()
   let body = SZTextView()

   override func viewDidLoad() {
      
      super.viewDidLoad()
      
      bottomBar.backgroundColor = UIColor.redColor()
      line.backgroundColor = UIColor.orangeColor()
      titleTF.backgroundColor = UIColor.purpleColor()
      body.backgroundColor = UIColor.greenColor()
      
      titleTF.setTranslatesAutoresizingMaskIntoConstraints(false)
      bottomBar.setTranslatesAutoresizingMaskIntoConstraints(false)
      line.setTranslatesAutoresizingMaskIntoConstraints(false)
      body.setTranslatesAutoresizingMaskIntoConstraints(false)
      
      titleTF.placeholder = "Post title"
      body.placeholder = "What's on your mind?"
      
      view.addSubview(titleTF)
      view.addSubview(body)
      view.addSubview(bottomBar)
      view.addSubview(line)
      
      baseConstraint = bottomBar.al_bottom == view.al_bottom
      view.addConstraints([
         
         titleTF.al_width == view.al_width - 40,
         titleTF.al_height == 40,
         titleTF.al_left == view.al_left + 20,
         titleTF.al_top == view.al_top + 50,
         
         line.al_left == view.al_left  + 20,
         line.al_width == view.al_width - 40,
         line.al_top == titleTF.al_bottom,
         line.al_height == 1,
         
         body.al_left == view.al_left  + 20,
         body.al_width == view.al_width - 40,
         body.al_top == titleTF.al_bottom + 5,
         body.al_bottom == bottomBar.al_top - 5,
         
         bottomBar.al_height == 50,
         bottomBar.al_left == view.al_left,
         bottomBar.al_width == view.al_width,
         baseConstraint,
         
         ])
      
      enableKeyboardConstraints()
      
   }
   

   
}

