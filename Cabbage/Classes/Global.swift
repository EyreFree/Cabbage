
import Foundation

// http://swifter.tips/log/
/// 日志打印
public func printLog<T>(
    _ message: T,
    file: String = #file,
    method: String = #function,
    line: Int = #line
    ) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
