
Annotated C++ Template Parameter Packs
======================================

This document explores the consequences of extending variadic templates in C++
through optional annotation of parameter packs. This would allow for packs to
be declared with "interval/ranged", "determined/fixed" semantics that can be
use coherently with similar optional expansion syntax as well as "individual
access as "individual access" for types contained within a template parameter
pack by their index ordinal.

The most generic form in their declaration is: ...T{N,M}[K], where T is the
parameter pack and N,M are integral constant expressions for interval endpoints
while K is a "pattern" factor. They are engineered to graciously devolve into
parameter packs as currently defined, predetermined size packs or even single
parameters depending on explicit programmer intent.

They were originally announced in the following link at the isocpp.org
std-proposals mailing list as a working draft:

https://groups.google.com/a/isocpp.org/forum/#!topic/std-proposals/qIs0Ws7WdwA

This is not a complete work yet. I am periodically releasing updated pdf files
of its current status in good will, for the sake of fruitful discussions on the
subject. My intention is to make a proper proposal out of it and submit it to
the C++ committee. Some of these semantics can be implemented in library form
with some precautions.

Full details at the project website at: http://atpp.irrequietus.eu. The only
repository the draft is located for tracking real-time changes, can be found in
my github account at: https://github.com/irrequietus/atpp

Unless otherwise specified, all content is subject to CC BY-NC-ND 4.0. See the
'license.txt' file for details.

