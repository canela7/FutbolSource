import UIKit

fileprivate var aView: UIView?

extension UIViewController {
    
    func showSpinner(){
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.8)
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = aView!.center
        activityIndicator.startAnimating()
        aView?.addSubview(activityIndicator)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner(){
        aView?.removeFromSuperview()
        aView = nil
    }
    
    
    func toggleBlur(_ blurred: Bool){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: -0.1, options: .curveEaseOut, animations: {
            aView?.alpha = blurred ? 1 : 0
        }, completion: nil)
    }
    
    
}
