include <BOSL2/std.scad>

translate([0, 2.5, 4]) rotate([0, 90, 0]) prismoid(size1=[6,5], h=3, xang=60, yang=90);
translate([-8, 0, 2.5]) cube([8, 5, 3]);