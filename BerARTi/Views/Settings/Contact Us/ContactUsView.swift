//
//  ContactUsView.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 25/10/22.
//

import SwiftUI

struct ContactUsView: View {
    @State var Nama: String = ""
    @State var EmailKamu: String = ""
    @State var Tujuanmenghubungi: String = ""
    @State var Deskripsi: String = ""
    
    private var grayBackground: Color = Color.gray.opacity(0.2)
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            TextField("Nama", text: $Nama)
                .padding()
                .background(grayBackground)
                .cornerRadius(5.0)
                .padding(.vertical, 20)
            TextField("Email Kamu", text: $EmailKamu)
                .padding()
                .background(grayBackground)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Tujuan Menghubungi", text: $Tujuanmenghubungi)
                .padding()
                .background(grayBackground)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Deskripsi", text: $Deskripsi)
                .padding()
                .padding(.bottom, 100)
                .background(grayBackground)
                .cornerRadius(5.0)
            
            
            Button("Kirim") {
                
            }.frame(width: 220, height: 60)
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top)
            
            Spacer()
            
        }.padding(.horizontal, 16)
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Hubungi Kami")
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
            }
        
    }
}

struct CSView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactUsView()
        }
    }
}
