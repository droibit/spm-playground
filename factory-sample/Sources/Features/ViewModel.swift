import CoreRepository
import Factory
import Foundation

class ViewModel {
    private let repeatCount: Int
    private let repository: Repository
    
    init(
        repeatCount: Int,
        repository: Repository
    ) {
        self.repeatCount = repeatCount
        self.repository = repository
    }
    
    func getText() async -> String {
        await repository.repeatText(repeatCount)
    }
}

extension Container {
    var viewModel: ParameterFactory<Int, ViewModel> {
        self {
            .init(repeatCount: $0, repository: self.repository())
        }.cached
    }
}
