== Color (`color space` and `channel width`) <header-color>
May define channels as
- `FIXED` have always the same length or
- `DYNAMIC` have length of channel width.

The first digit defines the color space and the second one a variation.

The format supports 5 distinct color spaces with 3 variations each.

=== Color spaces
- $0x_16$ Gray scale
- $1x_16$ RGB
- $2x_16$ CMY
- $3x_16$ HSV
- $4x_16$ YCbCr

=== Variations 

- $x 0_16$ no transparency
- $x 1_16$ fixed transparency
- $x 2_16$ dynamic transparency

#pagebreak()
=== Constraints

minimum: $1$ Bit per channel

maximum: $16$ Bit per channel

#figure(
  caption: "Color spaces",
  table(
    columns: (1fr, 1fr, 1fr),
    align: (x, y) => 
    if x == 2 { left + horizon } else { horizon },
    table.header("Code", "Color space", "Channels"),
    [$00_16$], "Gray Scale", [- `G`, `DYNAMIC`, gray],
    [$01_16$], "Transparenten Gray Scale", [
      - `G`, `DYNAMIC`, gray
      - `a`, `FIXED(1)`, transparent
    ],
    [$02_16$], "Dynamic Transparent Gray Scale", [
      - `G`, `DYNAMIC`, gray
      - `a`, `DYNAMIC`, transparent
    ],
    [$10_16$], "RGB", [
      - `R`, `DYNAMIC`, red
      - `G`, `DYNAMIC`, green
      - `B`, `DYNAMIC`, blue
    ],
    [$11_16$], "RGBa", [
      - `R`, `DYNAMIC`, red
      - `G`, `DYNAMIC`, green
      - `B`, `DYNAMIC`, blue
      - `a`, `FIXED` (1), transparent
    ],
    [$12_16$], "Dynamic RGBa", [
      - `R`, `DYNAMIC`, red
      - `G`, `DYNAMIC`, green
      - `B`, `DYNAMIC`, blue
      - `a`, `DYNAMIC`, transparent
    ],
    [$20_16$], "CMY", [
      - `C`, `DYNAMIC`, cyan
      - `M`, `DYNAMIC`, magenta
      - `Y`, `DYNAMIC`, yellow
    ],
    [$21_16$], "CMYa", [
      - `C`, `DYNAMIC`, cyan
      - `M`, `DYNAMIC`, magenta
      - `Y`, `DYNAMIC`, yellow
      - `a`, `FIXED` (1), transparent
    ],
    [$22_16$], "Dynamic CMYa", [
      - `C`, `DYNAMIC`, cyan
      - `M`, `DYNAMIC`, magenta
      - `Y`, `DYNAMIC`, yellow
      - `a`, `DYNAMIC`, transparent
    ],  
    [$30_16$], "HSV", [
      - `H`, `DYNAMIC`, hue
      - `S`, `DYNAMIC`, saturation
      - `V`, `DYNAMIC`, value
    ],
    [$31_16$], "HSVa", [
      - `H`, `DYNAMIC`, hue
      - `S`, `DYNAMIC`, saturation
      - `V`, `DYNAMIC`, value
      - `a`, `FIXED` (1), transparent
    ],
    [$32_16$], "Dynamic HSVa", [
      - `H`, `DYNAMIC`, hue
      - `S`, `DYNAMIC`, saturation
      - `V`, `DYNAMIC`, value
      - `a`, `DYNAMIC`, transparent
    ],
    [$40_16$], "YCbCr", [
      - `Y`, `DYNAMIC`, lumina
      - `Cb`, `DYNAMIC`, Chroma blue
      - `Cr`, `DYNAMIC`, Chroma red
    ],
    [$41_16$], "YCbCra", [
      - `Y`, `DYNAMIC`, lumina
      - `Cb`, `DYNAMIC`, Chroma blue
      - `Cr`, `DYNAMIC`, Chroma red
      - `a`, `FIXED` (1), transparent
    ],
    [$42_16$], "Dynamic YCbCra", [
      - `Y`, `DYNAMIC`, lumina
      - `Cb`, `DYNAMIC`, Chroma blue
      - `Cr`, `DYNAMIC`, Chroma red
      - `a`, `DYNAMIC`, transparent
    ],
  )
)