
import Foundation

public typealias CabbageReducer<ReducerStateType> =
    (_ action: CabbageAction, _ state: ReducerStateType?) -> ReducerStateType
