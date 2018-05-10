import UIKit

/// Define rules for layout application to a given view type
protocol ViewLayout {

    associatedtype View

    func applyLayout(toView view: View)
}
