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
                            
                            
#declare camera_0_0_0_traseira = camera {/*ultra_wide_angle*/ angle 20      
                            location  <10.0 , 3 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}
                            
#declare camera_0_0_0_esquerda = camera {/*ultra_wide_angle*/ angle 30      
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
 
 
    
    
    
   // Pinh�o com 7 velocidades, relacao 11/25
   #local numPinhoes = 7;
   #local escala = 1;
   #local aux = 0;
   #local numDentes = 11;
   #local distEsfera = 0.27 ;
   #local espacamentoPinhoes = 0;
   #local rotacao = 0;  
   #local escalaElipse = 5; 
   
   #while(aux < numPinhoes)
           difference{
                torus { 0.35,0.15 scale<1,0.2,1> rotate<90,0,0> } 
                #local i = 0;
                #local angulo = 0;
                #while(i < numDentes)
                      sphere{ <0,distEsfera,0>, 0.2 scale<1,escalaElipse,1>  rotate<0,0,angulo> }
                      #declare i = i + 1;
                      #declare angulo = angulo + (360/numDentes);
                
                #end   
                    
                texture { pigment{ color rgb<0.45,0.45,0.45>} 
                          finish{ ambient 0.1 diffuse 0.9 reflection 0.2 specular 0.2  metallic }
                        } 
                        
               scale <escala,escala,1> translate <0,0,espacamentoPinhoes> rotate<0,0,rotacao>
            
            }                 
       #declare espacamentoPinhoes = espacamentoPinhoes - 0.065;
       #declare distEsfera = distEsfera + (distEsfera*0.003); 
       #declare numDentes = numDentes + 2;                              
       #declare aux = aux+1;
       #declare escala = escala + 0.5; 
       #declare rotacao = rotacao + 5; 
       #declare escalaElipse = escalaElipse + 0.15;
   #end
   