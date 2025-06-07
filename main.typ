#import "lib/format.typ": *

#show: format

#include "lib/cover_sheet.typ"

#show: content-format

#outline()

#include "content/introduction.typ"
#include "content/format.typ"
#include "content/version.typ"
#include "content/header/header.typ"
#include "content/clut.typ"
#include "content/metadata.typ"
#include "content/imagedata.typ"

#show: appendix-format

#pagebreak()
#outline(title: "List of tables", target: figure.where(kind: table))
#outline(title: "List of bytefields", target: figure.where(kind: "bytefield"))