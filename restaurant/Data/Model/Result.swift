import Foundation


open class Result<T> {
    public var success : T?
    public var error : Error?
}
