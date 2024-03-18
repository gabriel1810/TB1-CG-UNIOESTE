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
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 15      
                            location  <0.45,0.8,40>
                            right    -x*image_width/image_height
                            look_at   <0.45,0.8,0>}        
                            
                            
                            //Visao traseira
#declare Camera_1 = camera {angle 30     
                            location  <8.0 , 1.0 , 0.0>
                            right    -x*image_width/image_height
                            look_at   <-8.0 , 0.8 , 0.0>} 
                            
                                     
                                     // Visao dalo direito
#declare Camera_dir = camera {/*ultra_wide_angle*/ angle 15      
                            location  <0.0 , 1.0 , -20.0>
                            right    -x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
                            
                            
#declare camera_0_0_0_traseira = camera {/*ultra_wide_angle*/ angle 30      
                            location  <40.0 , 2 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}
                            
#declare camera_0_0_0_esquerda = camera {/*ultra_wide_angle*/ angle 25      
                            location  <0 , 0 , 25>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}            
                            
#declare camera_0_0_0_direita = camera {/*ultra_wide_angle*/ angle 25      
                            location  <0 , 0 , -25>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}                                                             
                                                                
#declare camera_0_0_0_frente = camera {/*ultra_wide_angle*/ angle 20      
                            location  <-10.0 , 0 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}
                            
#declare camera_0_0_0_cima = camera {/*ultra_wide_angle*/ angle 20      
                            location  <-0 , 15 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}                            
                                                                                                                
#declare camera_traseira_diagona_esquerda = camera {/*ultra_wide_angle*/ angle 30      
                            location  <10 , 0 , 20>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>} 
                                                                   
                                       
camera{camera_0_0_0_esquerda }
//------------------------------------------------------------------------
// sun -------------------------------------------------------------------
light_source{<1500,2500, 2500> color White}
// sky -------------------------------------------------------------------
sky_sphere{ pigment{ gradient <0,1,0>
                     color_map{ [0   color rgb<1,1,1>         ]//White
                                [0.4 color rgb<0.14,0.14,0.56>]//~Navy
                                [0.6 color rgb<0.14,0.14,0.56>]//~Navy
                                [1.0 color rgb<1,1,1>         ]//White
                              }
                     scale 2 }
           } // end of sky_sphere 
//------------------------------------------------------------------------
// ground -----------------------------------------------------------------
//---------------------------------<<< settings of squared plane dimensions

#declare RasterScale = 1.0;
#declare RasterHalfLine  = 0.035;  
#declare RasterHalfLineZ = 0.035; 
//-------------------------------------------------------------------------
#macro Raster(RScale, HLine) 
       pigment{ gradient x scale RScale
                color_map{[0.000   color rgbt<1,1,1,0>*0.6]
                          [0+HLine color rgbt<1,1,1,0>*0.6]
                          [0+HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,0>*0.6]
                          [1.000   color rgbt<1,1,1,0>*0.6]} }
 #end// of Raster(RScale, HLine)-macro
 
 
#declare guidao = union{
    #declare tamanhoGuidao = 4;
    #declare grosGuidao = 0.2;
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



