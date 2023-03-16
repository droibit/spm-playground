import Factory
import Foundation
import CoreSource

public protocol Repository {
    var text: String { get }
    var date: Date { get }
    
    func repeatText(_ count: Int) async -> String
}

class SampleRepository: Repository {
    private let dataSource: DataSource
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    var text: String {
        dataSource.text
    }
    
    var date: Date {
        dataSource.date
    }
    
    func repeatText(_ count: Int) async -> String {
        dataSource.repeatText(count)
    }
}

public extension Container {
    var repository: Factory<Repository> {
        self {
            SampleRepository(dataSource: self.dataSource())        
        }.shared
    }
}
