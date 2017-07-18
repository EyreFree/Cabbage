
import Foundation

public typealias CabbageDispatchFunction = (CabbageAction) -> Void
public typealias CabbageMiddleware<State> = (@escaping CabbageDispatchFunction, @escaping () -> State?)
    -> (@escaping CabbageDispatchFunction) -> CabbageDispatchFunction
