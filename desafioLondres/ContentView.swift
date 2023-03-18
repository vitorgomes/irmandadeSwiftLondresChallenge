//
//  ContentView.swift
//  desafioLondres
//
//  Created by Vitor Gomes on 12/03/23.
//

// TODO: Project tested on on iPhone 14 Pro. In the future should be designed and tested for the other devices either.

import SwiftUI

struct ContentView: View {
    
    @State var userName = ""
    @State var password = ""
    @State var alertType = ""
    
    // Since we were not using any APIs, i created these hard coded constants to use and test the alert feature.
    let hardcodedUserName = "Vitor"
    let hardcodedPassword = "123"
    
    @State var rememberMe = true
    @State var showWelcomeSheet = false
    @State var showAlert = false
    
    var body: some View {
        
        // MARK: First screen (Login)
        Text("IrmandadeSwift")
            .font(.largeTitle)
        
        Form {
            TextField(
                "UserNameTF",
                text: $userName,
                prompt: Text("Username")
            )
            
            SecureField(
                "PasswordSF",
                text: $password,
                prompt: Text("Password")
            )
            
            VStack {
                Toggle("Lembrar de mim", isOn: $rememberMe)
                    .padding(.bottom, 50)
                    .foregroundColor(Color.gray)
                
                Button("Entrar") {
                    if(userName == hardcodedUserName && password == hardcodedPassword) {
                        showWelcomeSheet.toggle()

                    } else {
                        alertType = "Username ou Password"
                        
                        showAlert.toggle()
                    }
                    
                } .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .padding(.bottom, 30)
                
                    .alert("\(alertType) incorreto", isPresented: $showAlert) {
                    }
            }
        }
        
        // MARK: Second screen
        .sheet(isPresented: $showWelcomeSheet) {
            
            HStack() {
                VStack(alignment: .leading, spacing: 5) {
                    Text("BEM")
                    Text("VINDO,")
                    Text(userName.uppercased())
                    
                    Divider()
                        .frame(width: 170, height: 7)
                        .overlay(.orange)
                } .font(.system(size: 50))
       
                Spacer()
                
                Text("👊🏻")
                    .font(.system(size: 100))
            } .padding(30)
            
            Button("Sair") {
                showWelcomeSheet.toggle()
                
                if(rememberMe == false) {
                    userName = ""
                    password = ""
                }
            } .underline() // I was not able to resolve this but the .underline function is not working on my project.
                .foregroundColor(Color.purple)
                .padding(.top, 80)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
