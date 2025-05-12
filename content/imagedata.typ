#import "@preview/bytefield:0.0.7": *
#import "../lib/config.typ": *

= Image Data <image-data>
An image consists of $f dot w dot h$ pixels, where 
- $f$ is the number of frames (see @header-animation) and
- $w$ and $h$ are the width and the height of the image (see @header-size).

The pixels are stored in a chain one after another,
starting with the top left pixel of the first frame,
going from left to right and top to bottom.

== Example pixel positions
Let $f = 3, w = 5 "and" h = 3$, then the pixels would be order as follows:

#columns(3, {  
  show table.cell.where(y: 0): set text(weight: "medium")

  figure(
    caption: "Example Frame 1",
    table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "1")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "2")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "3")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "4")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "5")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "6")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "7")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "8")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "9")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "10")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "11")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "12")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "13")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "14")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "15")),
    ),
  )

  colbreak()
  figure(
    caption: "Example Frame 2",
    table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "16")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "17")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "18")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "19")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "20")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "21")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "22")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "23")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "24")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "25")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "26")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "27")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "28")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "29")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "30")),
    ),
  )
  
  colbreak()
  figure(
    caption: "Example Frame 3",
    table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "31")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "32")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "33")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "34")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "35")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "36")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "37")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "38")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "39")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "40")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "41")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "42")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "43")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "44")),
      square(width: 100%, inset: 0pt, stroke: none, align(center + horizon, "45")),
    ),
  )
})

== Pixel data
Each pixel is a combination of a _3 bit_ pixel type and the actual pixel data.
There are the following pixel types:

#figure(
  caption: "Pixel types",
  table(
    columns: (1fr, 1fr),
    table.header("Code", "Type"),
    $000_2$, [Color entry],
    $001_2$, [Copy by location],
    $010_2$, [Copy by frame],
    $011_2$, [Copy by frame and location],
    $100_2$, [Copy previous location],
    $101_2$, [Copy previous frame],
    $110_2$, [Color lookup table Entry],
    $111_2$, [_Currently not used_],
  ) 
)

=== Color entry
A color entry consists of an actual color entry.

The length $l$ of the entry (in bits) is $l = w dot d + s $
where $w$ is the channel width,
$d$ is the number of dynamic channels defined by the color space and
$s$ is the number of fixed channels defined by the color space (see @header-color).

The single channel entries are given in the same order as specified in the specification.

#pagebreak()
=== Copy entry
A copy entry ($001_2$ - $101_2$) copies the color entry of another pixel.
That pixel may be of any type. 
However, the pixel entry must at some point be a "Color entry" ($000_2$).

A copy by frame (and location) is followed by the frame.
A copy by frame and location is followed by the x and y coordinates afterward.
A copy by location is directly followed by the x and y coordinates.

The number of bits used to store the frame, x or y data are calculated using $ceil(log_2(a))$ where $a$ is the maximum value.

#figure(
  caption: "Image size to bits",
  table(
    columns: (1fr, 1fr),
    align: center + horizon,
    table.header("Maximum value", "Bits"),
    [1], [0],
    [2], [1],
    [3,4], [2],
    [5-8], [3],
    [9-16], [4],
    sym.dots.v, sym.dots.v,
  )
)

The copy previous location copies the pixel directly stored before this pixel in binary.
If this pixel is the first pixel of a frame, the image is considered broken.

The copy previous frame copies the pixel at the same position as the current pixel from the previous frame.
If this pixel is in the first frame, the image is considered broken.

=== Color lookup table entry
A color lookup table entry type is followed by the exact number of bits for a clut entry.
This indicates the clut entry that should be used.
See @clut.