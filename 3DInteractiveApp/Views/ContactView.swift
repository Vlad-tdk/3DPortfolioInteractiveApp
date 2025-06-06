//
//  ContactView.swift
//  3DInteractiveApp
//
//  Created by Vladimir Martemianov on 6. 6. 2025..
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject var portfolioService: PortfolioService
    @State private var showingAlert = false
    @State private var selectedContact: ContactType?
    
    enum ContactType {
        case email, phone, linkedin, github
    }
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            if portfolioService.isLoading {
                LoadingView()
            } else if let profile = portfolioService.profile {
                ScrollView {
                    VStack(spacing: 30) {
                        Text("Get In Touch")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                        
                        VStack(spacing: 20) {
                            ContactButton(
                                icon: "envelope.fill",
                                title: "Email",
                                subtitle: profile.email,
                                color: .blue
                            ) {
                                selectedContact = .email
                                openURL("mailto:\(profile.email)")
                            }
                            
                            ContactButton(
                                icon: "phone.fill",
                                title: "Phone",
                                subtitle: profile.phone,
                                color: .green
                            ) {
                                selectedContact = .phone
                                showingAlert = true
                            }
                            
                            ContactButton(
                                icon: "link",
                                title: "LinkedIn",
                                subtitle: profile.linkedin,
                                color: .blue
                            ) {
                                openURL("https://\(profile.linkedin)")
                            }
                            
                            ContactButton(
                                icon: "globe",
                                title: "GitHub",
                                subtitle: profile.github,
                                color: .purple
                            ) {
                                openURL("https://\(profile.github)")
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer(minLength: 100)
                    }
                }
            }
        }
        .alert("Contact Info", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text("This is a demo app. Contact information is not real.")
        }
    }
    
    private func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}

