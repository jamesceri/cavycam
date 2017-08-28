module dc_socket() {
    $fn=50;
    color("DimGrey") {
        difference() {
            union(){
                cube([9,3.4,10.8]);
                translate([0.1,3.4,0]) cube([8.8,10.4,4.5]);
                translate([4.4,3.4,5.8]) rotate([-90,0,0]) cylinder(r=4.5,h=10.4);
            }
            translate([4.4,-0.1,5.8]) rotate([-90,0,0]) cylinder(r=3,h=10.4);
        }
    }
    color("Silver") translate([4.4,-0.1,5.8]) rotate([-90,0,0]) cylinder(r=0.6,h=10.4);
}