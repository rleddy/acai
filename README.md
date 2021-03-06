Acai

  	A healthy fruit.

				So, here is a computer programming language named after it.

Intro
=============================================================================================================


So, while out of work, I decided that I need a project.
(Currently, looking for paying work after a layoff of all contractors from Zynga. See S.F. Chronical end of October.)

So, I thought, "it would be nice to have a new programming language."

Why not?

But, some might respond with "why bother?".

Well, there are a lot of languages. And, many have good ideas about how to render expressions.

New tricks come along. And, old languages sometimes change to gather the tricks.
So, that is all good.

One example that comes to mind is the new C++, C++11.
It now has lambda expressions and some amount of type inference.

Another, is Java. That language now has type schema, similar to C++ templates.

Some languages have been written to be all functional (LISP, Haskell) and others have been written to be all object oriented,
(Ruby, SmallTalk). These languages adopt clear choices for policies of expression. They may be too purist.
When things start to run many times slower than C or Fortran, with the allowance of interpetation v.s. compilation,
the language user begins to question the need for purity. But, you might notice that among the languages just mentioned,
some produce very swift programs. Haskell and SmallTalk produce fairly swift programs. There used to be compilers for LISP,
and those programs rivaled some of the C programs.

But, time goes by. Some languages are more loved than others. Some start with old machine models and don't grow
with the new machines.

LISP is a language that seems to have fallen out of love. But, it is a stretch for most people to read it.
Furthermore it held onto a basic idiosyncracy from its orginal machine environment.
It had CAR for the right register and CDR for the left register. So, to access list elements, one had to CAR, CDR, CADADR, CDDDR, etc.


New languages such as Python, are highly readable. But, you better be Psycho to get it to run in any thing like useful time.
Well, it is interpreted, and it is certainly faster than Perl and easier to write in as well.

Just a few weeks ago, I translated some Python code into C++. That was not as straight forward a task as one might guess it might be.
The Python code told it's story well enough. But, if you were to try to figure a pair or a triple of some types of objects for C++
you would have to read about how the Python code had to be used, and trace down from example calls to figure the type of the objects.

You really do want some clarity about type in a language. At least the option of stating it in choice
places - without just calling up conversions, helps figure how the code will be used in relation to memory or messaging.

So, there are a lot of issues in language when making language design choices. Take pointers for instance.
Some languages ommit pointers. There is some belief that programmers fair better without them. That programs crash less.
Of course, you can still divde by zero, or try to dereference NULL. But, some believe pointers are dangerous.
Or, at least some language owners would go around saying that so as to make their pointerless languages more sellable.
But, these pointerless languages usually try to own all the memory models. Those language are supposed to provide a sub layer of memory management.
And, memory objects get reference counts, which go up and down with scoping and other indicators of object use.
For instance when a field of some object is set to NULL, or is reset, or is unset, the referent gets one less reference count.
Then a garbage collector, which runs when it wants, culls all the objects not referenced.

Garbage collection options and the option to use reference counted objects is a good strategy for many kinds of programs.
It is not good for all programs. Some programs work at a low level. Some work at high levels.
Most memory managers take a chunk of time for garbage collection, whenever. Real time programs cannot allow a garbage collection to interfere with its
execution requirements. But, there are memory managers with predicatble time; at least, they have come to light recently.
But, there are times when a program is not extensive in its use, but needs to be rapid and always in memory.
Such programs might be required even in environments that are not real tihme, but the swift availability of a resource would be critical.
So, you might like to lock a program into memory and let other programs make page faults and do garbage collection.

These programs that are locked into memory might have very customized memory management. And, you would want for
the program to have full access to pointer arithmetic. So, you would want your language to have pointer access
and a keen awareness of the type of data in the memory areas.

It would be nice to have one language make an easy choice between different types of memory use.
There are all kinds of ways to make these choices at the present time. You can write in more than one language.
You can specify all kinds of OS dependent cryptic flags on compiler lines, etc.
So, it can be done. It's just not pretty.  If you use STL from C++, you can request that containers have custom
memory managers. It's a little tricky to apply, but if you do a lot of mussing with it, you can get some pretty
good control. (It can be difficult to turn a sorted array of objects into a map.)

So, memory management is one of the big concerns in language design. And, there are of course many more concerns.

And, now with processor changes, languages are accomodating many new areas with respect to optimization.

Some of the packages that have to be looked at are the following:

1. OpenCL		-- Language library for working with a collection of different processors.
2. OpenMP		-- A library standard for multi-core programming..
3. TBB			-- A multi-core threading library


An interesting thing about these packages that they have tradeoffs in what they can optimize.
So, if you had a very savy language, you might hide which one of these is in use.
And, CUDA, which some people say is really just for NVIDIA processors, makes us wish that
the language might have to know if that
is the context that it is in. Some have tested a pure CUDA implementation to be swifter than an OpenCL implementation.
But, what if we have a processor that is not CUDA compatible, but is OpneCL compatible?
And in general, there might or might not be an FPGA or GPU available for use.


Why Acai?
=============================================================================================================


Well, not long ago, I wrote a little CMS stack. It relied heavily on JavaScript as opposed to PHP.

That is, there is more on the client side than on the server side when compared to other CMS immplementations.

I figured out that you could componentize certain aspects of the CMS pages.
And, I found a JavaScript package which got me componentizing fairly quickly, OAT.

So, I figured out that I could have a Rolled OAT Repository. And, my CMS would be a Rolled OAT Construction Kit.
Which, meant my CMS could ROCK and ROAR.

Well, it turns out that OAT is not that popular. Why, I don't know. I suppose that it's because it's not JQuery.
And, I had some trouble getting attention for my CMS. Others, which are much heavier in computation are more popular.

So, it got put on the back burner, as soon as I went broke. (Fun game computers. Some get rich doing almost nothing.
Others, produce amazing working and join me in being broke. I am not saying that my work is amazing.
Although, I once wrote a program, "Amazing Dots", which was about making mazes.)

Well, I like the breakfast food theme. Rolled OATS, Green Tea, Acai.
That's my computer realm.

Well, anyway, Acai, is supposed to be good for you. Some use it to lose weight.
So, Acai, might be good with Java, for instance, which might need to lose some weight.

(Check out the programming language shootout. And, compare langauges based on memory consumption.)


Meta, Meta
=============================================================================================================

One way to leave out a piece of a program and show that something goes in a section of it is to put it in a tag:
`<something goes here>`

(Text version of this doc) Look for === to separate big section.
Look for --- to separate little subsections.


Some Goals for this Language  (acai)
=============================================================================================================

Here are some goals of this languages:

1. FAST - Be able to write swift compiled programs with easy memory management choices.
2. Translate TO - Translation to other programs is fine, perhaps it can compile to C++11 and Fortran.
3. Translate FROM - It would be nice to translate to the language easily enough, e.g. Java to the language.
4. Knowledge Representation - It would be nice to express knowldege in it, for it's use. For example, OWL primitives might be included.
5. Mathematics - It should allow better than average mathematical expression.
6. Vector Math - It should embrace 3D and higher order expression as part of the language.
7. Type - It should infer type and allow type clarity and at times, in certain identified sections, dispense with it.
8. Interpreter - There should be an interpreter. It should all the compiled based to be attached with interpretation to follow for experimentation.
9. Real Time - Real time should be part of its understanding.
10. Patterns - There should be a framework for pattern matching, which allows a for differnt kinds of matching (RegExp, Satistical, Type, Algorithmic, Time Sensitive)
11. Unit Tests - Compiling the code should allow for partial unit tests to be generated as a biproduct.
12. Machine awareness - It should make use of optimization libraries transparently as possible.
13. Memory - try to keep from using too much. Keep it under tight control, make garbage collection options obvious.
14. Get something working - it should accomplish all of the above at some point in time, but get started.



//{{CLIPS,Haskell


Some Basic Language Features
=============================================================================================================

So, this is a computer progamming language. That is, it should allow short, simple, and perspicous renderings of process descriptions,
which will eventually be binary instructions in some collection of processor units, CPU, GPU, FGPA, etc.


So, let's start with key words and variables and type names.

Variables
----------

Variables will have not special characters in front of them or after them. They will be lower case, except optionally the second character may be upper case.
Variables may include the character '_'. This underscore character will have a special meaning at the front of a variable, meaning, a class variable.
Variables may not start with numbers. But, they may include numbers.

A variable which starts with u followed by four digits or has _u before four digits can be treated as a UTF8 renderable variable.

Here are some examples:

```
	this_is_a_variable
	_this_is_a_class_member_variable

	this_is_variable_2

	nice_for_utf8_u0416 /// a variable with utf8 for Russian (&0416) at the end.

	aNumber


	(Double aNumber)
```

Variables can be followed by a dot '.'.



Type Names
----------

Type names can look like variables. But, let's just insist that they start with an uppercase character.

	Int
	Double
	String
	Char

etc.

Type names cannot be followed by a dot '.'. Except, when defining class members, and then only for certain definer key words.


Declaring a Variable of a Specific Type:
----------

As follows:

<type_name> <variable_name>

Examples:

Double	ddd;

Int 	how_many;

String a_name_or_something;

Char	one_of_these;

SuperNetwork	concocted;



Key words
---------


In this language each key word can start with a dot '.'. Each key word has to be followed by a parenthetical expression or a start of block indicator or an optional end of statement indicator.
Let's choose '{' for a start of block. And, '}' for an end of block. That's common in many languages.

So, here are som examples:
```

.if( <expr> )
.elseif ( <expr> )

.else ( )

.else {
	<expressions>
}


.for ( <exprs> ) {
	<expressions>
}


.while (<exprs> ) { <expressions> }

.do until (<exprs>) { <expressions> }

.continue()
.continue;

.break;

.exit(<value>)

.exit; // has a default value 0


.cases(<expr>) {
	.case(<expr1>) {
		.break;
	}
	.case(<expr2>) {
		.break;
	}
	.case(<expr3>) {
		.break;
	}
	.default {
	}
}
```


So, now this collection of statements could have white spaces removed, and still make sense, perhaps.

```
.if(<expr>){
	<expressions>
} .else if(<expr>) {
	.for (<exprs> ){
		.cases(<expr>) {
			.case (<expr1>) {
				.break;
			}
			.case (<expr2>) {
				.break;
			}
			.case (<expr3>) {
				.break;
			}
			.default {
			}
		}
	}
} .else {
	.exit(1)
}
```

White spaces removed:
```
.if(<expr>){<expressions>}.elseif(<expr>){.for(<exprs>){.cases(<expr>){.case(<expr1>){.break}.case(<expr2>){.break}.case(<expr3>){.break}.default{.break}}}}}.else {.exit(1)}
```

Well, you might be able to read it. But, it will be nice to compile. If the program eliminates white space, it can be assumed that it will not eliminate them from string literals.



Doing things with dots
----------------------


So, here is one idea having to do with puting a '.' in front of key words.

If I write a variable followed by a key word, I will see something like the following:

`	a_var.if(<expr>) { <exprs> }`

This has a kind of Ruby-esk feel to it. As if any var could be an object.


Well, it would be nice to make it like that, but not go that far all the time.
So, if the variable is an object, then you can get a lambda application kind of feel to the conditional.
If the variable is more literal, then the expression might act more like a lambda with the variable as the first parameter.

We can represent 'this' with a symbol '@'

We might write the following:

```
	a_var.if ( @ == 2 ) { @ + 5 }
```

This is an expression that yields 7.

( The `@` might be taken implicitly: `7 == a_var.if ( == 2 ) { + 5 }` )


( What about `a = a_var.?(==2)? b : c  T=> { a = ( a_var == 2 ) ? b : c }` )


So, for an object, we would expect a complete functionality of membership from such a construct.

```
my_array.foreach( @._list_of_things .as q ) {
	output << q
}
```

( The `@` might be taken implicitly:

```
	my_array.foreach( ._list_of_things .as q ) {
		output << q
	}
```

  You can see that the implicit use of @ still has meaning when, ._ indicates the member variable.

)


Here is another thing to do with a dot.


Often, loops will be done over a function. But, usually, a loop goes over a block of code. When just one function maps over a set of elements, the loop syntax
starts to appear to be combersome. So, why not have a syntax which supplys a parameter, as would a map?  So, we would have to have some sort of place holder
for the function parameter being repeatedly replaced. And, the loop would have to generate it.

For instance suppose, we have a two parameter fucntion `f`. Then, f(x,y) would be a call of it.

We might write a loop like this:

```
	.for ( c : xs ) {
		f(c,y);
	}
```

But, we might write the following: `f(c,y).for( c : xs );`


Indeed, we could abbreviate further: `f(@,y).for ( : xs );`.


So, this function returns a value, not an object. And `.for` remains a key word (symbol) indicating how values will be introduced to the actual object, which is a function object.
This is somewhat like a curried function, which is a function object. But, we are not forcing a method status onto the .for.

Now, we can include the key words .SIG for sum of a sequence and .PI for the multiplication of a sequence. And, we pretty much can guess that the type of the value of the
next two expressions:

```

	f(@,y).SIG ( : xs )
	f(@,y).PI ( : xs )


```

Here, we can gues that `f(x,y)` returns some kind of number, real, complex, integer. 





Objects and Properties
------------------------


So, we get that there can be objects and objects can have properties.


Say, we have an expression that yields up an object of some type, constructing it, in fact.

`	obj = .new(Cool_thing)`

Or, perhaps

`	obj = .new(Cool_thing,1,3.5,"test case") { <if this is here, it is treated as a lambda passed as the last parameters> }`


We can write the following to access a member of it.

`	obj._a_ride_along_value`


Also, we could have an indicator of a property, call it .p.

`	obj.p(ride_along_value)`

And, we can set 		`obj.p(ride_along_value) = 2`
Or,	 we can get 		`a = obj.p(ride_along_value)`

And, with the .p operator, the '_' of the member is understood.

And, we could expect that a variable value could be used with .p.

`	obj.p("ride_along_value")`

We might expect that every property of an object would have a default enumerated index.

Cool_thing.RIDE_ALONG_VALUE // would be a number identifying the property.


So, we can assume that the properties will have default set and get methods for all object types.
But, we might want to override the behavior of those methods.


We can do this in a class definition.  And, let's use .class as our class definition key word.

```
.class(Cool_thing){

	Int .p(ride_along_value)
			.however (
				.set { <exprs> }
				.get { <exprs> }
			)

	Double	_my_secret_value

	String 	_my_secret_symbol

	String .p(my_published_name)    /// uses defaults for String type.

}
```

So, the .p operator has the quality of setting the visibility of a property to public.


But, .p does not have to be used for internal properties.
One can have the following:

```
.class(Cool_thing){

	Int .p(ride_along_value)
			.however (
				.set { <exprs> }
				.get { <exprs> }
			)

	Double	_my_secret_value

		.however (
				.set { <exprs> }
				.get { <exprs> }
			)

	String 	_my_secret_symbol

	String .p(my_published_name)    /// uses defaults for String type.

}
```

We can have other key words for visibility.

```
.class(Cool_thing) .from(Other_classic_type,And_this_also) {

	.new (<args>) {   // default public virtual
	}

	.delete {
	}


	Int .p(ride_along_value)
			.however (
				.set { <exprs> }
				.get { <exprs> }
			)

	.protected {
		Double	_my_not_so_secret_value
			.however (
					.set { <exprs> }
					.get { <exprs> }
				)

		String 	_my_not_so_secret_symbol
	}

	.public {
		String .p(my_published_name)    /// uses defaults for String type.
		String _and_my_gps_coordinates
	}

	/// private is the default...


}
```





// what about `obj.new(Other_cool_thing)` ???

Another section
=============================================================================================================



Stuff to Make Programs More Readable
=============================================================================================================



```
// This is a comment

/*
		This is a comment... OK
*/

```


Making Use of Some Special Data Structures
=============================================================================================================

So, a vector and a matrix (kinds of vectors) can be basic types in any language if you let them.

So, let's let them.


```
// array

ar = [ 1, 2, 3, 4, 5 ] // default way of constructing...

// matrix

matrix = [ 1, 2, 3; 4, 5, 6; 7, 8, 9 ]  // borrow from certain numerical languages


OK. Then next bit of syntax might be confusing.
But, the first part <m,n> is what goes in the program.
The second part <generator>, is some meta talk, telling us what kind of object is expected in the program.

matrix = [<m,n><generator>]


So, we say we want m*n numbers. And, we want them to be generated by the <generator> and we have it that the
end result will be recognized as a linear matrix (tensor order 2).

We should be able to generalize on that idea,

tensor = [<m,n,o,p,q,r><generator>]. And, the tupple up front can get long. But, it is going to be in text.
So, to get a much larger tensor of indefinite order, another syntax will be used.



```

Now, in programs, one often trades off data structures in some way. It can be turning some data in an array into a list.
It can be something that samples an array and yields it up in some fashion. So, there is the idea that if you have a generator,
you should be able to say what kind of data structure it will end up in.

So, we can have a generator be wrapped by an indicator of the kind of object its data is going to end up in.

So, say we want a list, we can write:

1. `(<generator>)` to say that it ends up in a list.
2. For arrays, we can say `[<generator>]`.
3. Sets, `{<generator>}`
4. Hash, `{# <generator> #}`


As for sets, we think of sets and maps being the same, but with different type of elements.
In fact, we can say all sets are maps for which values from keys are 0 or 1.

And, when we access a set, we can use bracket notation, which is fairly common among languages.
```
x = { <some generator for names> }

x["Joe"] == 1 ? ...
x["car"] == 0 ? ...
```

But, if we have a map,
```
x["Joe"] == <joe's age> ? ...
```

We might be able to specify a fuzzy set.  Here, the membership function is put between `< >`, because it is like the indecies for a matrix.
That is `< >` are in the program, but <membership function> is some function specifier.

```
fzy = {< <membership function> > <generator> }
```

This might be accessed this way.

fzy["Joe"] = 0.4

We should have operators for these things, which we might call containers.
Suppose we allow appendation to a container, intersection, union, difference:

```
a .++ ( b ) // put one at the end of the other.

a .&( b ) // intersect

a .|( b ) // union

a .-( b ) difference
```

You can see that the operators are being treated as key words.

Something for symmetric difference.

```
a .(+)( b ) // Since, it is usually a circle with a plus in it.  Notice, that the characters of a key word are followed by parenthesis. So, parenthesis in the key word can be done.
```

Let's consider some operators on vectors and matricies.

If x and y are vectors, or by matricies, then:

```
z = x + y // z[i] contains x[i] + y[i]
z = x * y // z[i] contains  x[i] * y[i]
z = x - y // z[i] contains x[i] - y[i]
z = x / y // z[i] contains x[i] / y[i]
```

Now, some constants, vector mixing.

Let `a` be a constant, then :

```
z = a + y // z[i] contains a + y[i]
z = a * y // z[i] contains  a * y[i]
z = a - y // z[i] contains a - y[i]
z = a / y // z[i] contains a / y[i]
z = x / a // z[i] contains y[i] / a

```


We can use the C/C++ idea of fixing up assignment with operators:


```
z += a  // z[i] contains a + z[i]
z *= a // z[i] contains  a * z[i]
z -= a // z[i] contains a - z[i]
z /= a  // z[i] contains  z[i] / a

And,

z += x  // z[i] contains x[i] + z[i]
z *= x // z[i] contains  x[i] * z[i]
z -= x // z[i] contains x[i] - z[i]
z /= x  // z[i] contains  z[i] / x[i]

```


Now, vectors and matricies have more operations than constants. So, we can add these in as well.

There is inner product, cross product, and outer product.

Here is inner product:

```
r = x.*(y)
```

Here is matrix multiplication

```
mM = aA .*(bB)
```

Here is a matrix operating on a vector:

```
y = aA .*(x)
```

So, the type of operands is important.
But, we keep in mind that matrix multiplications are lots of inner products, where we walk down the rows of one matrix and across the comlumns of the other matrix.

For a vector cross product, we have three vectors all together, the result and the two inputs.

```
z = x .X(y)  // Here it is more of a key word, X.  We usually see it in text as (a X b). But, we don't require the programming language to be so intuitive about context.
```


Now, we can think of the outer product of two vectors:
```
aA = x .(X)( y ) // So, once again, there is this attempt to get something like a circle out of it.
```

We can also write `tT = aA .(X)( .bB )`.  We should expect that this will construct a higher order tensor out of this operation.


Now, what if I want to compose two functions? We already have matrix multiplication, which is in fact, composition.
So, we can use the .* operator, but on objects of the type function.

```
f = g .* (h)
```

And, it can be used as follows (g .* (h))(<parameters>)


Now, suppose that we have functions of a particular type, called series (e.g. time series). Once again, we can use the .* operator.
But, now we can call it convolution. If we have these time series ff, gg, hh, we might write something like this.

```
ff = gg .* ( hh )
```

But, transforms are more apt to exist in particular domains, so we might indicate that with a special syntax:

```
ff|t = gg|t .*( hh|t )
```

So, seeing this, we could expect that `ff` makes it's values by paying attention to a parameter, `t`. `t` is often time.
This then `|t` is an indication of the type of function ff is in its relation to how it may be manipulated through tansformational
processes.


We might then be able to identify the transform version of this in the following way:
```
.|T|(w){ff|t} == .|T|(w){gg|t .*( hh|t )} == .|T|(w){gg|t} * .|T|(w){hh|t}
```
So, this is a check on the equality of a transformed series with the multiplication of two series, already transformed before multiplication.
The transform is in the w domain. In fact these would be arrays of numbers. A default transform might be the Fourier transform implemented by the FFT.
So, this syntax `.|T|` delimits a type of transform. And, its domain of expression is its parameter.

More on this later.


Accessing Array Elements and Parts of Arrays
--------------------------------------------

Suppose we have an array, `x`.

We might define it in this fairly straight forward way: `x = [1,2,3,4,5,6]`.

Previously, we have suggested this kind of constant addition: `x + 2 == [2,4,6,8,10,12]`.

And, we might have gotten that `x[2] == 6`; we can start indexing at 0.
We can always set up a way to index an array starting at some other elements `x:1[2] == 4`.
This 'colon' syntax is a similar to what other languages have inside the brackets `[]` for ranges.


What about referencing a part of an array? In C, we write `x + 2`, to mean the array starting two addresses up from `x`.
But, we already set aside this operation for adding a constant to the array elements.
But, in C `&x[0]` is the address of the first element of x. That is, `&x[0] == x`.
But, we can use the `&x` in order to mean C's `&x[0]`. In which case, for the `x` that we already have, we can
write `&x == [1,2,3,4,5,6]` for a true expression. Then `&x + 3 == [4,5,6]` is also true.

We might have `y = &x + 2` as a way of defining `y = [3,4,5,6]`. But, there would be a sharing of memory between `x` and `y`.

So, we now can prefer a caveat for array assignment. `y = &x` is a reference, `y` now points to what `x` points to.
But, `y = x` is an implicit copy of `x` into an area refered to by `y`. What about a clone?
Let's say what we mean, a clone can be extensive if objects are big enough. So, we may wish to know when we are taking that
risk. So, `y = x` can be a surface copy. But, we can say `y = .clone(x)` for a clone, of course.

(So, just because some are apt to ask, a clone copies an entire tree or graph of structure top to bottom.)

One last thing for this section, let's shorten things up by allowing `[]` to work on any expression returning parts of arrays as suc:
`(&x + 3)[2] == 6`.

Of course, `(&x + 3)[2] = 7` makes `x` become `[1,2,3,4,5,7]`.

Later, we may discuss the type of the elements in the arrays. They might be objects stored in flat binary formats, or they might
be references to objects, stored somewhere else. In a language such as C, we can be very clear on these choices. In
other languages, we not be sure how things are stored in the array, but it will be taken care of; and, hopefully, the syntax
will provide the right amount of obfuscation and clarification of the issue. Right now, I am guessing there is some
happy medium that will become clear with types.


Requesting Solutions
---------------------


So, if we write [aA b], where aA is a matrix and b is a vector, we get a particular kind of object called a tableau.
We might then write x = .solve([aA b]), in order to get the solution to aA.*(x) == b.

Later, more difficult versions of solving can be discussed. But, the matrix solution is the old stand by.
We should also be able to solve other simple, linear things:
```
y = .solve( [2*x  -5] ), where we can assume that meant 2*x = 5, solve for ```x``` and return it into y.
```
How about this?
```
y = .solve( [ 2*x^2 3*x -5 ] )
```

More on this later.



List Comprehension
=============================================================================================================

I am going to lay out some expamples of possible syntax for list generation.
Later, I will look at some nice syntax for reading from lists.


Now, let's get as close as we can to set theoretic syntax.
We describe a set by writing it's description inside braces `{}`

Often the we would write the description by listing a form of elements followed by a Sheff stroke,
followed by a set of constraints on the values.

For example, `{ x | limit(x) }`

Using this idea and borrowing from Python, we can decide to have the set syntax mean those elements as a data object
collection. So, the set syntax can be used to indicate what will be the elements along with a formula for generating
the elements so indicated.

Here is a an example `{ x | formula_for_generating(x) }`

The formula might produce duplicates. But, we can agree that if a set syntax is used, that there can't be duplicates.
So, `{ x | formula_for_generating(x) }` specifies that when the set is generated, that the duplicates be removed.

It seems like a good idea, to make this an expression of elements being generated. So, we are merely saying that the
elements are generated with a need to have them be stored somewhere. And, we'll express that later. But,
here is another form of generation.

As an extension of set generation, we can imagine similar syntax for arrays.

Here is aa generator of elements with possible duplicates: `[ x | formula_for_generating(x) ]`

Now, let's get specific about how we want to store the generated data.

Data can be stored as a set `{}`, as an array `[]`, as a list `()`.

So, here is a set storage of data without duplicates: `{{ x | formula_for_generating(x) }}`
And, here is a an array storage of data without duplicates: `[{ x | formula_for_generating(x) }]`
And, here is a a list storage of data with possible duplicates: `([ x | formula_for_generating(x) ])`

We can extend this kind of syntactic idea to hash tables `{# #}`

And, we can make elements be more than single objects, but also pairs, tripples, etc.
```
	{{ (x,y) | formula_for_generating(x,y) }}
```

And, we can mangle the syntax for a pair `(x,y)` in order to specify a map: `( x => y )`
So, here is a map specification:

```
	{{ (x => y) | formula_for_generating(x,y) }}
```

So, the examples that follow show some more information about specifying data, and keeping clean separations between parts.

So, here is a special symbol, `|>` . That symbol, `|>` , is meant to keep separate generators for parts of tupples.
If no variables are mentioned, but single values are produced by expressions delimited by `|>`,
then they can be assumed to line up with the tupple elements or one `|>` for each `,`.

If an expression between `|>`'s generates a pair or higher order tupple, then the tupple elements will line up with
the first position the `|>` begins with. And, the next expression following a `|>` will start start after
the length of the tupple.

So, (x,y,z,t,r,s) | gen(x) `|>` gen(a,b)`|>` gen(z) `|>` gen(t,r,s) yields tupples in the family (x,a,b,z,t,r,s)

For stepping along a mesh, ` ^!` is used in place of a delta symbol.

Here are some more examples:

```

// Tripples  :: with explicit types, and with variable bindings

/// return a set -> no duplicates -- default sort
x = {{ (x:int,y:double,z:double) | x .in( [1..4)] ) |> y .in( [0.0,1.0] ) ^! 0.5 |> z .in( f(r.PI,x) ) }}

x = {{ (x:int,y:double,z:double) | x .in( [1..4] ) |> y .in( [0.0,1.0] ) ^! 0.5 |> z .in( f(r.PI) ) }}


/// return an array -> no duplicates
y = [{ (x:int,y:double,z:double) | x .in( [1..4] ) |> y .in( [0.0,1.0] ) ^! 0.5 |> z .in( f(r.PI,x) ) }]

/// return an array -> no restrictions on generation
z = [[ (x:int,y:double,z:double) | x .in( [1..4] ) |> y .in( [0.0,1.0] ) ^! 0.5 |> z .in( f(r.PI,x) ) ]]

/// return a list -> no restrictions on generation
L = ([ (x:int,y:double,z:double) | x .in( [1..4] ) |> y .in( [0.0,1.0] ) ^! 0.5 |> z .in( f(r.PI,x) ) ])

/// return a list -> no duplicates
L = ({ (x:int,y:double,z:double) | x .in( [1..4] ) |> y .in( [0.0,1.0] ) ^! 0.5 |> z .in( f(r.PI,x) ) })



// Tripples  :: inferred types from generator expressions.
x = {{ (x,y,z) | x .in( [1..4] ) |> y .in( [0.0,1.0] ) ^! 0.5 |> z .in( g(r.PI,x) ) }}


// Tripples  :: explicit types converting generator expressions except where there is a star, var bindings optional
x = {{ ( *,double,double ) | x .in( [1..4] ) |> [0.0,1.0] ^! 0.5 |> f(r.PI,x) }}


// Tripples  :: explicit types converting generator expressions except where there is a star, var bindings optional
x = {{ ( *,*,* ) | i .in([1..4]) |> [0.0,1.0] ^! delta(i) |> f_hat(r.PI) }}

x = {{ ( * ) | i .in([1..4]) |> [0.0,1.0] ^! delta(i) |> f_hat(r.PI) }}

/// making maps....
x = { k1 => v1, k2 => v2, k3 => v3 }

mm = {{ ( x,y => value ) | x .in(`{Names}) |> [1.0,100] ^| 5.0 |>  value .from(`{Streets}) |\random(#{Streets}) }}


mm = {{ ( x => value ) | x .in(`{Names}) |>  value .from(`{Streets} |\ random(#{Streets})) }}

mm = {{ ( * ) | `{Names} |>  .from(`{Streets} |\ random(#{Streets})) }}

mm = {{ ( * ) | `{Names} |>  `{Streets}  }}

/// making hashes....  with specific or default hash functions.
x = {# k1 => v1, k2 => v2, k3 => v3 #}
x = {# .l(k1){ my_hash(k1) } # k1 => v1, k2 => v2, k3 => v3 #}

hh = {# .l(k1){ my_hash(k1) } # ( k1 => value ) | {Names} |>  value .in(`{Streets}) #}   /// list streets

hh = {# ( * ) | {Names} |>  .from({Streets} |\ random(#{Streets})) #}  // default hash



// Pairs and singletons ... sort requirements  :: with explicit types, and with variable bindings
// note that the sort requirement is specified between % signs.

/// return a set -> no duplicates -- default sort
x = {{ (x:int:%- <= -%,y:double:%- > -%) | x .in([1..4]) |> y .in([0.0,1.0]) ^! 0.5  }}

x = {{ (x:%- <= -%) | x .in([1..4]) }}


/// return an array -> no duplicates
y = [{ (x:int:%- >= -%)| x .in([1..4]) }]

/// return an array -> no restrictions on generation
z = [[ (x:%- >= -%) | x .in([1..4]) ]]

/// return a list -> no restrictions on generation  -> order by vector dot product, *
l = ([ (x:R{N}:%- * -%) | x .in(`{vectors()}  ])    /// vectors producing elements in R{N}

/// return a list -> no duplicates  -- but, it doesn't really need to check for them. And, this is a reverse list.
l = ({ (x:%- >= -%) | x .in([1..100]) })



// Make a matrix

mM = [[ (x:double) | x = f(t,*,*) .to(N) .to(M) ]]   /// t is an external parameter such as time...

// Make a tensor


t_3 = [[ (x:double) | x = f(t,*,*,*) .to(M) .to(N) .to(O) ]]   /// t is an external parameter such as time...

t_n = [[ (x:double) | x = f(t,...) .to(o) .by(n) ]]   /// t is an external parameter such as time...


// specify a matrix as having a particular shape.

[<m,n>[ (x:double) | x = f(t,*,*) .to(N) .to(M) ] ]

// Or you can do this with an array generator.

[<m,n>[ (x:double) | x = f(t,*) .to(N*M)  ]]

[<1,n>[ (x:double) | x = f(t,*) .to(N)  ]]  // A column

[<n,1>[ (x:double) | x = f(t,*) .to(N)  ]]  // A row
[[ (x:double) | x = f(t,*) .to(N) ]]  // A row
```

So far, most of the generators shown, make new data by calling a function.
So, you would expect that a generator could take an existing container, and
move things into another container. So, one way to approach this would be
to make a generalization of the range specifier. So far, the range
specifier has been [l..u], or lower to upper with some step specified after `^!`.

So, borrowing from Haskell, you might see a form (x:xs), which means the first element followed by
the rest of the list. We can use that like a range. And, we can add another symbol, `&` to indicate
that a the program should walk down the list with a reference pointer, as such (x:&xs).
So, we can think of this as a value with the rest of the list pointed to by xs.

Now, we can write the following kind of generator:

```
	[ c | .in( c : &xs ) ]
```

Now, we can think of some forms that allow for use of the generated elements. More ways of making arrays,
and more special keyword uses for looping. .for might have already been mentioned. And, we can add
keywords for accumulating sums and multipliers: .SIG, .PI, which look like similar symbols found in mathematics.

Here some examples (notice the use of functional composition):

```
	last_val = .for( [ c | .in ( c : &x ) ] ) {
		f.*(g)(c)
	}

	sum = .SIG( [ c | .in ( c : &x ) ] ) {
		f.*(g)(c)
	}

	product = .PI( [ c | .in ( c : &x ) ] ) {
		f.*(g)(c)
	}

// And, here is a new matrix with the list generator being put to use.

	[<m,n>[ c | .in (c:xs) ]]

```

Short curts for these generators
---------------------------------

So, some generators have become popular in Java and C++. These are the pattern specification from Haskell, c : rest.
That's very much like what we just saw for specifying the generator in the .for context. But, it is specialized.
So, we might allow that as well:


```
	last_val = .for( c : &x ) {
		f.*(g)(c)
	}

	sum = .SIG( c : &x ) {
		f.*(g)(c)
	}

	product = .PI(  c : &x  ) {
		f.*(g)(c)
	}
```


Don't forget the way a curried function object can introduce the loop:


```
	last_val = f.*(g)(@).for( : &x );

	sum = f.*(g)(@).SIG( : &x );

	product = f.*(g)(@).PI( : &x );


```

Now, seeing this, we might want to make a variable hold the function object. So, we might have a little program like the following:


```

	Function compost = f.*(g)(@);
	
	last_val = compost.for( : &x );

	sum = compost.SIG( : &x );

	product = compost.PI( : &x );


```

Wouldn't it be nice to capture the sum and the product at the same time? Why not do the following?


```

	Function compost = f.*(g)(@);

	.>>(last_val, sum, product) = compost.for.SIG.PI( : &x );


```

We can give that a little more thought later on. But, before departing this thought process, we might notice that the `.>>`
keyword looks liks a C++ stream operator. So, I want to think of it as a sink indicating keyword. But, as it stands
out syntactically, we might allow it to be a right side sink indicator as such:

```
	Function compost = f.*(g)(@);

	compost.for.SIG.PI( : &x ) .>> (last_val, sum, product);
```

So, this can be looked at as syntax choice indicating a default right sink. But, if there is no left side to it, then
some value genartor is needed on the right side of an `=` sign. So, we might think like this, " what follows an `=` sign - up
to a key word, is a thing that makes a value, and that value needs to end up somewhere. So, put into a structurally consonant thing like
a variable or a sink. But, if you have some unattached value generator, let the value go into whatever is begging for a value
in the current context, such as a sink, perhaps."  So, the follwing might be acceptable as well, providing it is clear that
nothing is lef to the `=` sign. 

```
	= compost.for.SIG.PI( : &x ) .>> (last_val, sum, product);
```
Where as, the following:

```
	x = compost.for.SIG.PI( : &x ) .>> (last_val, sum, product);
```

Can at best sink the `x`. But, the sink is pointing at multiple values. So, does `x` get exploded? Or, do we call 
this an error? Perhaps the default would be to try to explode the `x` with the side affect of having the triple
stored within the `x` for a later use.

```

// Make a decision tree ...
// A recursive pattern...
```

