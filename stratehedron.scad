use <face.scad>
use <pieces.scad>


$vpt = [0, 0, 0];

$vpr = [30 ,30, 10];

$vpd = 60;




module stratehedron() {
    
    radius = 1;
    dihedral_angle = 138.189651;
    
    phi = (1+sqrt(5))/2;
    
    
    cartesian_coordinates = [
        [1/phi, phi, 0],
        [-1, 1, -1],
        [-1, 1, 1],
        [-1/phi, phi, 0],
        [1, -1, 1],
        [-1/phi, -phi, 0],
        [1, -1, -1],
        [0, 1/phi, -phi],
        [-phi, 0, 1/phi],
        [phi, 0, -1/phi],
        [0, 1/phi, phi],
        [-1, -1, -1],
        [-1, -1, 1],
        [-phi, 0, -1/phi],
        [0, -1/phi, -phi],
        [0, -1/phi, phi],
        [1/phi, -phi, 0],
        [phi, 0, 1/phi],
        [1, 1, -1],
        [1, 1, 1]
    ];


    z_axis_rotations = [
        60,
        67.5,
        52.5,
        0,
        52.5,
        60,
        67.5,
        -30,
        -30,
        30,
        30,
        -7.5,
        7.5,
        30,
        -30,
        30,
        0,
        -30,
        -7.5,
        7.5
    ];

    
    scale_factor = 3*radius;
    
    
    
    for (index = [0:19]) {
        
        x = scale_factor*cartesian_coordinates[index][0];
        y = scale_factor*cartesian_coordinates[index][1];
        z = scale_factor*cartesian_coordinates[index][2];
        
        r  = sqrt(x^2 + y^2 + z^2);
        theta = acos(z/r);
        phi = atan2(y,x);
        
        echo([x, y, z], [r, theta, phi]);
        
        // Applying transformations
        

        translate([x, y, z]) {
            rotate([0, 0, phi]) {
                rotate([0, theta, 0]) {
                    
                    rotate([0, 0, z_axis_rotations[index]]) color("#008100") face(radius, dihedral_angle);
                    
                    if (index == 0) {color("#ff0000") rotate([0, 0, z_axis_rotations[index]]) pieces(1);}
                    
                    if (index == 5) {color("#0000ff") rotate([0, 0, z_axis_rotations[index]]) pieces(1);}
                    
                }
        
            }
        }
           
        
    }
}


rotate([-360*$t,-360*$t,-360*$t]) stratehedron();
