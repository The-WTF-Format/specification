#import "@preview/bytefield:0.0.7": *
#import "../lib/config.typ": *
#import "../lib/format.typ": num

= Metadata <metadata>

#figure(
  caption: "Metadata",
  kind: "bytefield",
  supplement: "Bytefield",
  bytefield(
    bitheader("bytes"),
    bits(21, "Key"),
    bits(3, "Padding"),
    bytes(5, "Value"),
    bits(21, "Key"),
    bits(3, "Padding"),
    bytes(5, "Value"),
    bytes(4, "...")
  )
)

The metadata section stores descriptive information as a sequence of key-value pairs. This allows embedding of human-readable or machine-readable information, such as author name, creation date, software version, etc.

== Structure
- Metadata consists of alternating `key` and `value` entries.
- Each `key` is:
   - A string of 7-bit ASCII characters: a–z, A–Z, 0–9, -
   - Null-terminated ($0_16$)
   - Padded with bit with value $0$ to a full byte
- Each `value` is:
   - A UTF-8 encoded string
   - Null-terminated ($0_16$)
- The sequence may be repeated for multiple key-value pairs.

== Termination
The metadata section is terminated by a single null byte $0_16$ representing an empty key, followed by a single bit of padding, with no corresponding value.

== Constraints
- `Keys` must not contain the NUL-character.
- `Values` may include any valid UTF-8 characters except the NUL-character.