$fn = 100;

$vpt = [0, 0, 0];

$vpr = [0, 360, 0];

$vpd = 20;

phi = (1+sqrt(5))/2;

module tetrahedron() {
    
    vertices = [
        [-1/sqrt(3), 1/sqrt(3), -1/sqrt(3)],
        [1/sqrt(3), 1/sqrt(3), 1/sqrt(3)],
        [-1/sqrt(3), -1/sqrt(3), 1/sqrt(3)],
        [1/sqrt(3), -1/sqrt(3), -1/sqrt(3)]
    ];
    
    hull(){
    polyhedron( vertices , [[ each [ 0 : len(vertices) - 1 ] ] ] );
    }

}

module hexahedron() {
    
    vertices = [
        [-1/sqrt(3), 1/sqrt(3), -1/sqrt(3)],
        [-1/sqrt(3), 1/sqrt(3), 1/sqrt(3)],
        [-1/sqrt(3), -1/sqrt(3), -1/sqrt(3)],
        [1/sqrt(3), -1/sqrt(3), 1/sqrt(3)],
        [-1/sqrt(3), -1/sqrt(3), 1/sqrt(3)],
        [1/sqrt(3), -1/sqrt(3), -1/sqrt(3)],
        [1/sqrt(3), 1/sqrt(3), -1/sqrt(3)],
        [1/sqrt(3), 1/sqrt(3), 1/sqrt(3)]
    ];
    
    hull(){
    polyhedron( vertices , [[ each [ 0 : len(vertices) - 1 ] ] ] );
    }

}
module octahedron() {
    
    vertices = [
        [0, 1, 0],
        [0, -1, 0],
        [1, 0, 0],
        [-1, 0, 0],
        [0, 0, -1],
        [0, 0, 1],
    ];
            
    hull(){
    polyhedron( vertices , [[ each [ 0 : len(vertices) - 1 ] ] ] );
    }

}

module icosahedron() {
    
    vertices = [
        [0, sqrt(1/2 - 1/(2*sqrt(5))), -sqrt(1/2 - 1/(2*sqrt(5)))*phi],
        [sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0, sqrt(1/2 - 1/(2*sqrt(5)))],
        [-sqrt(1/2 - 1/(2*sqrt(5))), -sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0],
        [sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0, -sqrt(1/2 - 1/(2*sqrt(5)))],
        [0, -sqrt(1/2 - 1/(2*sqrt(5))), -sqrt(1/2 - 1/(2*sqrt(5)))*phi],
        [sqrt(1/2 - 1/(2*sqrt(5))), -sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0],
        [-sqrt(1/2 - 1/(2*sqrt(5))), sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0],
        [sqrt(1/2 - 1/(2*sqrt(5))), sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0],
        [-sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0, -sqrt(1/2 - 1/(2*sqrt(5)))],
        [0, sqrt(1/2 - 1/(2*sqrt(5))), sqrt(1/2 - 1/(2*sqrt(5)))*phi],
        [-sqrt(1/2 - 1/(2*sqrt(5)))*phi, 0, sqrt(1/2 - 1/(2*sqrt(5)))],
        [0, -sqrt(1/2 - 1/(2*sqrt(5))), sqrt(1/2 - 1/(2*sqrt(5)))*phi]
    ];
            
    hull(){
    polyhedron( vertices , [[ each [ 0 : len(vertices) - 1 ] ] ] );
    }

}
module dodecahedron() {
    
    vertices = [
        [(phi/sqrt(phi^4+1))/phi, (phi/sqrt(phi^4+1))*phi, 0],
        [-(phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1))],
        [-(phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1))],
        [-(phi/sqrt(phi^4+1))/phi, phi*(phi/sqrt(phi^4+1)), 0],
        [(phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1))],
        [-(phi/sqrt(phi^4+1))/phi, -phi*(phi/sqrt(phi^4+1)), 0],
        [(phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1))],
        [0, (phi/sqrt(phi^4+1))/phi, -phi*(phi/sqrt(phi^4+1))],
        [-phi*(phi/sqrt(phi^4+1)), 0, (phi/sqrt(phi^4+1))/phi],
        [phi*(phi/sqrt(phi^4+1)), 0, -(phi/sqrt(phi^4+1))/phi],
        [0, (phi/sqrt(phi^4+1))/phi, phi*(phi/sqrt(phi^4+1))],
        [-(phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1))],
        [-(phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1))],
        [-phi*(phi/sqrt(phi^4+1)), 0, -(phi/sqrt(phi^4+1))/phi],
        [0, -(phi/sqrt(phi^4+1))/phi, -phi*(phi/sqrt(phi^4+1))],
        [0, -(phi/sqrt(phi^4+1))/phi, phi*(phi/sqrt(phi^4+1))],
        [(phi/sqrt(phi^4+1))/phi, -phi*(phi/sqrt(phi^4+1)), 0],
        [phi*(phi/sqrt(phi^4+1)), 0, (phi/sqrt(phi^4+1))/phi],
        [(phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1)), -(phi/sqrt(phi^4+1))],
        [(phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1)), (phi/sqrt(phi^4+1))]
    ];
            
    hull(){
    polyhedron( vertices , [[ each [ 0 : len(vertices) - 1 ] ] ] );
    }

}







translate([-2*phi^2,0,0]) {


color( c = [0.5, 0, 1, 0.5]) {
rotate([360*$t,360*$t,360*$t]){
tetrahedron();
}
}
    


translate([phi^2, 0, 0]) {

    color( c = [0.5, 0, 1, 0.5])
    rotate([-360*$t,360*$t,360*$t]){
    hexahedron();
    }


}

translate([2*phi^2, 0, 0]) {
    
    color( c = [0.5, 0, 1, 0.5])
    rotate([-360*$t,-360*$t,360*$t]){
    octahedron();
    }

    
    
    }

translate([3*phi^2, 0, 0]) {
    
    color( c = [0.5, 0, 1, 0.5])
    rotate([-360*$t,-360*$t,-360*$t]){
    icosahedron();
    }


}

translate([4*phi^2, 0, 0]) {

    color( c = [0.5, 0, 1, 0.5])
    rotate([360*$t,-360*$t,-360*$t]){
    dodecahedron();
    }

    
}

}
