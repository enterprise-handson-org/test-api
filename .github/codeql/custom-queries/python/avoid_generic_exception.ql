/**
 * @name 一般的な Exception のキャッチを避ける
 * @description 具体的な例外タイプをキャッチする代わりに一般的な Exception をキャッチすると、
 *              意図しない例外も捕捉されてしまう可能性があります。
 * @kind problem
 * @problem.severity warning
 * @precision high
 * @id py/avoid-generic-exception
 * @tags maintainability
 *       best-practice
 */

import python

from ExceptStmt except
where 
  except.getType().getASubClass*() = Object::builtin("Exception") and
  not except.getType() = Object::builtin("Exception").getASubClass+()
select except, "具体的な例外タイプをキャッチする代わりに一般的な Exception をキャッチしています。"
