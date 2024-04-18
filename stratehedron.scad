use <face.scad>
use <pieces.scad>


phi = (1+sqrt(5))/2;

radius = 1;
dihedral_angle = 138.189651;


cartesian_coordinates = [[0.6180339887498948, 1.618033988749895, 0],
[-1, 1, -1],
[-1, 1, 1],
[-0.6180339887498948, 1.618033988749895, 0],
[1, -1, 1],
[-0.6180339887498948, -1.618033988749895, 0],
[1, -1, -1],
[0, 0.6180339887498948, -1.618033988749895],
[-1.618033988749895, 0, 0.6180339887498948],
[1.618033988749895, 0, -0.6180339887498948],
[0, 0.6180339887498948, 1.618033988749895],
[-1, -1, -1],
[-1, -1, 1],
[-1.618033988749895, 0, -0.6180339887498948],
[0, -0.6180339887498948, -1.618033988749895],
[0, -0.6180339887498948, 1.618033988749895],
[0.6180339887498948, -1.618033988749895, 0],
[1.618033988749895, 0, 0.6180339887498948],
[1, 1, -1],
[1, 1, 1]];



module line(start, end, thickness = 1) {
    hull() {
        translate(start) sphere(thickness);
        translate(end) sphere(thickness);
    }
}




scale([1, 1, 1]) {
    
    scale_factor = radius*4;
    
    
    
    for (index = [0:19]) {
        
        x = scale_factor * cartesian_coordinates[index][0];
        y = scale_factor * cartesian_coordinates[index][1];
        z = scale_factor * cartesian_coordinates[index][2];
        
        r  = sqrt(x^2 + y^2 + z^2);
        
        theta = acos(z/r);
        phi = atan2(y,x);
        
        // Applying transformations
        
        line([0,0,0], [x, y, z], 0.1);

        translate([x, y, z]) {
            rotate([0, 0, phi]) {
                rotate([0, theta, 0]) {
                    
                    rotate([0, 0, index*180]) face(radius, dihedral_angle);
                    
                }
        
            }
        }
           
        
    }
}
