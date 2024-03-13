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
//--------------------------------------------------------------------------  right handed, y up 

                            // Vis�o lado esquerdo
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 15      
                            location  <0.0 , 1.0 , 40.0>
                            right    -x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}        
                            
                            
                            //Vis�o de tr�s
#declare Camera_1 = camera {angle 15     
                            location  <20.0 , 3.0 , 0.0>
                            right    -x*image_width/image_height
                            look_at   <-8.0 , 1.0 , 0.0>}                            
                   
camera{Camera_0}
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


//------------------------------------------------------------------------
//--------------------- drawing of 3 Axes --------------------------------
//------------------------------------------------------------------------

#declare Texture_A_Dark  = texture {
                               pigment{ color rgb<1,0.45,0>}
                               finish { phong 1}
                             }
#declare Texture_A_Light = texture { 
                               pigment{ color rgb<1,1,1>}
                               finish { phong 1}
                             }

//-------------------------------------------------- end of coordinate axes


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
//-------------------------------------------------------------------------
    

plane { <0,1,0>, 0    // plane with layered textures
        texture { pigment{color White*1.1}
                  finish {ambient 0.45 diffuse 0.85}}
        texture { Raster(RasterScale,RasterHalfLine ) rotate<0,0,0> }
        texture { Raster(RasterScale,RasterHalfLineZ) rotate<0,90,0>}
        rotate<0,0,0>
      }       
      

// Rodas  
         
         
torus { 0.35,0.05  texture { pigment{ color rgb<255,0,0>} finish { phong 1 reflection 0.00} } 
         scale <2,2,2> rotate<90,0,0> translate<0.5,0.80,0>
 }
 
 
torus { 0.35,0.05 texture { pigment{ color rgb<255,0,0>} finish { phong 1 reflection 0.00} }
        scale <2,2,2> rotate<90,0,0> translate<-4,0.80,0>
 } 
 
 
 
 
 // Marcador de 0 0 0
   
cylinder { <0,0,0>,<0,2,0>, 0.07 texture { pigment { color rgb<0,20,0> }}} 
        
   
 // Suporte direito roda traseira                                          
union {    
  cylinder { <0,0,0>,<0,1.60,0>, 0.06 texture { pigment { color rgb<0,0,0> } finish { phong 0.5 reflection{ 0.00 metallic 0.00} } } 
             scale <1,1,1> rotate<0,0,50> translate<0.5,0.8,0>
  }   
         
  cylinder { <0,0,0>,<0,1.60,0>, 0.06  texture { pigment { color rgb<0,0,0> } finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } } 
            scale <1,1,1> rotate<0,0,90> translate<0.5,0.8,0> } 

  translate<0,0,-0.2>
}                                          
                    
             
// Suporte esquerdo roda traseira                
union {    
  cylinder { <0,0,0.2>,<0,1.60,0>, 0.06 texture { pigment { color rgb<0,0,0> } finish { phong 0.5 reflection{ 0.00 metallic 0.00} } } 
             scale <1,1,1> rotate<0,0,50> translate<0.5,0.8,0>
  }   
         
  cylinder { <0,0,0.2>,<0,1.60,0>, 0.06  texture { pigment { color rgb<0,0,0> } finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } } 
            scale <1,1,1> rotate<0,0,90> translate<0.5,0.8,0> } 

  translate<0,0,0>
}         

cylinder { <-1.60,0,0>,<-1.1,1.60,0>, 0.09  texture { pigment { color rgb<0,0,0> } finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } } 
            scale <1,1,1>  translate<0.5,0.8,0> }