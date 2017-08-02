
import Foundation

public protocol CabbageTableViewCellModel: CabbageModel, CabbageReuse {

    var estimatedHeight: CGFloat? { get set }
}

public extension CabbageTableViewCellModel {

}

public class DefaultCabbageTableViewCellModel: CabbageTableViewCellModel {

    public var estimatedHeight: CGFloat? = CGFloat.closeToZero()

}
