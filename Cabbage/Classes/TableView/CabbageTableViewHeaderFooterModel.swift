
import Foundation

public protocol CabbageTableViewHeaderFooterModel: CabbageModel, CabbageReuse {

    var title: String? { get set }
    var estimatedHeight: CGFloat? { get set }
}

public extension CabbageTableViewHeaderFooterModel {

}
