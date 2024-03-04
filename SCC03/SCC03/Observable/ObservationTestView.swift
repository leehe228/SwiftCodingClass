//
//  ObservationTestView.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import SwiftUI

struct ObservationTestView: View {
    
    @State private var ostore = OStore()
    @Environment(OStore.self) var store
    // 하위 뷰에서 사용이 가능하게 됨
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            Text("observation")
            
            Text(ostore.item.name)
            
            // ObservationTestView: @dependencies changed.
            // ostore.item.name이 변경되었기에 
            TextField("item name", text: $ostore.item.name)
                .border(Color.black)
                .padding()
            
            // 값이 바뀜!!
            // 내부적으로 다르게 작동함
            Button("name change") {
                // 뷰에게 ostore item name에 바뀌었다고 알려주므로
                // name을 사용하는 뷰는 상관 없이 item name쪽만 재 렌더링 됨
                // -> 불필요한 렌더링을 줄일 수 있음
                ostore.item.name = "name changed!"
            }
        }
        .environment(ostore)
        // 하위 뷰에서 environment를 사용 가능
    }
}

#Preview {
    ObservationTestView()
        .environment(OStore())
}
