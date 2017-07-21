
import UIKit

public protocol CabbageView {

    var model: CabbageModel? { get set }

    init(withModel: CabbageModel)

    func setModel(with: CabbageModel)
}

public extension CabbageView {


}
