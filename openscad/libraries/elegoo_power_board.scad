include <pin_header/files/pin_header.scad>
include <usb_a_socket_single.scad>
include <dc_socket.scad>


module elegoo_power_board_pcb() {
    difference() {
        color("Green") {
            cube([53.5,31.5,1.6]);
        }
        {
            translate([10,28,-0.8]) cube([34,5,3.2]);
            translate([10,28,-0.8]) rotate([0,0,45]) cube(5);
            translate([10+34,28,-0.8]) rotate([0,0,45]) cube(5);
            translate([0,28+2,-0.8]) rotate([0,0,45]) cube(5);
            translate([53.5,28+2,-0.8]) rotate([0,0,45]) cube(5);
        }
    }
}

module elegoo_power_board_headers() {
    // TOP
    translate([6,23.5,-0.6]) header(1,4,2.54);
    translate([47.5,23.5,-0.6]) header(1,4,2.54);
    translate([34,21,-0.6]) rotate(90,0,0) header(2,4,2.54);

    // BOTTOM
    translate([7-2.54,16,2.2]) rotate([180,0,0]) header(1,2,2.54);
    translate([7-2.54,26.5,2.2]) rotate([180,0,0]) header(1,2,2.54);
    translate([47.5+2.54,16,2.2]) rotate([180,0,0]) header(1,2,2.54);
    translate([47.5+2.54,26.5,2.2]) rotate([180,0,0]) header(1,2,2.54);

}

module elegoo_power_board_usbs() {
    translate([7,13.5,1.6]) rotate([0,0,-90]) usb_a_socket_single();
}

module elegoo_power_board_dc_sockets() {
    translate([40.5,0,1.6]) dc_socket();
}

module elegoo_power_board() {
    elegoo_power_board_pcb();
    elegoo_power_board_headers();
    elegoo_power_board_usbs();
    elegoo_power_board_dc_sockets();
}
