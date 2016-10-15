import UIKit
import Phaedo

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // The following example is a simple "box-model" rectangle,
    // analogous to the attributes/constraints of an AutoLayout view.
    let solver = Solver()

    let leftVariable = Variable(name: "left")
    let topVariable = Variable(name: "top")
    let widthVariable = Variable(name: "width")
    let heightVariable = Variable(name: "height")

    let rightVariable = Variable(name: "right")
    let bottomVariable = Variable(name: "bottom")
    let centerXVariable = Variable(name: "centerX")
    let centerYVariable = Variable(name: "centerY")

    solver.addEdit(widthVariable, strength: .Strong)
    solver.suggestValue(widthVariable, value: 1280)

    solver.addEdit(heightVariable, strength: .Strong)
    solver.suggestValue(heightVariable, value: 800)

    solver.add(rightVariable == leftVariable + widthVariable)
    solver.add(bottomVariable == topVariable + heightVariable)

    solver.add(centerXVariable == rightVariable / 2)
    solver.add(centerYVariable == bottomVariable / 2)

    solver.add(leftVariable == 0)
    solver.add(topVariable == 0)

    solver.updateVariables()

    for variable in [
      widthVariable,
      heightVariable,
      topVariable,
      leftVariable,
      bottomVariable,
      rightVariable,
      centerXVariable,
      centerYVariable
    ] {
      print(variable.name(), variable.value())
    }

    solver.dump()
  }
}
