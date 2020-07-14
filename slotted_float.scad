/********************************************************
 * Slotted Float - vsergeev
 * https://github.com/vsergeev/3d-slotted-float
 * CC-BY-4.0
 *
 * Release Notes
 *  * v1.0 - FIXME
 *      * Initial release.
 ********************************************************/

/* [Basic] */

// in mm
float_diameter = 20;

// in mm
float_length = 22.5;

part = "both"; // [both, float, peg]

/* [Advanced] */

// in mm, can be reduced to 0.1 for filaments with less expansion
float_slot_width = 0.2;

// in mm, can be increased (e.g. 0.25) for less flexible filaments
peg_clearance = 0;

// in mm
peg_diameter = 5;

// in mm
peg_base_height = 3;

// in mm
peg_bore_diameter = 1.5;

/* [Hidden] */

$fn = 70;

module float(diameter, length) {
    cutoff = 0.15;

    difference() {
        /* 85% Ellipsoid */
        intersection() {
            translate([0, 0, (length * (1 - cutoff)) / 2])
                scale([1, 1, (length * (1 + cutoff)) / diameter])
                    sphere(d=diameter);
            cylinder(h=length * 2, d=diameter * 2);
        }
        /* Bore */
        translate([0, 0, -length / 4])
            cylinder(h=length * 2, d=peg_diameter + peg_clearance);
        /* Line Slot */
        translate([0, -float_slot_width / 2, -length / 4])
            cube([diameter / 1.5, float_slot_width, length * 2]);
    }
}

module peg(length) {
    length_scale = 1.05;
    diameter_min_scale = 1.00;
    diameter_max_scale = 1.05;
    base_diameter = diameter_max_scale * peg_diameter + 1.5;

    //translate([0, 0, -(length_scale - 1)*length])
        difference() {
            union() {
                /* Base */
                translate([0, 0, length * length_scale])
                    cylinder(h=peg_base_height, d=base_diameter);
                /* Tapered Peg */
                cylinder(h=length * length_scale, d1=diameter_min_scale * peg_diameter, d2=diameter_max_scale * peg_diameter);
            }
            /* Bore */
            translate([0, 0, -(length * length_scale) / 4])
                cylinder(h=length * length_scale * 2, d=peg_bore_diameter);
        }
}

if (part == "both" || part == "float")
    color("yellow")
        float(float_diameter, float_length);

if (part == "both" || part == "peg")
    color("grey")
        peg(float_length);
