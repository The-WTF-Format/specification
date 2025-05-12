#import "@preview/bytefield:0.0.7": *
#import "../lib/config.typ": *

= Version <version>

The first field holds a single byte describing the version number.
If this field holds a number a viewer or editor can't handle, the image cannot be opened.
If the version number is unknown, the image is broken.

Current version: $1$

Everything in this specification is only regarding the current version.