//
//  RowView.swift
//  Final
//
//  Created by zumin you on 2023/11/05.
//

import SwiftUI

struct RowView: View {
    let user: User
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: user.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(user.firstName) \(user.lastName)")
                Text(user.bloodGroup)
                Text("키 : \(user.height)")
                Text("생일 : \(user.birthDate)")
            }
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(user: User(id: 0, firstName: "Terry", lastName: "Medhurst", maidenName: "Smitham", age: 50, email: "atuny0@sohu.com", phone: "+63 791 675 8914", username: "atuny0", password: "9uQFF1Lh", birthDate: "2000-12-25", image: "https://robohash.org/hicveldicta.png", bloodGroup: "A−", height: 189, weight: 75.4))
    }
}
