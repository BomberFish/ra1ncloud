
//
//  ContentView.swift
//  Fugu15
//
//  Created by Linus Henze.
//

import SwiftUI

#if os(iOS)
import UIKit
#else
import AppKit
#endif

import Fugu15KernelExploit

struct ContentView: View {
    @State var logText = ""
    @State private var showingRemoveFrame = RemoveFuguInstall.shouldShow()
    
    var body: some View {
            VStack {
                    JailbreakView(logText: $logText)
                }
            }
        }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
