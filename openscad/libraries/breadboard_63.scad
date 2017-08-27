
module breadboard_63_base() {
    color([0.9,0.9,0.9,1]) {
        difference() {
            cube([165,54,9]);
            translate([-0.5,26.5,6]) cube([166,2,3.1]);
            translate([-0.5,9.54,8.6]) cube([166,0.4,0.5]);
            translate([-0.5,44.54,8.6]) cube([166,0.4,0.5]);
        }
    }
}

module breadboard_63_holes() {
    hole_size = 2;
    offset_x = 3;
    offset_y = [12.54,30.54];
    offset_z = 9-hole_size + 0.1;
    pitch = 2.54;

    // main holes
    color([0.9,0.9,0.9,1]) {
        for (a=[0:1]) {
            for (x=[0:62]) {
                for (y=[0:4]) {
                    translate([offset_x + (pitch * x), offset_y[a] + (pitch * y), offset_z])
                    cube(hole_size);
                }
            }
        }
    }

    // power holes
    offset_y2 = [2.54,47.54];

    // main holes
    color([0.9,0.9,0.9,1]) {
        for (a=[0:1]) {
            for (x=[2,3,4,5,6,8,9,10,11,12,14,15,16,17,18,20,21,22,23,24,26,27,28,29,30,32,33,34,35,36,38,39,40,41,42,44,45,46,47,48,50,51,52,53,54,56,57,58,59,60]) {
                for (y=[0:1]) {
                    translate([offset_x + (pitch * x), offset_y2[a] + (pitch * y), offset_z])
                    cube(hole_size);
                }
            }
        }
    }

    
}

module breadboard_63() {
    difference() {
        breadboard_63_base();
        breadboard_63_holes();
    }
    color("Red") translate([6.54,7.54,9-0.3]) square([152,0.5]);
    color("Red") translate([6.54,52.54,9-0.3]) square([152,0.5]);
    color("Blue") translate([6.54,1.54,9-0.3]) square([152,0.5]);
    color("Blue") translate([6.54,45.54,9-0.3]) square([152,0.5]);

    letters = ["a","b","c","d","e","","","f","g","h","i","j"];
    color("Black") {
        for(a=[0:11]) {
            translate([0.5,42.54 - (2.54 * a),9]) rotate([0,0,-90]) scale(0.10) text(letters[a]);
            translate([163,42.54 - (2.54 * a),9]) rotate([0,0,-90]) scale(0.10) text(letters[a]);
        }
    }
}
