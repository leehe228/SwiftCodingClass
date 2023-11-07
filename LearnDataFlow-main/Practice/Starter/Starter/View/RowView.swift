//
//  RowView.swift
//  Starter
//
//  Created by zumin you on 2023/11/06.
//

import SwiftUI

struct RowView: View {
    @Binding var user: User
    
    var body: some View {
       
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: user.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 140)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                
            
            VStack(alignment: .leading) {
                Text("Name: \(user.firstName) \(user.lastName) (\(user.age))")
                Text("Email : \(user.email)")
                Text("username: \(user.username)")
                Text("Birthday: \(user.birthDate.replacingOccurrences(of: "-", with: "/"))")
                Text("Blood Type: \(user.bloodGroup)")
                Text("Height: \(user.height)cm, Weight: \(String(format: "%.1f", user.weight))kg")
            }
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView(user: User(id: 0, firstName: "Terry", lastName: "Medhurst", maidenName: "Smitham", age: 50, email: "atuny0@sohu.com", phone: "+63 791 675 8914", username: "atuny0", password: "9uQFF1Lh", birthDate: "2000-12-25", image: "https://robohash.org/hicveldicta.png", bloodGroup: "A−", height: 189, weight: 75.4))
//    }
//}

