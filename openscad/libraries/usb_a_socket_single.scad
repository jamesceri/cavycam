module usb_a_socket_single() {
    color("Silver") {
        difference() {
            cube([13.2,13.5,7]);
            translate([0.5,0.5,0.5]) cube([13.2,12.5,6]);
        }
    }

    color("White") {
        translate([13.2-11,1.4,4] ) cube([13.5 - 2.8,11,1.84]);
    }
}