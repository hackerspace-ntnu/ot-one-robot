width = 8.2;
length = 20.2;
height = 14.5;
thickness = 0.5;
screwHoleRadius = 0.26;
screwHolePadding = 0.25;
powerButtonRadius = 0.8;
powerConnectorRadius = 0.5;
standOffHoleRadius = 0.29;
fastenerScrewRadius = 0.33;
addFastenerTop = true;

// from https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius) {
    translate([0,0,height/2])
    hull() {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}

module front() {
    difference() {
        cube([thickness, width+thickness*2, height]);
        // space for the screws, seen from the front
        // bottom left
        translate([0, width+screwHolePadding, screwHolePadding*1.75])
        rotate([0, 90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
        // bottom right
        translate([0, thickness+screwHolePadding, screwHolePadding*1.75])
        rotate([0, 90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
        // top right
        translate([0, width+screwHolePadding, height-screwHolePadding*1.75])
        rotate([0, 90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
        // top left
        translate([0, thickness+screwHolePadding, height-screwHolePadding*1.75])
        rotate([0, 90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
        //connectors smoothieboard
        // usb-b
        translate([0, thickness+6.1, 3.9])
        cube([thickness, 1.2, 1.2]);
        // ethernet
        translate([0, thickness+5.9, 5.4])
        cube([thickness, 1.4, 1.6]);
        // sd-card
        translate([0, thickness+5.9, 7.3])
        cube([thickness, 1.6, 1.4]);
        // connectors rpi
        // ethernet
        translate([0, thickness+1.2, 8.3])
        cube([thickness, 1.4, 1.6]);
        // usb ports
        translate([0, thickness+1.2, 10.2])
        cube([thickness, 1.7, 1.6]);
        translate([0, thickness+1.2, 12])
        cube([thickness, 1.7, 1.6]);
        // power connector 
        translate([0, thickness+4, 6.45]) rotate([0, 90, 0])
        cylinder(r=powerConnectorRadius, h=thickness, $fn=60);
        // power button
        translate([0, thickness+4, 3.7]) rotate([0, 90, 0])
        cylinder(r=powerButtonRadius, h=thickness, $fn=60);
    }
}

module back() {
    difference() {
        cube([thickness, width+thickness*2, height+thickness*2]);
        // space for the screws, seen from the back
        // bottom left
        translate([screwHolePadding, thickness+screwHolePadding*1.2, thickness+screwHolePadding*1.2])
        rotate([0, -90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
        // bottom right
        translate([screwHolePadding, width+screwHolePadding/1.2, thickness+screwHolePadding*1.2])
        rotate([0, -90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
        // top right
        translate([screwHolePadding, width+screwHolePadding/1.2, height+screwHolePadding/1.2])
        rotate([0, -90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
        // top left
        translate([screwHolePadding, thickness+screwHolePadding*1.2, height+screwHolePadding/1.2])
        rotate([0, -90, 0])      
        cylinder(r=screwHoleRadius, h=thickness, $fn=40);
    }
}

module left() {
    difference() {
        cube([length, thickness, height]);
        // standoffs for the smoothieboard
        // bottom left
        translate([10.6, thickness, 2.9]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
        // bottom right
        translate([1.3, thickness, 3.2]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
        // top right
        translate([0.6, thickness, 12.5]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
        // top left
        translate([10.5, thickness, 12.6]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
    }
}

module right() {
    difference() {
        cube([length, thickness, height]);
        // cut out hole for the logo
        translate([4.1, 0, 4.8])
        cube([10.7, thickness, 2.5]);
        // standoffs for the rpi
        // bottom left
        translate([2.6, thickness, 8.4]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
        // bottom right
        translate([8.35, thickness, 8.4]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
        // top right
        translate([8.35, thickness, 13.4]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
        // top left
        translate([2.55, thickness, 13.5]) rotate([90, 0, 0]) 
        cylinder(r=standOffHoleRadius, h=thickness, $fn=40);
    }
}

module top() {
    difference() {
        cube([length+thickness*2, width+thickness*2, thickness]);
        translate([2, 1.5, 0])
        roundedcube(7.2, 1.8, thickness, 0.2, $fn=40);
        translate([11.5, 1.6, 0])
        roundedcube(3.2, 2.7, thickness, 0.3, $fn=40);
    }
    if (addFastenerTop) {
        difference() {
            translate([0, 0, thickness])
            cube([length+thickness*2, 2*thickness, 3]);
            translate([length/4, 2*thickness, 2]) rotate([90, 0, 0])
            cylinder(r=fastenerScrewRadius, h=thickness*2, $fn=50);
            translate([length*3/4, 2*thickness, 2]) rotate([90, 0, 0])
            cylinder(r=fastenerScrewRadius, h=thickness*2, $fn=50);
        }
    }
}

module bottom() {
    cube([length+thickness, width+thickness*2, thickness]);  
}


translate([0, 0, thickness])
front();
//translate([thickness, 0, thickness])
//right();
//translate([thickness, width+thickness, thickness])
//left();
translate([0, 0, height+thickness])
top();
//translate([length+thickness, 0, 0])
//back();
bottom();