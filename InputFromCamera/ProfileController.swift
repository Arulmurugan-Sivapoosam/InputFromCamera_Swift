
import UIKit

final class ProfileController: UIViewController {
  
  @IBOutlet private var phoneNumber: UITextField!
  @IBOutlet private var emailAddress: UITextField!
  @IBOutlet private var address: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareProfileScreenFields()
  }

}


private extension ProfileController {
  
  func prepareProfileScreenFields() {
    navigationItem.title = "Profile"
    addCamInputBarButton(to: phoneNumber)
    addCamInputBarButton(to: address)
    addCamInputBarButton(to: emailAddress)
  }
  
  func addCamInputBarButton(to field: UITextField) {
    guard field.canPerformAction(#selector(captureTextFromCamera(_:)), withSender: field) else{return} // Availability check.
    let toolBar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 44)))
    toolBar.items = [
      UIBarButtonItem(title: nil, image: .init(systemName: "camera.badge.ellipsis"), primaryAction: .captureTextFromCamera(responder: field, identifier: nil), menu: nil),
      UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
      UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard)),
    ]
    field.inputAccessoryView = toolBar
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
}
