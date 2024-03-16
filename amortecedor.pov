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
                            location  <0.45,0.8,10>
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
                            
                            
#declare camera_0_0_0_traseira = camera {/*ultra_wide_angle*/ angle 20      
                            location  <10.0 , 3 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}
                            
#declare camera_0_0_0_esquerda = camera {/*ultra_wide_angle*/ angle 15      
                            location  <0 , 0 , 15>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}            
                            
#declare camera_0_0_0_direita = camera {/*ultra_wide_angle*/ angle 15      
                            location  <0 , 0 , -15>
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
                                                                                                                
                                       
                                       
camera{camera_0_0_0_direita }
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

#declare cor_amortecedor1 = pigment {color Gray}
#declare cor_amortecedor2 = pigment {color Black}

#declare finish_amortecedor = finish { ambient 0.1 diffuse 0.9 reflection 0.05 specular 0.2  metallic }    


#declare amortecedor =  merge{
    #declare tamanhoInternoAmortecedor = 0.35;
    #declare tamanhoExternoAmortecedor = 0.65;  
       
       merge{
           sphere { <0,0,0>, 0.04 } 
           cylinder { <0,0,0>, <0,-tamanhoInternoAmortecedor,0>, 0.042}
                
           texture {
                pigment { cor_amortecedor2 }
                finish {finish_amortecedor}
            }  
          }
         
    // Amortecedor
    cylinder {
            <0,0,0>, <0,tamanhoExternoAmortecedor,0>, 0.05
            texture {
                pigment { cor_amortecedor1 }
                finish {finish_amortecedor}
            }
            translate <0,-tamanhoInternoAmortecedor*2.5,0>
  }                           
                    
}
  
  
  
  
#declare amortecedorCompleto = union{
       merge {
           cylinder { <0,0,0>, <0,0.1,0>, 0.047 translate <0,0.005,0>}      
           cylinder { <0,0,-0.2>, <0,0,0.2>, 0.048 }
            texture {
                pigment { cor_amortecedor2 }
                finish {finish_amortecedor}
            }
       
       } 
        object {amortecedor translate <0,0.008,0.19>}
        object {amortecedor translate <0,0.008,-0.19>}
              
 
}


amortecedorCompleto