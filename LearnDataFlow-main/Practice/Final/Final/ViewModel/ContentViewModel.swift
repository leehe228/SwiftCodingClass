//
//  ContentViewModel.swift
//  Final
//
//  Created by zumin you on 2023/11/05.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var user: [User] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getUser()
    }
    
    func getUser() {
        guard let url = URL(string: "https://dummyjson.com/users?limit=10") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(validate)
            .decode(type: Info.self, decoder: JSONDecoder())
            .sink { _ in
            } receiveValue: { [weak self] returnedPost in
                self?.user = returnedPost.users
            }
            .store(in: &cancellables)
    }
    
    private func validate(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        return data
    }

    
}
