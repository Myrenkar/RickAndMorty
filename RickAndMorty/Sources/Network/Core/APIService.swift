import Foundation

/// Scheme for the service
enum Scheme: String {
    case HTTP = "http"
    case HTTPS = "https"
}


/// Interface for the API services
protocol APIService {
    
    /// Connection scheme, default `http`
    var scheme: Scheme { get }
    
    /// Base url as string
    var host: String { get }

    /// Root to the Rest API
    var root: String { get }
}

extension APIService {
    
    /// Default scheme `https`
    var scheme: Scheme { return .HTTPS }
}
