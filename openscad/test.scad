include <libraries/brass_spacer.scad>

render_thread = 0;

brass_male_female_spacer_20mm(40, 0, 5, render_thread);
brass_male_female_spacer_15mm(30, 0, 5, render_thread);
brass_male_female_spacer_10mm(20, 0, 5, render_thread);
brass_male_female_spacer_6mm(10, 0, 5, render_thread);
screw_2mm(0, 0, 5, render_thread);

nut_2mm(0, 10, 0, render_thread);
brass_female_female_spacer_6mm(0, 20, 0, render_thread);
brass_female_female_spacer_10mm(0, 30, 0, render_thread);
brass_female_female_spacer_15mm(0, 40, 0, render_thread);
brass_female_female_spacer_20mm(0, 50, 0, render_thread);



