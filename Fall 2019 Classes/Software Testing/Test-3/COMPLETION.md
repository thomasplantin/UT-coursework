#Completion sheet for Test 3 studying.

o/O == pending
x/X == completed

## O - Mutation ----------------------------------------------------- (/)
###### o - Basics of Mutation
###### o - SubTopic 1.2
###### o - SubTopic 1.3

## O - Topic 2 ----------------------------------------------------- (/)
###### o - SubTopic 2.1
###### o - SubTopic 2.2
###### o - SubTopic 2.3

## O - Topic 3 ----------------------------------------------------- (/)
###### o - SubTopic 3.1
###### o - SubTopic 3.2
###### o - SubTopic 3.3

## O - Topic 4 ----------------------------------------------------- (/)
###### o - SubTopic 4.1
###### o - SubTopic 4.2
###### o - SubTopic 4.3


==================================================================================================================================
## O - Mutation ----------------------------------------------- (/)
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

`static int min(int x, int y) {
	int minVal;
	minVal = x;
	if(y<minVal) {
		minVal = y;
	}
	return minVal;
}`