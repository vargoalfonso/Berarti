import SwiftUI
struct Article: View{
    @State var searchtext = ""
    var body: some View{
        NavigationView{
        VStack {
            
                  
                     HStack {
                         Image(systemName: "magnifyingglass")
                         TextField("Search ..", text: $searchtext)
                     }
            
                     .foregroundColor(.black)
                     .padding(.leading, 13)
                 
                     .frame(height: 40)
                     .cornerRadius(13)
                     .padding()
            Text("Tahukah Kamu?")
                .frame(width: 350, alignment: .leading)
                .font(.title2)
                
            ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(Artfill,id:\.id){ contact in
                    NavigationLink(destination: DetailViewArticle( contact: contact)){
                    Contactview(contact: contact)
                        
                        
                }
                }.foregroundColor(.black)
                
                 .navigationBarTitle("Artikel", displayMode: .inline)
                
            }.padding()
               
            
                
            };Text("Kisah Nyata")
                .frame(width: 350, alignment: .leading)
                .font(.title2)
            ScrollView(.vertical,showsIndicators: true){
                ForEach(Artfill,id:\.id){ contact in
                    NavigationLink(destination: DetailViewArticle( contact: contact)){
                    Contactview1(contact: contact)
                        
                        
                }
                }
            }.frame(width: 350, alignment: .leading)
                .foregroundColor(.black)
        }
        }
        
    }
    
}

struct Article_previews: PreviewProvider{
    static var previews: some View{
        Article()
            
    }
}
struct Contactview: View{
    let contact : ArticleFill
    var body: some View{
        VStack(alignment: .leading){
            Image(contact.Image)
                .resizable()
            .frame(width:200, height: 110)
            .cornerRadius(20)
            
            VStack{
                Text(contact.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 150, height: 25)
                    .cornerRadius(100)
                    .background(.blue)
                    .foregroundColor(.white)
                Text(contact.text)
                    
            }
        }
    }
}
struct Contactview1: View{
    let contact : ArticleFill
    var body: some View{
        HStack{
            Image(contact.Image)
                .resizable()
            .frame(width:200, height: 110)
            .cornerRadius(20)
            
            VStack{
                Text(contact.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 150, height: 25)
                    .cornerRadius(100)
                    .background(.blue)
                    .foregroundColor(.white)
                Text(contact.text)
                    
            }
        }
    }
}
