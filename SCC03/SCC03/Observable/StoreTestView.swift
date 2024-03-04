//
//  StoreTestView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct StoreTestView: View {
    
    @ObservedObject var store: Store = Store()
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            Text("ObservableObject")
            Text(store.item.name)
            TextField("item name", text: $store.item.name)
                .border(Color.black)
                .padding()
            
            // 아래 방식으로는 변경이 되어도 해당 뷰에서 인식하지 못함
            Button("name change") {
                
                // StoreTestView: _store changed.
                
                // store item name이 바뀌어도 store가 전체 바뀐다고 인식하므로
                // 불필요한 렌더링이 발생할 수 있음
                store.item.name = "name changed!"
            }
        }
    }
}

#Preview {
    StoreTestView()
}
