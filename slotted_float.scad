/********************************************************
 * Slotted Float - vsergeev
 * https://github.com/vsergeev/3d-slotted-float
 * CC-BY-4.0
 *
 * Release Notes
 *  * v1.0 - 06/20/2023
 *      * Initial release.
 ********************************************************/

/* [Basic] */

part = "both"; // [both, float, peg]

// in mm
float_xy_diameter = 20;

// in mm
float_z_length = 22.5;

/* [Advanced] */

// in mm, can be reduced to 0.1 for filaments with less expansion
float_xy_slot_width = 0.2;

// in mm, can be increased to 0.25 for less flexible filaments
float_peg_xy_clearance = 0;

// in mm
peg_xy_diameter = 5;

// in mm
peg_z_base_height = 3;

// in mm
peg_xy_base_lip = 1.5;

// in mm
peg_xy_bore_diameter = 1.5;

// peg length scale factor
peg_z_length_scale = 1.05;

// peg taper scale factor
peg_xy_taper_scale = 1.05;

/* [Hidden] */

$fn = 100;

/******************************************************************************/
/* 3D Extrusions */
/******************************************************************************/

module float() {
    cutoff = 0.15; /* 85% */

    difference() {
        /* Ellipsoid */
        intersection() {
            translate([0, 0, (float_z_length * (1 - cutoff)) / 2])
                scale([1, 1, (float_z_length * (1 + cutoff)) / float_xy_diameter])
                    sphere(d=float_xy_diameter);
            cylinder(h=float_z_length * 2, d=float_xy_diameter * 2);
        }

        /* Bore */
        translate([0, 0, -float_z_length / 4])
            cylinder(h=float_z_length * 2, d=peg_xy_diameter + float_peg_xy_clearance);

        /* Line Slot */
        translate([0, -float_xy_slot_width / 2, -float_z_length / 4])
            cube([float_xy_diameter / 1.5, float_xy_slot_width, float_z_length * 2]);
    }
}

module peg() {
    difference() {
        union() {
            /* Base */
            translate([0, 0, peg_z_length_scale * float_z_length])
                cylinder(h=peg_z_base_height, d=peg_xy_taper_scale * peg_xy_diameter + peg_xy_base_lip);

            /* Tapered Peg */
            cylinder(h=peg_z_length_scale * float_z_length, d1=peg_xy_diameter, d2=peg_xy_taper_scale * peg_xy_diameter);
        }

        /* Bore */
        translate([0, 0, -peg_z_length_scale * float_z_length / 4])
            cylinder(h=peg_z_length_scale * float_z_length * 2, d=peg_xy_bore_diameter);
    }
}

/******************************************************************************/
/* Top-level */
/******************************************************************************/

if (part == "both") {
    color("yellow")
        float();
    translate([0, 0, -(peg_z_length_scale - 1) * float_z_length])
        color("grey")
            peg();
} else if (part == "float") {
    color("yellow")
        float();
} else if (part == "peg") {
    color("grey")
        peg();
}
