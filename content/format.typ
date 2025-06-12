#import "@preview/bytefield:0.0.7": *
#import "../lib/config.typ": colors, bytefield-lighten

= Image Format <format>

#figure(
  caption: "Image Format",
  kind: "bytefield",
  supplement: "Bytefield",
  bytefield(
    bitheader("bytes"),
    byte(fill: colors.version.color.lighten(bytefield-lighten))[Version],
    bytes(9, fill: colors.header.color.lighten(bytefield-lighten))[Header],
    bytes(8, fill: colors.clut.color.lighten(bytefield-lighten))[Color Lookup Table],
    bytes(1, "Padding", fill: colors.padding.color.lighten(bytefield-lighten)),
    bytes(10, fill: colors.metadata.color.lighten(bytefield-lighten))[Metadata],
    bytes(1, "Padding", fill: colors.padding.color.lighten(bytefield-lighten)),
    bytes(17, fill: colors.imagedata.color.lighten(bytefield-lighten))[Image Data],
    bytes(1, "Padding", fill: colors.padding.color.lighten(bytefield-lighten))
  )
)

== File Structure
The file consists of multiple segments. Only the Version (1 byte) and Header (9 bytes) have fixed sizes; all other sections are variable in length, depending on the image’s configuration (e.g., color mode, metadata, compression).

All fields are byte-aligned and stored as whole bytes. Even for dynamically sized segments, the format guarantees that no bit-level packing occurs. Padding is used as needed to ensure alignment between sections.

=== General Layout:
+ *Version (1 byte)*: Indicates the format version.
+ *Header (9 bytes)*: Contains configuration data such as color space, transparency mode, and compression type.
+ *Color Lookup Table (CLUT) (variable size)*: A palette for efficient color storage.
+ *Padding (as needed)*: Ensures proper alignment before the next section.
+ *Metadata (variable size)*: Contains optional fields like author, creation date, and version info.
+ *Padding (as needed)*: Alignment padding if required.
+ *Image Data (variable size)*: Raw or compressed pixel data.
+ *Final Padding (as needed)*: Ensures the full structure is byte-aligned.


== Size
The format supports images with up to 65,535 pixels in both width and height.

== Colors
Five color spaces are available, each with three transparency modes.

=== Supported Color Spaces
- Grayscale
- RGB
- CMY
- HSV
- YCbCr

=== Variations
- *no transparency*: Standard image without alpha channel
- *fixed transparency*: Single alpha value for the entire image
- *dynamic transparency*: Per-pixel alpha values for full control

== Animation
Animated images can contain up to 255 frames. The frame rate supports a wide range — from 1 frame every 127 seconds up to 127 frames per second — resulting in 254 unique timing options for smooth or slow animations.

== Compression
Colors are compressed using a Color Lookup Table (CLUT). Additional compression may be applied to the image data depending on the settings in the header. The available options are:
- no additional compression
- Run-length encoding (RLE) on image data for further size reduction

== Metadata
Metadata keys (e.g., "author", "creation date", "version") are restricted to non-control ASCII characters. Metadata values, on the other hand, may include any valid UTF-8 characters, allowing for a wide range of localized or detailed information.