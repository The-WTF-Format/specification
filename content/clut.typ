#import "@preview/bytefield:0.0.7": *
#import "../lib/config.typ": *

= Color Lookup Table <clut>

#figure(
  caption: "Color Lookup Table",
  kind: "bytefield",
  supplement: "Bytefield",
  bytefield(
    bitheader("bytes"),
    byte("Code length"),
    byte("Code"),
    byte("Color"),
    byte("Code"),
    byte("Color"),
    byte("Code"),
    byte("Color"),
    bits(21, "..."),
    byte("Code"),
    byte("Color"),
    bits(3, "Padding"),
    )
)

Map of Code to Color (Channels \* Channel width),
ended by code only containing $0$.


== Structure

- `Code length`: Amount of bits used for the following code. Code length depends on the amount of colors in the picture. It's mentioned in the first byte.
- `Code`: Sequence of bits representing the subsequent color.
- `Color`: Color in set color space with set color width.
- `Padding`: Padded with bits with value $0$ to full byte.

=== Example Color Look-Up Table

- Code length = $00000011_2$
- Colors in set color space
- 1 byte colors in hex in he example

#figure(
  caption: "Example Color Lookup Table",
  table(
    columns: (1fr, 1fr),
    table.header("Code", "Color"),
    $001_2$, [004078],
    $010_2$, [0080FF],
    $011_2$, [A0B312],
    $100_2$, [F31818],
    $101_2$, [929292],
    $110_2$, [C4C4C4],
    $111_2$, [FFFFFF],
    $000_2$, [_Termination_],
  )
)

== Constraints

min. entries: $1$
max. entries: $2^255$