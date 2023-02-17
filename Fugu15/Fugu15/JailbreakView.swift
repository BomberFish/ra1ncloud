//  JailbreakView.swift
//  Fugu15
//
//  Created by Linus Henze on 2022-07-29.
//

import SwiftUI
import Fugu15KernelExploit

enum JBStatus {
    case notStarted
    case unsupported
    case inProgress
    case failed
    case done
    
    func text() -> String {
        switch self {
        case .notStarted:
            return "Jailbreak"
            
        case .unsupported:
            return "Unsupported"
            
        case .inProgress:
            return "Jailbreaking..."
            
        case .failed:
            return "Error!"
            
        case .done:
            return "Jailbroken"
        }
    }
    
    func color() -> Color {
        switch self {
        case .notStarted:
            return .accentColor
            
        case .unsupported:
            return .accentColor
            
        case .inProgress:
            return .accentColor
            
        case .failed:
            return .red
            
        case .done:
            return .green
        }
    }
}

struct JailbreakView: View {
    @Binding var logText: String
    @State var status: JBStatus = .notStarted
    @State var textStatus1      = ""
    @State var textStatus2      = ""
    @State var textStatus3      = ""
    @State var showSuccessMsg   = false
    @State private var showSheet = false
    @State private var showSheet2 = false
    @State private var showSheet3 = false
    
    var body: some View {
        ZStack {
            Color("bodycolor")
                .edgesIgnoringSafeArea(.all)
            //jb button
            VStack (spacing: -20 ) {
                
                Button(status.text(), action: {
                    status = .inProgress
                    
                    DispatchQueue(label: "Fugu15").async {
                        launchExploit()
                    }
                })
                .padding()
                .frame(width: 300, height: 55)
                .background(status.color())
                .cornerRadius(10)
                .foregroundColor(Color.black)
                .disabled(status != .notStarted)
                .offset(y: 685)
                
                
                
                VStack {
                    
                    Image("bg")
                        .frame(height: 50)
                        .scaledToFill()
                        .offset (y: -105)
                        .aspectRatio(contentMode: .fit)
                    Image("rc")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .offset(y: -85)
                    
                    Text("Developed by @iArchiveml")
                        .offset(y: 73)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                    
                    Text("ra1ncloud")
                        .offset(y: -80)
                        .font(.system(size: 32, design: .rounded))
                        .foregroundColor(Color.white)
                    
                    Text("Supported Versions: iOS 15.0 - 15.4.1")
                        .font(.system(size: 12))
                        .offset(y: -35)
                        .foregroundColor(.white)
                    
                    VStack {
                        
                        // left
                        
                        Rectangle()
                            .frame(width: 142, height: 50)
                            .cornerRadius(15)
                            .offset(x: -79, y: 58)
                            .foregroundColor(Color("AccentColor"))
                            .overlay(
                                
                                Text("Credits")
                                    .offset(x: -79, y: 58)
                                    .foregroundColor(.black)
                            )
                            .onTapGesture {
                                self.showSheet = true
                            }
                            .sheet(isPresented: $showSheet) {
                                
                                VStack (spacing: 5){
                                    
                                    //Top
                                    
                                    Text("Credits")
                                        .aspectRatio(contentMode: .fit)
                                        .offset(x: -115, y: -5)
                                        .font(.system(size: 32, design: .rounded))
                                    
                                    Text("Special thanks to these people:")
                                        .offset(x: -46, y: 10)
                                    
                                    VStack {
                                        
                                        Image("linushenze")
                                            .resizable()
                                            .frame(width: 76, height: 76)
                                            .clipShape(Circle())
                                            .offset(x: -125, y:30)
                                            .overlay(
                                                Circle().stroke(Color.white, lineWidth: 2)
                                                    .offset(x: -125, y:30)
                                            )
                                            .shadow(radius: 15)
                                        
                                        
                                        Text("@linushenze")
                                            .font(.system(size: 16))
                                            .offset(x: -21, y:-33)
                                        
                                        Text("Created Fugu15")
                                            .offset(x: -15, y:-23)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        
                                        //opa334
                                        
                                        Image("opa334")
                                            .resizable()
                                            .frame(width: 76, height: 76)
                                            .clipShape(Circle())
                                            .offset(x: -125, y:0)
                                            .overlay(
                                                Circle().stroke(Color.white, lineWidth: 2)
                                                    .offset(x: -125, y:0)
                                            )
                                            .shadow(radius: 15)
                                        
                                        Text("@opa334")
                                            .font(.system(size: 16))
                                            .offset(x: -33, y:-65)
                                        
                                        Text("iDownload Trust Level Commands")
                                            .offset(x: 42, y:-55)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        
                                        //rebeldisc
                                        
                                        Image("rebeldisc")
                                            .resizable()
                                            .frame(width: 76, height: 76)
                                            .clipShape(Circle())
                                            .offset(x: -125, y:-30)
                                            .overlay(
                                                Circle().stroke(Color.white, lineWidth: 2)
                                                    .offset(x: -125, y:-30)
                                            )
                                            .shadow(radius: 15)
                                        
                                        Text("@rebeldisc")
                                            .font(.system(size: 16))
                                            .offset(x: -28, y:-90)
                                        
                                        Text("Designed UI")
                                            .offset(x: -28, y:-80)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        
                                        //uar
                                        
                                        Image("uar")
                                            .resizable()
                                            .frame(width: 76, height: 76)
                                            .clipShape(Circle())
                                            .offset(x: -125, y:-60)
                                            .overlay(
                                                Circle().stroke(Color.white, lineWidth: 2)
                                                    .offset(x: -125, y:-60)
                                            )
                                            .shadow(radius: 15)
                                        
                                    }
                                    Text("@usmanabdurazzaq")
                                        .font(.system(size: 16))
                                        .offset(x: 5, y:-115)
                                    
                                    Text("iDownload Commands")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                        .offset(x: 4, y:-110)
                                    
                                    Button("Close") {
                                        showSheet = false
                                    }
                                    .padding()
                                    .frame(width: 300, height: 55)
                                    .foregroundColor(.black)
                                    .background(Color("AccentColor"))
                                    .cornerRadius(10)
                                    .foregroundColor(Color.black)
                                    
                                    
                                }
                            }
                        
                        
                        VStack (spacing: 70) {
                            
                            
                            Rectangle()
                            
                            //Right
                            
                                .frame(width: 142, height: 50)
                                .cornerRadius(15)
                                .foregroundColor(Color("panelcolor"))
                                .offset(x: 79, y: 0)
                                .overlay(
                                    
                                    Text("Version 0.1")
                                        .offset(x: 79)
                                        .foregroundColor(Color("txtcolor"))
                                )
                            
                            VStack {
                                Rectangle()
                                
                                //log
                                
                                    .cornerRadius(18)
                                    .offset(y:-70)
                                    .frame(width: 300, height: 265)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("panelcolor"))
                                    .overlay(
                                        
                                        VStack (spacing: -170){
                                            
                                            if !logText.isEmpty {
                                                Text("")
                                                    .font(.headline)
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundColor(Color("txtcolor"))
                                                
                                                ScrollView {
                                                    
                                                    Text(logText)
                                                }
                                                .frame(width: 300, height: 225)
                                                .font(.body)
                                                .foregroundColor(Color("txtcolor"))
                                                .fixedSize(horizontal: false, vertical: true)
                                                .aspectRatio(contentMode: .fit)
                                                .onTapGesture {
                                                    self.showSheet2 = true
                                                }
                                                .sheet(isPresented: $showSheet2) {
                                                    
                                                    
                                                    VStack {
                                                        Text("Logs:")
                                                            .offset(y:-335)
                                                        
                                                        ScrollView {
                                                            Text(logText)
                                                        }
                                                        
                                                        Button(action: {
                                                            self.showSheet2 = false
                                                        }) {
                                                            
                                                            Text("Close")
                                                                .foregroundColor(.black)
                                                                .frame(width: 300, height: 55)
                                                                .background(Color("AccentColor"))
                                                                .cornerRadius(10)
                                                        }
                                                    }
                                                }
                                                
                                                
                                            } else {
                                                
                                                Text("")
                                                    .font(.body)
                                                    .padding()
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundColor(Color.black)
                                            }
                                        }
                                    )
                            }
                            
                            .padding()
                        }
                    }
                    VStack {
                    }
                }
            }
        }
    }
        
        func print(_ text: String, ender: String = "\n") {
            NSLog(text)
            logText += text + ender
        }
        
        func statusUpdate(_ s: String) {
            textStatus3 = textStatus2
            textStatus2 = textStatus1
            textStatus1 = s
        }
        
        func launchExploit() {
            do {
                statusUpdate("Status: Launching kexploitd")
                
                try Fugu15.launchKernelExploit(oobPCI: Bundle.main.bundleURL.appendingPathComponent("oobPCI")) { msg in
                    if status != .done {
                        DispatchQueue.main.async {
                            if msg.hasPrefix("Status: ") {
                                statusUpdate(msg)
                            }
                            
                            print(msg)
                        }
                    }
                }
                
                try Fugu15.launch_iDownload()
                
                DispatchQueue.main.async {
                    statusUpdate("Status: Done!")
                    status = .done
                    showSuccessMsg = true
                }
            } catch {
                DispatchQueue.main.async {
                    print("Fugu15 error: \(error)")
                    status = .failed
                }
            }
        }
    }

    struct JailbreakView_Previews: PreviewProvider {
        @State static var logText = ""
        
        static var previews: some View {
            JailbreakView(logText: $logText)
        }
    }

