#!/usr/bin/env python
import svglib
from svglib.svglib import svg2rlg
from reportlab.graphics import renderPDF, renderPM
import sys
argv = sys.argv[1:]

name=argv[0]
drawing = svg2rlg(name+".svg")
renderPDF.drawToFile(drawing, name+".pdf")
