#import "config.typ": authors

#place(center, dy: 30%)[
  #text(size: 25pt, weight: "extrabold", "The WTF-File format")

  Version 1.1
  
  by 
  #authors.map(it => strong(it)).join(", ", last: " and ")
]