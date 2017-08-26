include <pin_header/files/pin_header.scad>

module ethernet_connector() {
    difference() {
        color("Silver") cube([21,15.5,13.5]);
        translate([-0.1,1.6,4.5]) color("Grey") cube([11, 12.5, 7]);
        translate([-0.1,5,1]) color("Grey") cube([11, 5.5, 3.6]);
    }
    color("Green") translate([-0.5,1,1]) cube([2,3,1.5]);
    color("Yellow") translate([-0.5,11.5,1]) cube([2,3,1.5]);
}

module usb_connector() {
    difference(){
        color("Silver") cube([17, 12, 15]);
        translate([-0.1,0.5,9.5]) color("Grey") cube([5,11,5]);
        translate([-0.1,0.5,0.5]) color("Grey") cube([5,11,5]);
    }
}

module audio_connector() {
    difference() {
        union() {
            color("DimGrey") cube([12,7,6]);
            translate([-2.5,3.5,3]) rotate([0,90,0]) color("DimGrey") cylinder(r=3, h=3);
        }
        translate([-2.6,3.5,3])rotate([0,90,0]) color("DimGrey") cylinder(r=2, h=12);
    }
}

module hdmi_connector() {
    color("Silver") cube([12,15,6]);
}

module power_connector() {
    color("Silver") cube([6,8,3]);
}

module sdcard_connector() {
    color("DimGrey") cube([12,15,1]);
}


module pcb() {
    color("green") hull() {
        translate([3,3,0]) cube([85-3 , 56-3, 1.6]);
        translate([3, 3, 0]) cylinder(r=3, h=1.6);
        translate([3, 56-3, 0]) cylinder(r=3, h=1.6);
        translate([85-3, 3, 0]) cylinder(r=3, h=1.6);
        translate([85-3, 56-3, 0]) cylinder(r=3, h=1.6);
    }

    // copper for mounting holes
    translate([3.5, 3.5, -0.2]) cylinder(r=3, h=2);
    translate([3.5, 3.5+49, -0.2]) cylinder(r=3, h=2);
    translate([3.5 + 58, 3.5+49, -0.2]) cylinder(r=3, h=2);
    translate([3.5 + 58, 3.5, -0.2]) cylinder(r=3, h=2);
}

module pcb_mounting_holes() {
    translate([3.5, 3.5, -1.6]) cylinder(r=2.75 / 2, h=4.8);
    translate([3.5, 3.5+49, -1.6]) cylinder(r=2.75 / 2, h=4.8);
    translate([3.5 + 58, 3.5+49, -1.6]) cylinder(r=2.75 / 2, h=4.8);
    translate([3.5 + 58, 3.5, -1.6]) cylinder(r=2.75 / 2, h=4.8);
}

module board() {
    $fn = 100;
    difference() { pcb(); pcb_mounting_holes(); }
    translate([87, 17.5, 1.6]) rotate(180) ethernet_connector();
    translate([87, 36, 1.6]) rotate(180) usb_connector();
    translate([87, 54, 1.6]) rotate(180) usb_connector();
    translate([57,0,1.6]) rotate([0,0,90]) audio_connector();
    translate([38,-2,1.6]) rotate([0,0,90]) hdmi_connector();
    translate([14,-2,1.6]) rotate([0,0,90]) power_connector();
    translate([-2,35,-1]) rotate([0,0,-90]) sdcard_connector();
    translate([32.5,52.5,-0.6]) header(2,20,2.54);
}
