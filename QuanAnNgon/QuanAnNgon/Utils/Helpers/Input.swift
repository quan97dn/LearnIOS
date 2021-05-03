import UIKit

class Input {
    static func setPaddingPlaceholder(
        _ field: UITextField,
        padding: Int = 10
    ) -> Void {
        field.leftView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: padding,
                height: Int(field.frame.height)
            )
        )
        field.leftViewMode = .always
        field.rightViewMode = .always
    }
    
    static func setTextPlaceholder(
        _ field: UITextField,
        text: String = "",
        colorText: UIColor = UIColor.white
    ) -> Void {
        field.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.foregroundColor : colorText
            ]
        )
    }
}
