include <libraries/raspberry_pi3_model_b.scad>
include <libraries/hc-sr501.scad>
include <libraries/brass_spacer.scad>
include <libraries/breadboard_63.scad>
include <libraries/elegoo_power_board.scad>

perspex_only = 0;
show_breadboard = 1;
show_hc_sr501 = 1;
show_rp3b = 1;

module perspex() {
    color([0,1,1,1]) cube([297,211,2]);
}

module rp3b() {
    translate([0,85,0]) rotate([0,0,-90]) {
        translate([1.5,1.5,22]) rp3b_board();
        
        brass_male_female_spacer_20mm(5, 5, 2.05);
        screw_2mm(5, 5, 24.1);

        brass_male_female_spacer_20mm(5, 5+49, 2.05);
        screw_2mm(5, 5+49, 24.1);
        
        brass_male_female_spacer_20mm(63, 5, 2.05);
        screw_2mm(63, 5, 24.1);
        
        brass_male_female_spacer_20mm(63, 5+49, 2.05);
        screw_2mm(63, 5+49, 24.1);
    }
}

module hc_sr501() {
    translate([58,-3,0]) rotate([0,0,0]) {
        translate([1.5,1.5,22]) hc_sr501_module();
        brass_male_female_spacer_20mm(3.5, 13.5, 2.05);
        screw_2mm(3.5, 13.5, 23.7);
        brass_male_female_spacer_20mm(3.5+29, 13.5, 2.05);
        screw_2mm(3.5+29, 13.5, 23.7);
    }
}

module breadboard() {
    translate([152,0,2]) rotate([0,0,90]) breadboard_63();
}

if(perspex_only == 1) {
    difference() {
        perspex();
        rp3b();
        hc_sr501();
    }
} else {
    perspex();
    if (show_rp3b == 1) {rp3b();}
    if (show_hc_sr501 == 1) {hc_sr501();}
    if (show_breadboard == 1) {
        breadboard();
        translate([97.5,0.3,13.8]) elegoo_power_board();
    }       
}