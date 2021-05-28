//
//  ContentView.swift
//  BlurSwiftUI
//
//  Created by Raphael Cerqueira on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State var isPasswordVisible = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }, label: {
                            Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.black)
                        })
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                HStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Forgot password or login?")
                            .foregroundColor(.white)
                    })
                }
                
                Button(action: {}, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(8)
                })
                .padding(.top)
                
                Button(action: {}, label: {
                    Text("I don't have an account")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                        .cornerRadius(8)
                })
                
                Button(action: {}, label: {
                    Text("Contact us")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                })
            }
            .padding()
            .background(BlurView(style: .systemUltraThinMaterialDark)) // temp
            .cornerRadius(15)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct BlurView: UIViewRepresentable {
    var style = UIBlurEffect.Style.dark
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
