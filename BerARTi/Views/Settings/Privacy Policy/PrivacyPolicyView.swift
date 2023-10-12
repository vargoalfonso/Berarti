//
//  PrivacyPolicyView.swift
//  BerARTi
//
//  Created by cleanmac-ada on 02/12/22.
//

import SwiftUI

struct PrivacyPolicyView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                EmptySpacer(height: 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Overview")
                        .font(.system(size: 15, weight: .bold))
                    Text("Aplikasi BerARTi tidak mengumpulkan data pribadi apa pun. Semua informasi yang Anda masukkan ke dalam aplikasi BerARTi tetap tersimpan secara pribadi di perangkat Anda.")
                        .font(.system(size: 15))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Persetujuan Anda")
                        .font(.system(size: 15, weight: .bold))
                    Text("Aplikasi BerARTi tidak mengumpulkan data pribadi apa pun. Semua informasi yang Anda masukkan ke dalam aplikasi BerARTi tetap tersimpan secara pribadi di perangkat Anda.")
                        .font(.system(size: 15))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Perubahan pada Kebijakan Privasi ini")
                        .font(.system(size: 15, weight: .bold))
                    Text("Kami dapat memperbarui Kebijakan Privasi kami dari waktu ke waktu. Dengan demikian, Anda disarankan untuk meninjau halaman ini secara berkala untuk setiap perubahan. Perubahan ini berlaku segera setelah diposting di halaman ini.")
                        .font(.system(size: 15))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hubungi kami")
                        .font(.system(size: 15, weight: .bold))
                    Text("Jika Anda memiliki pertanyaan atau saran, Anda dapat menghubungi kami di @berarti.untukmu di Instagram dan berarti.app@gmail.com")
                        .font(.system(size: 15))
                }
                
                Text("Jika Anda menghubungi kami melalui email ini, kami akan melihat nama dan alamat email Anda. Informasi Anda hanya untuk membantu kami dalam memberikan dukungan pelanggan kepada Anda dan tidak akan ditambahkan ke milis atau dijual ke perusahaan pihak ketiga. Jika mau, Anda dapat mengirim email kepada kami untuk menghapus nama dan alamat email Anda dari kotak masuk kami.")
                    .font(.system(size: 15))
            }.padding(.horizontal, 21)
        }.navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Kebijakan Privasi")
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

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PrivacyPolicyView()
        }
    }
}
