//
//  EditUserView.swift
//  Final
//
//  Created by zumin you on 2023/11/05.
//

import SwiftUI

struct EditUserView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var user: User
    
    var body: some View {
        HStack {
            TextField("이름 변경", text: $user.firstName)
            Button {
                dismiss()
            } label: {
                Text("확인")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView(user: .constant(User(id: 0, firstName: "Terry", lastName: "Medhurst", maidenName: "Smitham", age: 50, email: "atuny0@sohu.com", phone: "+63 791 675 8914", username: "atuny0", password: "9uQFF1Lh", birthDate: "2000-12-25", image: "https://robohash.org/hicveldicta.png", bloodGroup: "A−", height: 189, weight: 75.4)))
    }
}
