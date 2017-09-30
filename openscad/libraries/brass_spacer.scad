include <threads.scad>

module brass_spacer(x, y, z, size, male, render_thread) {

	triangles = 100;

    translate([x, y, z]) {
        difference() {
          // hex standoff body
          translate ([0,0,0]) cylinder ($fn=6,h=size,r=3);
          
          // hole tap

          if (male == 0) {        
            translate([0,0,-0.1])
              cylinder ($fn=triangles,h=size + 0.2,r=1.5);
            if (render_thread == 1) {
                translate([0,0,0])
                  metric_thread (3.5, 0.59, size,internal = true);
            }
          }
          if (male == 1) {        
            translate([0,0,size-5.1])
              cylinder ($fn=triangles,h=5+0.2,r=1.5);
            if (render_thread == 1) {
                translate([0,0,size-5])
                  metric_thread (3.5, 0.59, 5,internal = true);
            }
          }
        }

        if (male == 1) {        
          // thread
          translate([0,0,-5])
            cylinder ($fn=triangles,h=5,r=1.5);

          if (render_thread == 1) {
            translate([0,0,-5])
              metric_thread (3.5, 0.59, 5);
          }
        }
    }
}

module screw(x, y, z, size, render_thread) {

	triangles = 100;

  translate([x, y, z]) {
    // thread
    translate([0,0,-5])
      color("Silver") cylinder ($fn=triangles,h=5,r=1.5);

    if (render_thread == 1) {
      color("Silver") translate([0,0,-5]) metric_thread (3.5, 0.59, 5);
    }

    // Screw head
    difference() {
      $fn = 200;
      color("Silver")
      // Screw head
      difference() {
          //sphere(r=3);
          resize(newsize=[6,6,2]) sphere(r=3);
          translate([-10,-10,-1.5])cube([20,20,1.5]);
      }

      // Screwdriver slit 1
      color("Silver")
      translate([-0.25,-3,0.5])cube([0.5,6,0.5]);
      color("Silver")
      translate([0,3,1])rotate([90,90,0])cylinder(r=0.5,h=6);

      // Screwdriver slit 2
      color("Silver")
      translate([-3,-0.25,0.5])cube([6,0.5,0.5]);
      color("Silver")
      translate([-3,0,1])rotate([0,90,0])cylinder(r=0.5,h=6);
    }
  }
}

module nut(x, y, z, size, render_thread) {

	triangles = 100;

    translate([x, y, z]) {
        difference() {
          // hex standoff body
          color("Silver") translate ([0,0,0]) cylinder ($fn=6,h=size,r=3);
          
          // hole tap

          translate([0,0,-0.1])
            color("Silver") cylinder ($fn=triangles,h=size + 0.2,r=1.5);
          if (render_thread == 1) {
              color("Silver") translate([0,0,0]) metric_thread (3.5, 0.59, size,internal = true);
          }
        }
    }
}

// Male-Female
module brass_male_female_spacer_6mm(x, y, z, render_thread) {
  brass_spacer(x, y, z, 6, 1, render_thread);  
}
module brass_male_female_spacer_10mm(x, y, z) {
  brass_spacer(x, y, z, 10, 1, render_thread);  
}
module brass_male_female_spacer_15mm(x, y, z) {
  brass_spacer(x, y, z, 15, 1, render_thread);  
}
module brass_male_female_spacer_20mm(x, y, z) {
  brass_spacer(x, y, z, 20, 1, render_thread);  
}

// Female-Female
module brass_female_female_spacer_6mm(x, y, z, render_thread) {
  brass_spacer(x, y, z, 6, 0, render_thread);  
}
module brass_female_female_spacer_10mm(x, y, z) {
  brass_spacer(x, y, z, 10, 0, render_thread);  
}
module brass_female_female_spacer_15mm(x, y, z) {
  brass_spacer(x, y, z, 15, 0, render_thread);  
}
module brass_female_female_spacer_20mm(x, y, z) {
  brass_spacer(x, y, z, 20, 0, render_thread);  
}

module nut_2mm(x, y, z, render_thread) {
  nut(x, y, z, 2, render_thread);  
}

module screw_2mm(x, y, z, render_thread) {
  screw(x, y, z, 2, render_thread);  
}

