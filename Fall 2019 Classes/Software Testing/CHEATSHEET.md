#This is a cheatsheet for Java

##HashSet & HashMap

###Create a HashSet:
`HashSet<var_type> hashSetName = new HashSet<var_type>()`

Properties:
	- No value repititions tolerated.

Example:
	`HashSet<String> hset = new HashSet<String>();`
    `hset.add("AA");`


###Create a HashMap:
`HashMap<var_type_key, var_type_value> hashMapName = new HashMap<var_type_key, var_type_value>()`

Properties:
	- Value repititions allowed.
	- No key repititions tolerated.

Example:
	`HashMap<Integer, String> hmap = new HashMap<Integer, String>();`
	`hmap.put(1, "AA");`
