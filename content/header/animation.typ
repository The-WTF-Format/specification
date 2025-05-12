== Animation (`frames`, `t`, and `fps or spf`) <header-animation>
Images may be animated.
The animation is defined by an amount of frames, and a timing for the frames.

=== Field Names
- `frames`: the amount of frames the image has
- `t`: the unit of the following timing
- `fps or spf`: the timing of the frames

=== Data Format
`frames` is stored as an unsigned 8-bit integer.

`t` is stored as a 1-bit flag.
$0$ indicates, that the following value is the amount of frames that should be displayed per second (fps).
Therefore, a frame must stay $1/text("fps")$ seconds.
$1$ indicates, that the given value is the amount of seconds a frame should be displayed (spf).

`fps or spf` is stored as a unsigned 7-bit integer.

#pagebreak()
=== Constraints
==== `frames`
- minimum value: $1$
- maximum value: $255$ ($2^8 - 1$)

==== `t`
Must be $0$, if `frames` is $1$.

==== `fps or spf`
- exact value: $0$, if `frames` is $0$.
- minimum value: $1$, if `frames` $>= 1$
- maximum value: $127$ ($2^7 - 1$), if `frames` $>= 1$