
import Foundation

public protocol CabbageReuse {

    func reuseIdentifier() -> String
}

public extension CabbageReuse {

    func reuseIdentifier() -> String {
        return "\(type(of: self))"
    }
}
