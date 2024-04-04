include <face.scad>

radius = 4;
dihedral_angle = 138.2;

face();

translate( [radius, 0, 0] ) rotate( [0, dihedral_angle, 0] ) face();
translate( [-sqrt(2)*radius/2, -sqrt(2)*radius/2, 0] ) rotate( [30, -2*dihedral_angle, 0] ) face();