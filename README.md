# Parametric Slotted Float

<table>
<tr>
<td><a href="images/photo1.jpg"><img src="images/photo1.thumb.jpg" alt="Photo 1"/></a></td>
<td><a href="images/photo2.jpg"><img src="images/photo2.thumb.jpg" alt="Photo 2"/></a></td>
</tr>
<tr>
<td><a href="images/rendering.png"><img src="images/rendering.thumb.png" alt="Rendering 1"/></a></td>
<td><a href="images/slicer.png"><img src="images/slicer.thumb.png" alt="Slicer"/></a></td>
</tr>
<tr>
<td><a href="images/fish1.jpg"><img src="images/fish1.thumb.jpg" alt="Fish 1"/></a></td>
<td><a href="images/fish2.jpg"><img src="images/fish2.thumb.jpg" alt="Fish 2"/></a></td>
</tr>
<tr>
<td><a href="images/fish3.jpg"><img src="images/fish3.thumb.jpg" alt="Fish 3"/></a></td>
</tr>
</table>

A parametric slotted float that can be used in both fixed and slip float configurations. Float is printed with TPU, using multiple perimeters for water tightness and low infill for buoyancy. Peg is printed with PLA+ or PETG. Made with OpenSCAD.

**Parameters:**

* `float_diameter` - diameter of float, default 20mm
* `float_length` - length of float, default 22.5mm
* `float_slot_width` - line slot width, default 0.2mm, can be reduced (e.g. 0.1) for filaments with less expansion
* `peg_clearance` - clearance in peg bore, default 0mm, can be increased (e.g 0.25) for less flexible filaments
* `peg_diameter` - diameter of peg, default 5mm
* `peg_base_height` - height of peg base, default 3mm

**Design:** [slotted_float.scad](slotted_float.scad)

**STLs:**

* [float_20x22.5mm.stl](stl/float_20x22.5mm.stl)
* [peg_22.5mm.stl](stl/peg_22.5mm.stl)

**Recommended Print Settings:**

* Float - Flexible TPU, 0.20mm layer height, 5% rectilinear infill, 4 top and 4 bottom horizontal layers, 3 perimeters, no supports (see slicer image above for internal visualization)
* Peg - PLA+ or PETG, 0.20mm layer height, 100% infill, no supports

**Thingiverse:** TBD

**License**: [![CC-BY](https://i.creativecommons.org/l/by/4.0/80x15.png)](http://creativecommons.org/licenses/by/4.0/)
