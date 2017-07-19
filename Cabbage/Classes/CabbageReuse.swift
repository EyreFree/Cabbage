
import Foundation

public protocol CabbageReuse {

    func reuseIdentifier() -> String
}

extension CabbageReuse {

    func reuseIdentifier() -> String? {
        return "\(type(of: self))"
    }
}
