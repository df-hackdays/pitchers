import Foundation
import MongoSwiftMobile

/// The result of an `insertOne` command on a `RemoteMongoCollection`.
public struct RemoteInsertOneResult: Decodable {
    /// The identifier that was inserted. If the document doesn't have an identifier, this value
    /// will be generated by the Stitch server and added to the document before insertion.
    public let insertedId: BsonValue
    
    internal init(insertedId: BsonValue) {
        self.insertedId = insertedId
    }
    
    // Workaround until SWIFT-104 is merged, which will make BsonValue `Decodable`
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let doc = try decoder.singleValueContainer().decode(Document.self)
        guard let insertedId = doc[CodingKeys.insertedId.rawValue] else {
            throw MongoError.invalidResponse()
        }
        self.insertedId = insertedId
    }
    
    internal enum CodingKeys: String, CodingKey {
        case insertedId
    }
}
