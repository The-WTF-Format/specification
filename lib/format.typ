#import "@preview/unify:0.7.1"

#import "config.typ": *

#let format(body) = {
  set par(justify: true)

  show raw.where(block: false): (body) => box(
    fill: silver, radius: 5pt, 
    inset: (x: 0.25em, y: 0.25em),
    baseline: 0.25em,
    body
  )

  show table.cell.where(y: 0): set text(weight: "extrabold")
  show figure: set block(breakable: true)

  show figure.where(kind: "bytefield"): set figure.caption(position: bottom)
    
  body
}

#let content-format(body) = {
  counter(page).update(1)
  
  set page(
    numbering: "1/1",
    footer: context {
      line(length: 100%, stroke: 0.5pt)
    
      authors.join(", ", last: " and ")      
      h(1fr)
      counter(page).display("1/1", both: true)
    }
  )

  set heading(numbering: "1.")
  
  show heading.where(level: 1): (body) => {
    pagebreak()

    let color = false

    for current in colors.values() {
      if current.plain == body.body.text {
        color = current.color
      }
    }

    if color == false {
      body
    } else {
      text(fill: color, body)
    }
  }
  
  body
}

#let appendix-format(body) = {
  set heading(numbering: "A.")
  
  show heading.where(level: 1): (body) => {
    show pagebreak: none
    body
  }
  
  body
}

#let num = unify.num.with(thousandsep: "space")