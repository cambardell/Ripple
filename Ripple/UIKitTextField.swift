//
//  UIKitTextField.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-04-08.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, placeholder: placeholder)
    }
    
    func makeUIView(context: Context) -> UITextView {
        
        let myTextView = UITextView()
        myTextView.delegate = context.coordinator
        
        myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
        myTextView.text = placeholder
        
        
        return myTextView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != "" {
            uiView.text = text
        } else {
            uiView.text = placeholder
            uiView.textColor = UIColor.lightGray
        }
        
    }
    
    
    
    class Coordinator : NSObject, UITextViewDelegate {
        
        var parent: TextView
        var placeholder: String
        
        init(_ uiTextView: TextView, placeholder: String) {
            self.parent = uiTextView
            self.placeholder = placeholder
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.lightGray {
                textView.text = ""
                textView.textColor = UIColor.black
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.textColor = UIColor.lightGray
            }
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}


