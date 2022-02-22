import UIKit

// 뷰의 모서리를 둥글게 하는 메서드
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

// 텍스트 필드의 placeholder의 패딩 값 넣어주기
extension UITextField {
    func addLeftPadding() {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = padding
        self.leftViewMode = ViewMode.always
    }
    
    func textFieldBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 20
        self.addLeftPadding()
    }
}

// 둥근 이미지 버튼 만들어주기
extension UIButton {
    func roundButton() {
        self.layer.cornerRadius = self.layer.frame.size.width/2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
    }
}
