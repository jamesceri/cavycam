

module pcb() {
    color("green") hull() {
        cube([85, 56, 1.6]);
        translate([0, 0, 0]) cylinder(r=3, h=1.6);
        translate([0, 56, 0]) cylinder(r=3, h=1.6);
        translate([85, 0, 0]) cylinder(r=3, h=1.6);
        translate([85, 56, 0]) cylinder(r=3, h=1.6);
    }

    // copper for mounting holes
    translate([3.5, 3.5, -0.2]) cylinder(r=3, h=2);
    translate([3.5, 3.5+49, -0.2]) cylinder(r=3, h=2);
    translate([3.5 + 58, 3.5+49, -0.2]) cylinder(r=3, h=2);
    translate([3.5 + 58, 3.5, -0.2]) cylinder(r=3, h=2);
}

module mounting_holes() {
    translate([3.5, 3.5, -1.6]) cylinder(r=2.75 / 2, h=4.8);
    translate([3.5, 3.5+49, -1.6]) cylinder(r=2.75 / 2, h=4.8);
    translate([3.5 + 58, 3.5+49, -1.6]) cylinder(r=2.75 / 2, h=4.8);
    translate([3.5 + 58, 3.5, -1.6]) cylinder(r=2.75 / 2, h=4.8);
}

module board() {
    $fn = 50;
    difference() {
        pcb();
        mounting_holes();
    }
}

board();