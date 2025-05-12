#import "@preview/bytefield:0.0.7": *
#import "../../lib/config.typ": *

= Header <header>

The header stores some information used to decode the rest of the image.
Therefore, the header does not store actual information about the image data, 
just meta information for the image.

#figure(
  caption: "Header",
  kind: "bytefield",
  supplement: "Bytefield",
  bytefield(
    bitheader("bytes"),
    bytes(2, "height"),
    bytes(2, "width"),
    byte("color space"),
    byte("channel width"),
    byte("frames"),
    bit("t"),
    bits(7)[fps or spf],
  ) 
)

#include "size.typ"
#include "color.typ"
#include "animation.typ"
//#include "compression.typ"