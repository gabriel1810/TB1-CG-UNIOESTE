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
    
    

#declare chassi = union {

    #declare cor_principal = pigment {color Gray}
    #declare finish_chassi = finish {
                                ambient 0.1
                                diffuse 0.9
                                reflection 0.02
                                specular 0.2 
                                metallic
                             } 
                             
          
    // Suporte direito roda traseira                                          
    union {     
      // Parte de cima   
      cylinder {
        <-0.035,-0.011,-0.18>, <-0.95,0.80,-0.043>, 0.055
        texture {
            pigment { cor_principal } 
            finish { finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
      }
    
      // Parte de baixo
      cylinder {
        <-0.01,0,-0.18>, <-1.30,0.02,-0.04>, 0.050
        texture {
            pigment { cor_principal } 
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
      }
      rotate<0,0.5,0>     
    } 
    
   // Suporte esquerdo roda traseira                                          
    union {     
      // Parte de cima   
      cylinder {
        <-0.035,-0.011,0.18>, <-0.95,0.80,0.04>, 0.055
        texture {
            pigment { cor_principal } 
            finish { finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
      } 
      // Parte de baixo
      cylinder {
        <-0.01,0,0.18>, <-1.30,0.02,0.04>, 0.050
        texture {
            pigment { cor_principal } 
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
      }
      rotate<0,-0.5,0>    
    } 

   // Tubo do selim
   cylinder {
        <-1.25,0,0>, <-0.9,1.15,0>, 0.09
        texture {
            pigment { cor_principal }
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
    }
       

    // conexao tubo selim com suportes
    cylinder {
        <-1.25,0.05,-0.10>, <-1.25,0.05,0.10>, 0.12
        texture {
            pigment { cor_principal }
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
    }


    // Barra central superior
    cylinder {
        <-1.0,0.85,0>, <-2.55,1.50,0>, 0.09
        texture {
            pigment { cor_principal }
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
    }   



    // Barra central Inferior
    union{
    cylinder {
            <-1.25,0.05,0>, <-2.35,1.05,0>, 0.09
            texture {
                pigment { cor_principal }
                finish {finish_chassi}
            }
            scale <1,1,1> translate <0.5,0.8,0>
        }  
        

        cylinder {
            <-2.30,1.01,0>, <-2.65,1.25,0>, 0.09
            texture {
                pigment { cor_principal }
                finish {finish_chassi}
            }
            scale <1,1,1> translate <0.5,0.8,0>
        }
    } 

    // Conexao guidao-suspensao
    cylinder {
        <-2.70,1.05,0>, <-2.48,1.60,0>, 0.1
        texture {
            pigment { cor_principal }
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
    }
}    


chassi
    
      
      
      
      
    
           


       
