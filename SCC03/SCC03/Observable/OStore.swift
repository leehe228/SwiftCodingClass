//
//  OStore.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import Foundation
import Observation

// @Observable 매크로
@Observable
class OStore {
    // @Published 작성하지 않아도 동일하게 뷰를 업데이트할 수 있음
    var name: String = ""
    var item: OItem = OItem()
    // 내부에 있는 값이 바뀌면 자동으로 내부에 값이 바뀌었다는 것을 알려주게 됨
}

@Observable
class OItem {
    var name: String = "observation item"
    var price: Int = 0
    // 내부 값만 변경된 것이 아니라 OItem Dependency가 변경이 되었다고 알려줌
}
