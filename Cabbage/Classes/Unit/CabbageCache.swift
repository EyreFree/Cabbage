
import Foundation

public protocol CabbageCache {

    /// 存储缓存
    func cacheSave()

    /// 读取缓存
    func cacheLoad() -> Self?
}

// 默认实现：什么都没有做
public extension CabbageCache {

    /// 存储缓存
    func cacheSave() {

    }

    /// 读取缓存
    func cacheLoad() -> Self? {

        return nil
    }
}
