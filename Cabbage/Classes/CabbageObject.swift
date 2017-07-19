
import UIKit

public protocol Reuse {

    func reuseIdentifier() -> String
}

extension Reuse {

    func reuseIdentifier() -> String? {
        return "\(type(of: self))"
    }
}
