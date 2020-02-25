/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
/* Generated By:JJTree: Do not edit this line. ASTTerm.java */
/* JJT: 0.3pre1 */

package Mini;

/**
 *
 */
public class ASTTerm extends ASTExpr {
  // Generated methods
  ASTTerm(final int id) {
    super(id);
  }

  ASTTerm(final MiniParser p, final int id) {
    super(p, id);
  }

  public static Node jjtCreate(final MiniParser p, final int id) {
    return new ASTTerm(p, id);
  }

  // Inherited closeNode(), dump()

  /**
   * Drop this node, if kind == -1, because then it has just one child node
   * and may be safely replaced with it.
   */
  @Override
  public ASTExpr traverse(final Environment env) {
    if(kind == -1) {
        return exprs[0].traverse(env);
    } else {
        return new ASTExpr(exprs, kind, line, column).traverse(env);
    }
  }
}
