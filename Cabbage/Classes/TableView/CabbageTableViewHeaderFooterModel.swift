
import Foundation

public protocol CabbageTableViewHeaderFooterModel: CabbageModel, CabbageReuse {

    var title: String? { get set }
    var estimatedHeight: CGFloat? { get set }
}

public extension CabbageTableViewHeaderFooterModel {

}

public class DefaultCabbageTableViewHeaderFooterModel: CabbageTableViewHeaderFooterModel {

    public var title: String? = ""
    public var estimatedHeight: CGFloat? = CGFloat.closeToZero()
    
}
