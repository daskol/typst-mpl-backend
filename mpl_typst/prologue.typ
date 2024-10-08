/**
 * This is autogenerated Typst markup from a scene description created by
 * matplotlib in Python.
 *
 * Timestamp: {{ date }}.
 */

{{ preamble }}

#import "@preview/based:0.1.0": base64

#let draw-text(dx: 0pt, dy: 0pt, size: 10pt, alignment: center + horizon, baseline: false, angle: 0deg, body) = style(styles => {
  // In order to align a text properly, we need to configure bounding box of a
  // text.
  let top-edge = "cap-height"
  let bot-edge = "bounds"
  let valign = alignment.y;
  if baseline and valign == bottom {
    bot-edge = "baseline"
  }
  if baseline and valign == horizon {
    bot-edge = "baseline"
  }

  // Measure shape of text block.
  let content = text(size: size, top-edge: top-edge, bottom-edge: bot-edge, body)
  let shape = measure(content, styles)

  // Adjust horizontal position.
  let px = dx
  if alignment.x == left {
    // Do nothing.
  } else if alignment.x == center {
    px -= shape.width / 2
  } else if alignment.x == right {
    px -= shape.width
  }

  // Adjust vertical position.
  let py = dy
  if valign == top {
    // Do nothing.
  } else if valign == horizon {
    py -= shape.height / 2
  } else if valign == bottom {
    py -= shape.height
  }

  // Rotate text block if required. Note, that matplotlib supports two modes
  // for rotation while Typst allows to perform only the second one.
  if angle != 0deg {
    content = rotate(angle, origin: alignment, content)
  }

  // Finaly, place a content block in calculated displacement.
  place(dx: px, dy: py, content)
})
