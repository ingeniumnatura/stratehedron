use <face.scad>


$fn = 33;


phi = (1+sqrt(5))/2;


module private(radius) {
   
    
     difference() {
        
        union() {
            hull() 
            
            {
               
               cylinder(h = radius*(1/phi)^3, r = radius/phi, center = false);
               translate([0, 0, radius*(1/phi)^3]) cylinder(h = radius*(1/phi)^2, r = radius/phi^2, center = false);
            }
               
            translate([0, 0, radius/phi]) cylinder(h = radius-(radius/phi^3), r1 = radius/phi^2, r2 = radius*(1/phi)^3,center = false);
            
            translate([0, 0, radius*phi]) sphere(radius/phi^2);
                

        }
        
        cylinder(h = radius/6, r = radius/3, center = false);
    
    }
    
    

}

module sergeant(radius) {
   
    
     difference() {
        
        union() {
            hull() 
            
            {
               
               cylinder(h = radius*(1/phi)^3, r = radius/phi, center = false);
               translate([0, 0, radius*(1/phi)^3]) cylinder(h = radius*(1/phi)^2, r = radius/phi^2, center = false);
            }
               
            translate([0, 0, radius/phi]) cylinder(h = radius*phi, r1 = radius/phi^2, r2 = radius*(1/phi)^3,center = false);
            
            translate([0, 0, radius/phi+radius*phi]) sphere(radius/phi^2);
                

        }
        
        cylinder(h = radius/6, r = radius/3, center = false);
    
    }
    
    

}


module captain(radius) {
   
    
     difference() {
        
        union() {
            hull() 
            
            {
               
               cylinder(h = radius*(1/phi)^3, r = radius/phi, center = false);
               translate([0, 0, radius*(1/phi)^3]) cylinder(h = radius*(1/phi)^2, r = radius/phi^2, center = false);
            }
               
            translate([0, 0, radius/phi]) cylinder(h = radius*phi, r1 = radius/phi^2, r2 = radius*(1/phi)^3,center = false);
            
            translate([0, 0, radius/phi+radius*phi]) cylinder(h = radius/phi^2, r1 = radius/phi^2, r2 = radius*(1/phi)^3,center = false);;
                

        }
        
        cylinder(h = radius/6, r = radius/3, center = false);
    
    }
    
    

}

module general(radius) {
   
    
     difference() {
        
        union() {
            hull() 
            
            {
               
               cylinder(h = radius*(1/phi)^3, r = radius/phi, center = false);
               translate([0, 0, radius*(1/phi)^3]) cylinder(h = radius*(1/phi)^2, r = radius*(1/phi)^2, center = false);
            }
               
            translate([0, 0, radius/phi]) cylinder(h = radius/phi, r1 = radius*(1/phi)^2, r2 = radius*(1/phi)^2,center = false);
            
            translate([0, 0, 2*radius/phi]) cylinder(h = radius, r1 = radius*(1/phi)^2, r2 = radius*(1/phi)^3,center = false);
            
            translate([0, 0, radius/phi+radius*phi]) cylinder(h = radius/phi^2, r1 = radius/phi^3, r2 = radius*(1/phi)^2,center = false);;
                

        }
        
        cylinder(h = radius/6, r = radius/3, center = false);
    
    }
    
    

}


scale([15, 15, 15]) color("green") face(1, 138.189651);

scale([15, 15, 15]) color("blue") {
    
    
    translate([0, -cos(30)/2, 0]) {
        
         general(radius = 1/2);
    }
    
     translate([0, -cos(30)/2, 0]) {
        
        for (rotate_index = [1:3]) {

            rotate([0, 0, 120*rotate_index-30]) translate([3, 0, 0]) {
                private(radius = 1/2);
                rotate([0, 0, 150]) translate([2*cos(30), 0, 0]) private(radius = 1/2);
                rotate([0, 0, 150]) translate([4*cos(30), 0, 0]) private(radius = 1/2);
                
            }
               
         }
         
    }
    
    
    translate([0, -cos(30)/2, 0]) {
        
        for (rotate_index = [1:3]) {

            rotate([0, 0, 120*rotate_index+90]) translate([2, 0, 0]) {
                sergeant(radius = 1/2);
                
            }
               
         }
         
    }
    
        
    translate([0, -cos(30)/2, 0]) {
        
        for (rotate_index = [1:3]) {

            rotate([0, 0, 120*rotate_index+30]) translate([1, 0, 0]) {
                captain(radius = 1/2);
                
            }
               
         }
         
    }
    

 }