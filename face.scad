$fn = 33;


phi = (1+sqrt(5))/2;

    
module space() {
    
    radius = 1;
    thickness = radius*(phi-1);
    bevel = radius*(1 - (phi - 1)^3);
    
    vertices = [
        [0, radius, 0],
        [-radius*cos(30), -radius*sin(30), 0],
        [radius*cos(30), -radius*sin(30), 0],
    
        [0, radius, thickness*(phi - 1)],
        [-radius*cos(30), -radius*sin(30), thickness*(phi - 1)],
        [radius*cos(30), -radius*sin(30), thickness*(phi - 1)],
    
    
        [0, radius*bevel, thickness],
        [-radius*bevel*cos(30), -radius*bevel*sin(30), thickness],
        [radius*bevel*cos(30), -radius*bevel*sin(30), thickness]
    
    ];
    
    
    difference() {
        
        hull() {
            polyhedron( vertices , [[ each [ 0 : len(vertices) - 1 ] ] ] );
        }
        
        cylinder(h =2*thickness*(phi-1), r = radius/12, center = true);
        
    }
    
    
}

module dihedral_bevel(space_radius, thickness, dihedral_angle) { 
            
            bevel = thickness*tan(dihedral_angle - 90);
            
            vertices = [
                [0, 4*space_radius, 0],
                [-4*space_radius*cos(30), -4*space_radius*sin(30), 0],
        
                [0, 4*space_radius - bevel, 0],
                [-(4*space_radius - bevel)*cos(30), -(4*space_radius - bevel)*sin(30), 0],
            
                [0, 4*space_radius, thickness],
                [-4*space_radius*cos(30), -4*space_radius*sin(30), thickness],
    
                [0, 4*space_radius, thickness],
                [-4*space_radius*cos(30), -4*space_radius*sin(30), thickness],
    
                [-1, 4*space_radius + 1, 1]

            ];
        
            hull() {
                polyhedron( vertices , [[ each [ 0 : len(vertices) - 1 ] ] ] );
            }
        }


module face() {
    
    space_radius = 1;
    thickness = space_radius*(phi-1); 
    
    dihedral_angle = 138.2;
    
    difference () {
    
        
        
        
        
        union() {
            
            space();
            
            translate([0, 2*space_radius, 0]) rotate([0, 0, 180]) space();
            translate([-2*space_radius*cos(30),-2*space_radius*sin(30), 0]) rotate([0, 0, 180]) space();
            translate([2*space_radius*cos(30),-2*space_radius*sin(30), 0]) rotate([0, 0, 180]) space();
            
            translate([0, -space_radius, 0]) rotate([0, 0, 180]) space();
            translate([space_radius*cos(30),space_radius*sin(30), 0]) rotate([0, 0, 180]) space();
            translate([-space_radius*cos(30),space_radius*sin(30), 0]) rotate([0, 0, 180]) space();
            
            
            translate([0, 3*space_radius, 0]) space();
            translate([-3*space_radius*cos(30),-3*space_radius*sin(30), 0]) space();
            translate([3*space_radius*cos(30),-3*space_radius*sin(30), 0]) space();
            
            
            translate([-2*space_radius*cos(30),0, 0]) space();
            translate([2*space_radius*cos(30),0, 0]) space();
            
            translate([-space_radius*cos(30), 3/2*space_radius, 0]) space();
            translate([space_radius*cos(30), 3/2*space_radius, 0]) space();
            
            translate([-space_radius*cos(30), -3/2*space_radius, 0]) space();
            translate([space_radius*cos(30), -3/2*space_radius, 0]) space();


        }
        
        
        
        
        
        
        
        dihedral_bevel(space_radius, thickness, dihedral_angle);
        rotate([0, 0, 120]) dihedral_bevel(space_radius, thickness, dihedral_angle);
        rotate([0, 0, 240]) dihedral_bevel(space_radius, thickness, dihedral_angle);
       
        
        
    
    }
    
}


color([0.5,0.5,0.5,1]) face();



