import Foundation

/// @mockable
public protocol DataSource {
    var text: String { get }
    var date: Date { get }

    func repeatText(_ count: Int) -> String
}

public class SampleDataSource: DataSource {
    public var text: String {
        "Sample"
    }

    public var date: Date {
        Date(timeIntervalSince1970: 0)
    }

    public init() {}

    public func repeatText(_ count: Int) -> String {
        Array(repeating: text, count: count).joined()
    }
}
