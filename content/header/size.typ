#import "/lib/format.typ": num

== Size (`height` and `width`) <header-size>

The image size is defined using two fields: height and width. These fields specify the dimensions of the image in pixels.

=== Field Names
- `height`: number of pixels vertically
- `width`: number of pixels horizontally

=== Data Format
Both fields are stored as unsigned $16$-bit integers.

=== Constraints
- minimum value: $#num(1)$
- maximum value: $#num(65535)$ ($2^16 - 1$)