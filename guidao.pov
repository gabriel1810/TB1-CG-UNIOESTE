 // PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"


                            // Visao lado esquerdo
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 30      
                            location  <8,2,12>      
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>   
                             }
                            

                                                                   
                                       
camera{Camera_0 }
//------------------------------------------------------------------------
// sun -------------------------------------------------------------------
light_source{<1500,+2500, 2500> color White}
// sky -------------------------------------------------------------------


 
 // Set a color of the background (sky)
background { color rgb< 1, 1, 1> }




#declare guidao = union{
    #declare tamanhoGuidao = 4;
    #declare grosGuidao = 0.15;
 union{
    cylinder{<0,0,-tamanhoGuidao>,<0,0,-tamanhoGuidao+(tamanhoGuidao/3)> grosGuidao+0.025}
    cylinder{<0,0,tamanhoGuidao>,<0,0,tamanhoGuidao-(tamanhoGuidao/3)> grosGuidao+0.025}
    texture { pigment { color rgb< 1, 1, 1>*0.05}
    normal { pigment_pattern{
                            average pigment_map{[1, gradient z sine_wave]
                                                [1, gradient y scallop_wave]
                                                [3, bumps  ]}
                                         translate 0.02 scale 1}
                                         5
                         rotate< 0,0,0> scale 0.15 } 
             finish {ambient 0.2 diffuse 0.1 reflection 0 specular 0.1 }   
            }
     }  
     
     
    merge{
        sphere{ <0,0,0>, grosGuidao + (grosGuidao*0.2)
        scale<6,1,1> rotate <0,90,0>} 
        cylinder{<0,0,-tamanhoGuidao>,<0,0,tamanhoGuidao> grosGuidao}
       
        merge{
          cylinder{<0,0,0>, <0.95,0,0> grosGuidao + (grosGuidao*0.1)
          translate <0.01,0,0> }   
          cylinder{<0,0,0>,<0,0.8,0> grosGuidao + (grosGuidao*0.2) translate<0.95,-0.7,0>}
          sphere{ <0,0,0>, grosGuidao + (grosGuidao*0.2)translate<0.95,0.1,0>}                         
        }
        
        
        texture { pigment { color rgb< 0.25, 0.25, 0.25>}            
             finish {ambient 0.2 diffuse 0.2 reflection 0.1 specular 0.2 metallic}   
            }
    }

}  
  
  
object{guidao}

