import Foundation

extension URLComponents {
    
    /// Convenience initializer for APIRequest
    ///
    /// - Parameter request: Request which needs to be executed
    init(request: APIRequest) {
        self = {
            var components = URLComponents()
            
            components.scheme = request.service.scheme.rawValue
            components.host = request.service.host
            components.path = "/" + NSString.path(withComponents: [
                request.service.root,
                request.path
            ])
            
            return components
        }()
    }
    
}
