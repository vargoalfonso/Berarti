//
//  SetTextView.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 25/10/22.
//

import SwiftUI

struct ChangeNotificationMessageView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = ChangeNotificationMessageViewModel()
    
    var body: some View {
        VStack {
            FormTextField(placeholder: "Lagi apa kamu? waktunya minum nih", text: .constant(viewModel.notificationText))
            
            Spacer()
        }.padding(.horizontal, 16)
            .padding(.top, 32)
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Ubah Kata-kata Notifikasi")
                        .bold()
                        .foregroundColor(.NAVIGATION_TITLE)
                        .fixedSize(horizontal: true, vertical: false)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.NAVIGATION_TITLE)
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.saveMessage {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }, label: {
                        Text("Simpan")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.NAVIGATION_TITLE)
                    })
                }
            }
    }
}
struct ChangeNotificationMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChangeNotificationMessageView()
        }
    }
}
