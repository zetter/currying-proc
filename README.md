CurryingProc
=============

Class that can curry procs. This is similar to the [`Proc#curry`](http://ruby-doc.org/core-2.0/Proc.html#method-i-curry) method in Ruby.

I have only considered `Proc`s with a positive [`Proc#arity`](http://ruby-doc.org/core-2.0/Proc.html#method-i-arity)- i.e. not ones that splat arguments.

This was implemented for [The Little Schemer book club](http://lanyrd.com/series/little-schemer-book-club/).
