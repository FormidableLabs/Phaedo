public func *(variable: Variable, coefficient: Double) -> Term {
  return Term(variable: variable, coefficient: coefficient)
}

public func /(variable: Variable, denominator: Double) -> Term {
  return variable * (1.0 / denominator)
}

prefix public func -(variable: Variable) -> Term {
  return variable * -1.0
}

// Term multiply, divide, and unary invert
public func *(term: Term, coefficient: Double) -> Term {
  return Term(
    variable: term.variable(),
    coefficient: term.coefficient() * coefficient
  )
}

public func /(term: Term, denominator: Double) -> Term {
  return term * (1.0 / denominator)
}

prefix public func -(term: Term) -> Term {
  return term * -1.0
}

// Expression multiply, divide, and unary invert
public func *(expression: Expression, coefficient: Double) -> Expression {
  let multipliedTerms = expression.terms().map { $0 * coefficient }
  return Expression(
    terms: multipliedTerms,
    constant: expression.constant() * coefficient
  )
}

public func /(expression: Expression, denominator: Double) -> Expression {
  return expression * (1.0 / denominator)
}

prefix public func -(expression: Expression) -> Expression {
  return expression * -1.0
}

// Double multiply
public func *(coefficient: Double, expression: Expression) -> Expression {
  return expression * coefficient
}

public func *(coefficient: Double, term: Term) -> Term {
  return term * coefficient
}

public func *(coefficient: Double, variable: Variable) -> Term {
  return variable * coefficient
}

// Expression add and subtract
public func +(first: Expression, second: Expression) -> Expression {
  let mergedTerms: [Term] = first.terms() + second.terms()
  return Expression(
    terms: mergedTerms,
    constant: first.constant() + second.constant()
  )
}

public func +(first: Expression, second: Term) -> Expression {
  let mergedTerms: [Term] = first.terms() + [second]
  return Expression(terms: mergedTerms, constant: first.constant())
}

public func +(expression: Expression, variable: Variable) -> Expression {
  return expression + Term(variable: variable)
}

public func +(expression: Expression, constant: Double) -> Expression {
  return Expression(terms: expression.terms(), constant: expression.constant() + constant)
}

public func -(first: Expression, second: Expression) -> Expression {
  return first + -second
}

public func -(expression: Expression, term: Term) -> Expression {
  return expression + -term
}

public func -(expression: Expression, variable: Variable) -> Expression {
  return expression + -variable
}

public func -(expression: Expression, constant: Double) -> Expression {
  return expression + -constant
}

// Term add and subtract
public func +(term: Term, expression: Expression) -> Expression {
  return expression + term
}

public func +(first: Term, second: Term) -> Expression {
  return Expression(terms: [first, second])
}

public func +(term: Term, variable: Variable) -> Expression {
  return term + Term(variable: variable)
}

public func +(term: Term, constant: Double) -> Expression {
  return Expression(term: term, constant: constant)
}

public func -(term: Term, expression: Expression) -> Expression {
  return -expression + term
}

public func -(first: Term, second: Term) -> Expression {
  return first + -second
}

public func -(term: Term, variable: Variable) -> Expression {
  return term + -variable
}

public func -(term: Term, constant: Double) -> Expression {
  return term + -constant
}

// Variable add and subtract
public func +(variable: Variable, expression: Expression) -> Expression {
  return expression + variable
}

public func +(variable: Variable, term: Term) -> Expression {
  return term + variable
}

public func +(first: Variable, second: Variable) -> Expression {
  return Term(variable: first) + second
}

public func +(variable: Variable, constant: Double) -> Expression {
  return Term(variable: variable) + constant
}

public func -(variable: Variable, expression: Expression) -> Expression {
  return variable + -expression
}

public func -(variable: Variable, term: Term) -> Expression {
  return variable + -term
}

public func -(first: Variable, second: Variable) -> Expression {
  return first + -second
}

public func -(variable: Variable, constant: Double) -> Expression {
  return variable + -constant
}

// Double add and subtract
public func +(constant: Double, expression: Expression) -> Expression {
  return expression + constant
}

public func +(constant: Double, term: Term) -> Expression {
  return term + constant
}

public func +(constant: Double, variable: Variable) -> Expression {
  return variable + constant
}

public func -(constant: Double, expression: Expression) -> Expression {
  return -expression + constant
}

public func -(constant: Double, term: Term) -> Expression {
  return -term + constant
}

public func -(constant: Double, variable: Variable) -> Expression {
  return -variable + constant
}

// Expression relations
public func ==(first: Expression, second: Expression) -> Constraint {
  return Constraint(expression: first - second, operator: .EqualTo)
}

public func ==(expression: Expression, term: Term) -> Constraint {
  return expression == Expression(term: term)
}

public func ==(expression: Expression, variable: Variable) -> Constraint {
  return expression == Term(variable: variable)
}

public func ==(expression: Expression, constant: Double) -> Constraint {
  return expression == Expression(constant: constant)
}

public func <=(first: Expression, second: Expression) -> Constraint {
  return Constraint(
    expression: first - second,
    operator: .LessThanOrEqualTo
  )
}

public func <=(expression: Expression, term: Term) -> Constraint {
  return expression <= Expression(term: term)
}

public func <=(expression: Expression, variable: Variable) -> Constraint {
  return expression <= Term(variable: variable)
}

public func <=(expression: Expression, constant: Double) -> Constraint {
  return expression <= Expression(constant: constant)
}

public func >=(first: Expression, second: Expression) -> Constraint {
  return Constraint(
    expression: first - second,
    operator: .GreaterThanOrEqualTo
  )
}

public func >=(expression: Expression, term: Term) -> Constraint {
  return expression >= Expression(term: term)
}

public func >=(expression: Expression, variable: Variable) -> Constraint {
  return expression >= Term(variable: variable)
}

public func >=(expression: Expression, constant: Double) -> Constraint {
  return expression >= Expression(constant: constant)
}

// Term relations
public func ==(term: Term, expression: Expression) -> Constraint {
  return expression == term
}

public func ==(first: Term, second: Term) -> Constraint {
  return Expression(term: first) == second
}

public func ==(term: Term, variable: Variable) -> Constraint {
  return Expression(term: term) == variable
}

public func ==(term: Term, constant: Double) -> Constraint {
  return Expression(term: term) == constant
}

public func <=(term: Term, expression: Expression) -> Constraint {
  return expression >= term
}

public func <=(first: Term, second: Term) -> Constraint {
  return Expression(term: first) <= second
}

public func <=(term: Term, variable: Variable) -> Constraint {
  return Expression(term: term) <= variable
}

public func <=(term: Term, constant: Double) -> Constraint {
  return Expression(term: term) <= constant
}

public func >=(term: Term, expression: Expression) -> Constraint {
  return expression <= term
}

public func >=(first: Term, second: Term) -> Constraint {
  return Expression(term: first) >= second
}

public func >=(term: Term, variable: Variable) -> Constraint {
  return Expression(term: term) >= variable
}

public func >=(term: Term, constant: Double) -> Constraint {
  return Expression(term: term) >= constant
}

// Variable relations
public func ==(variable: Variable, expression: Expression) -> Constraint {
  return expression == variable
}

public func ==(variable: Variable, term: Term) -> Constraint {
  return term == variable
}

public func ==(first: Variable, second: Variable) -> Constraint {
  return Term(variable: first) == second
}

public func ==(variable: Variable, constant: Double) -> Constraint {
  return Term(variable: variable) == constant
}

public func <=(variable: Variable, expression: Expression) -> Constraint {
  return expression >= variable
}

public func <=(variable: Variable, term: Term) -> Constraint {
  return term >= variable
}

public func <=(first: Variable, second: Variable) -> Constraint {
  return Term(variable: first) <= second
}

public func <=(variable: Variable, constant: Double) -> Constraint {
  return Term(variable: variable) <= constant
}

public func >=(variable: Variable, expression: Expression) -> Constraint {
  return expression <= variable
}

public func >=(variable: Variable, term: Term) -> Constraint {
  return term <= variable
}

public func >=(first: Variable, second: Variable) -> Constraint {
  return Term(variable: first) >= second
}

public func >=(variable: Variable, constant: Double) -> Constraint {
  return Term(variable: variable) >= constant
}

// Double relations
public func ==(constant: Double, expression: Expression) -> Constraint {
  return expression == constant
}

public func ==(constant: Double, term: Term) -> Constraint {
  return term == constant
}

public func ==(constant: Double, variable: Variable) -> Constraint {
  return variable == constant
}

public func <=(constant: Double, expression: Expression) -> Constraint {
  return expression >= constant
}

public func <=(constant: Double, term: Term) -> Constraint {
  return term >= constant
}

public func <=(constant: Double, variable: Variable) -> Constraint {
  return variable >= constant
}

public func >=(constant: Double, expression: Expression) -> Constraint {
  return expression <= constant
}

public func >=(constant: Double, term: Term) -> Constraint {
  return term <= constant
}

public func >=(constant: Double, variable: Variable) -> Constraint {
  return variable <= constant
}

// Constraint strength modifier
public func |(constraint: Constraint, strength: Strength) -> Constraint {
  return Constraint(other: constraint, strength: strength)
}

public func |(strength: Strength, constraint: Constraint) -> Constraint {
  return constraint | strength
}
