include <pin_header/files/pin_header.scad>


module hc_sr501_pcb_mounting_holes(){
    $fn = 100;
    translate([0,0,-1]) cylinder(r=1,h=3);
}

module hc_sr501_pcb() {
    color("green") {
        difference() {
            cube([33, 24, 1]);
            {
                translate([2,12,0]) hc_sr501_pcb_mounting_holes();
                translate([31,12,0]) hc_sr501_pcb_mounting_holes();
            }
        }
    }
}

module hc_sr501_pir() {
    $fn = 200;
    color([0.8,0.8,0.8,0.98]) {
        cube([23,23,3]);
        translate([23/2,23/2,3]) 
        difference () {
            sphere(23/2);
            translate([-23/2,-23/2,-23]) cube(23);
        }
        translate([0.5,3,-3]) cylinder(r=0.5,h=3);
        translate([22.5,3,-3]) cylinder(r=0.5,h=3);
        translate([0.5,20,-3]) cylinder(r=0.5,h=3);
        translate([22.5,20,-3]) cylinder(r=0.5,h=3);
    }
}

module hc_sr501_capacitor() {
    $fn = 100;
    color("MidnightBlue") {
        translate([2,2,0]) cylinder(r=2, h=8);
    }
    color("Silver") {
        translate([1,2,-3]) cylinder(r=0.25, h=3);
        translate([3,2,-3]) cylinder(r=0.25, h=3);
    }
}

module hc_sr501_module() {
    hc_sr501_pcb();
    translate([5, 0.5, 1]) hc_sr501_pir();
 
    translate([16.5,21.5,2.3]) rotate([180,0,0]) header(1,3,2.54);
 
    translate([1,5,0]) rotate([180,0,0]) hc_sr501_capacitor();
    translate([1+22,5,0]) rotate([180,0,0]) hc_sr501_capacitor();
    translate([28,5+18,0]) rotate([180,0,0]) hc_sr501_capacitor();
    translate([1,5+18,0]) rotate([180,0,0]) hc_sr501_capacitor();
}
