#Completion sheet for Test 2 studying.

o/O == pending
x/X == completed

## X - Graphs ------------------------------------------------------------- (10/24)
###### x - Coverage for Designs and Specs

## O - Logic Coverage ----------------------------------------------------- (10/26)
###### x - Criteria
###### o - Source Code
###### o - Specification/Finite-State Machines

## X - Input Space Partitioning ------------------------------------------- (10/26)
###### x - Input Domain Modeling
###### x - Combination Strategies Criteria & Constraints among Partitions

## X - Syntax-based Testing ----------------------------------------------- (10/26)
###### x - Criteria
###### x - Basics of Mutation


==================================================================================================================================


## X - Graphs ------------------------------------------------------------- (10/24)
###### x - Coverage for Designs and Specs

#All-defs = All defs reach a single use.
#All-uses = All defs reach every use.
#All-du-paths = All possible paths from all defs to all uses.

#Call Graphs => nodes represent methods and edges represent method invocations.
	-Method coverage = each method to be invoked at least once.
	-Call coverage = each method invocation in code to be executed at least once.

#Parameter coupling terminology:
	-Caller ============ method that invokes another method.
	-Callee ============ method that is invoked.
	-Call site ========= statement that makes the call.
	-Actual parameter == variable passed at call site.
	-Formal parameter == variable in method declaration.
	-Coupling variable = variable whose value is used in another method.

#Last-def:
	-Set of nodes that define a variable for which there is a def-clear path from the node through the call site to a use in another method.

#First-use:
	-Set of nodes that have uses of a variable for which there is a def-clear and use-clear path from the entry point (if the use is in the callee) or the call site (if the use is in the caller) to the nodes.

#Coupling du-path:
	-From a last-def to a first-use.



## O - Logic Coverage ----------------------------------------------------- (10/24)
###### x - Criteria

#Predicate:
	-expression that evaluates to a boolean value.
		-may contain variables (boolean or non-boolean) and methods
		-internal structure defined by logical operators ("!", "||", "&&")

#Clause:
	-predicate that contains NO logical operators - e.g. "a > b", "C", and "p(x)"

#PC - Predicate coverage => for each p in P, TR contains 2 requirements:
	-p evaluates to true.
	-p evaluates to false.

#CC - Clause coverage => for each c in C, TR contains 2 requirements:
	-c evaluates to true.
	-c evaluates to false.

`Example:
Consider the predicate "P = ((a > b) || C) && p(x)"`

`Predicate coverage satisfied by 2 tests:
1. a = 5, b = 4, C = true, p(x) = true --> P = true
2. a = 5, b = 4, C = true, p(x) = false --> P = false
The two tests DO NOT satisfy clause coverage.
`

`Clause coverage satisfied by 2 tests:
1. a = 5, b = 5, C = false, p(x) = true --> P = false
2. a = 5, b = 4, C = true, p(x) = false --> P = false
The two tests DO NOT satisfy predicate coverage.
`

PC DOES NOT SUBSUME CC, AND CC DOES NOT SUBSUME PC.

#CoC - Combinatorial coverage:
	-For each p in P, TR has test requirements for the clauses in Cp to evaluate to each possible combination of truth values. (so it's like a truth table).
	-A predicate with n clauses has 2^n possible combinations.

#Determination:
	-Major clause ci determines p if the minor clauses have values so that changing the truth value of ci changes the value of p.

#ACC - Active Clause Coverage:
	-TR has 2 requirements for each active clause ci in Cp for each p in P: ci evaluates to true; and ci evaluates to false.

#CACC - Correlated Active Clause Coverage:
	-ACC, but the values chosen for minor clauses cj (j!=i) must cause p to be true for one value of ci, and false for the other.

#RACC - Restricted Active Clause Coverage:
	-ACC, but the values chosen for minor clauses cj (j!=i) must be the same when ci is true as when ci is false.

#ICC - Inactive Clause Coverage:
	-For each p in P and each major clause ci in Cp, choose minor clauses cj (j!=i) so that ci does NOT determine p. TR has 4 test requirements for ci:
		1 - ci evaluates to true with p true;
		2 - ci evaluates to false with p true;
		3 - ci evaluates to true with p false;
		4 - ci evaluates to false with p false;

#GICC - General Inactive Clause Coverage:
	-ICC such that the values chosen for the minor clauses for a given major clause may vary among the four cases.

#RICC - Restricted Inactive Clause Coverage:
	-ICC such that the values chosen for the minor clauses for a given major clause must be the same in cases (1) and (2), and also be the same in cases (3) and (4).

#To make a clause in a predicate active => Make P(c=true)^P(c=false) true
`Example:
P = a || b
`

`To make a active:
P(a=true)^P(a=false)
= (true || b) ^ (false || b)
= true ^ b
=!b`

`Thus setting b = false makes clause a active.`

###### o - Source Code
###### o - Specification/Finite-State Machines



## O - Input Space Partitioning ------------------------------------------- (10/25)
###### o - Input Domain Modeling

#Input Domain => Set of possible values for the parameters.

#Partition of a Domain => Set of blocks b1, b2, ..., bn. For a legal partition:
	-For any inputs, no more than 1 block is invoked.
	-All blocks cover all possible conditions.

#Input Domain Modeling:
	1 - Identify functionality.
	2 - Identify the inputs.
	3 - Create an input domain model (IDM)
		-Scope input domain based on inputs.
		-Define structure of input domain using input characteristics.
		-Create a partition w.r.t. each characteristic.
	4 - Apply a test criterion to form block combinations.
		-Take one block for each characteristic at a time.
	5 - Reify block combinations into test inputs.
		-Choose appropriate values for the blocks.

#Two ways to make IDM:
	-Interface-based IDM => Just look at types of parameters (int, str, double, char, etc...)
	-Functionality-based IDM => Assess the functionality of each parameter to create more elaborate tests.


###### o - Combination Strategies Criteria & Constraints among Partitions

#ACoC - All Combinations Coverage:
	-All combinations of blocks from all characteristics must be used.
	-Number of tests is the product of number of blocks in each characteristic.

#ECC - Each Choice Coverage:
	-One value from each block for each characteristic must be used in at least one test case.
	-Number of tests is at least the number of blocks in the largest characteristic.

#PWC - Pair-Wise Coverage:
	-A value from each block for each characteristic must be combined with a value from every block for each other characteristic.
	-Number of tests is at least the product of the two largest characteristics.

#TWC - T-Wise Coverage:
	-A value from each block for each group of t characteristics must be combined.

#BCC - Base Choise Coverage:
	-A base choice block is chosen for each characteristic, and a base test is formed by using the base choice for each characteristic. Subsequent tests are chosen by holding all but one base choice constant and using each non-base choice in each other characteristic.



## O - Syntax-based Testing ----------------------------------------------- (10/25)
###### o - Criteria

#Language => Set of strings.

#String => Finite sequence of symbols (taken from a finite alphabet).

#Regular expression => Defines a language using a sequence of:
	-Basic Symbols, e.g., a = {"a"}
	-Alternation (|), e.g., a|b = {"a", "b"}
	-Concatenation (.), e.g., (a|b).a = {"aa", "ba"}
	-Epsilon (e) - the language {""}
		-(a.b)|e = {"ab", ""}
	-Repetition (*) - intuitively, 0+ repetitions:
		-a* = {"", "a", "aa", "aaa", "aaaa", ...}
		-((a|b).a)* = {"", "aa", "ba", "aaaa", "aaba", "baaa", "baba", "aaaaaa", ...}

#Context-free grammar (BNF) => Defines a language using a set of productions of the form sym0 -> sym1...symk
	-sym0 is a non terminal.
	-Each sym1, ..., symk is terminal or non-terminal.
	-One symbol is distinguished as the start symbol.
	-"|" indicates choice.
	-sym^* - 0 or more repetitions of sym.
	-sym^+ - 1 or more repetitions of sym.
	-sym^k - exactly k repetitions of sym.
	-sym^(m-n) - at least m and at most n repetitions of sym.

`Example grammar
S -> M
M -> IN
I -> add | remove
N -> D^(1-3)
D -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9					STRINGS NOT IN LANGUAGE: "add 1 add 1" - repetition not implemented.
`

#Two basic uses of grammars:
	-Recognizers - decide if the given string is in the language.
	-Generators - create strings that are in the language (a use is test input generation).

#TSC - Terminal Symbol Coverage:
	-TR contains each terminal in the grammar.
	-#tests <= #terminals.

#PDC - Production Coverage:
	-TR contains each production in the grammar.
	-#tests <= #productions
	-PDC subsumes TSC.

#DC - Derivation Coverage:
	-TR contains every string that can be derived from the grammar.


###### o - Basics of Mutation

#Two simple ways to create mutants (valid or invalid):
	-Mutate symbols in a ground string. (E.g., "add 0" -> "remove 0")
	-Mutate grammar and derive ground strings. (E.g., "I -> add | remove" -> "I -> add | delete")

Assume grammar G defines language L.

#Ground string => String in L.

#Mutation operator => Rule that specifies (syntactic) variations of strings generated from a grammar.

#Mutant => Result of one application of a mutation operator.
	-Mutant might be in L (valid) or not in L (not valid).

#Mutation can be used in various ways:
	-Mutate inputs to program.
	-Mutate programs themselves (mutation testing).