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
               
            translate([0, 0, radius/phi]) cylinder(h = radius*phi, r1 = radius/phi^2, r2 = radius*(1/phi)^3,center = false);
            
            translate([0, 0, radius/phi+radius*phi]) sphere(radius/phi^2);
                

        }
        
        cylinder(h = radius/6, r = radius/3, center = false);
    
    }
    
    

}

scale([15, 15, 15]) private(radius = 1);