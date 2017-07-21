
import Foundation

public protocol CabbageTableViewCellModel: CabbageModel, CabbageReuse {

    var estimatedHeight: CGFloat? { get set }
}

public extension CabbageTableViewCellModel {

}
