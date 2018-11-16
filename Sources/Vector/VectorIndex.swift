import Foundation

/// Defines the common set of protocols to be implemented by any concrete `VectorIndex`.
public typealias VectorIndex = StaticCollectionIndex & CaseIterable
