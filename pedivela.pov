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
                            location  <10.0 , 0 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}
                            
#declare camera_0_0_0_diagonal = camera {/*ultra_wide_angle*/ angle 30      
                            location  <10.0 , 1 , -5>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}                            
                            
                            
#declare camera_0_0_0_esquerda = camera {/*ultra_wide_angle*/ angle 30      
                            location  <0 , 0 , 15>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}            
                            
#declare camera_0_0_0_direita = camera {/*ultra_wide_angle*/ angle 20      
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
                                                                                                                
                                       
                                       
camera{camera_0_0_0_diagonal }
//------------------------------------------------------------------------
// sun -------------------------------------------------------------------
light_source{<1500,2500, -2500> color White}
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
 
 
    
    
 #declare coroa = union{  
   // coroa com 3 velocidades, relacao 44/34/24
   #local numPinhoes = 3;
   #local escala = 1;
   #local aux = 0;
   #local numDentes = 24;
   #local distEsfera = 0.226 ;
   #local espacamentoPinhoes = 0;
   #local rotacao = 0;  
   #local escalaElipse = 15; 
   
   #while(aux < numPinhoes)
           difference{
                torus { 0.38,0.1 scale<1,0.2,1> rotate<90,0,0> } 
                #local i = 0;
                #local angulo = 0;
                #while(i < numDentes)
                      sphere{ <0,distEsfera,0>, 0.2 scale<1,escalaElipse,1>  rotate<0,0,angulo> }
                      #declare i = i + 1;
                      #declare angulo = angulo + (360/numDentes);
                #end      
                texture { pigment{ color rgb<0.25,0.25,0.25>} 
                          finish{ ambient 0.1 diffuse 0.9 reflection 0.2 specular 0.2  metallic }
                        } 
                        
               scale <escala,escala,1> translate <0,0,espacamentoPinhoes> rotate<0,0,rotacao>
            
            }                 
       #declare espacamentoPinhoes = espacamentoPinhoes - 0.065;
       #declare distEsfera = distEsfera + (distEsfera*0.003); 
       #declare numDentes = numDentes + 10;                              
       #declare aux = aux+1;
       #declare escala = escala + 0.5; 
       #declare rotacao = rotacao + 5; 
       #declare escalaElipse = escalaElipse + 0.55;
   #end
}  


#declare pedivela = union{
    object {coroa}
    torus { 0.415,0.08 scale<2.1,0.2,2.1> rotate<90,0,0> translate<0,0,-0.2> } 
    
    cylinder{ <0,0,0>,<0,0,-0.085> 0.25  translate<0,0,-0.18> }
    
    #local i = 0;
    #local angulo = 0;
    #while(i < 5) 
         box { <0.00, 0.00, 0.00>,< 0.15, 0.8, 0.045> scale <1,1,1>  translate<-0.055,0,-0.25>  rotate<5,0,angulo> } 
       #declare angulo = angulo + 72;
       #declare i = i+1;
    #end 
    texture { 
        finish{ ambient 0.2 diffuse 0.6 reflection 0.05 specular 0.2 phong 0.5 phong_size 60 metallic }
        pigment {color rgb<0.05,0.05,0.05>} 
    } 
}  
  
#declare pedal = merge{
    sphere { <0,0,0>, 0.10 scale<2,2,1> translate<0,0,-0.28>}
    cylinder{ <0,0,0>,<-1.8,0,0> 0.08 rotate<0,-3,0> scale<1,1.5,1> translate<0,0,-0.29> }
    cylinder{ <-1.75,0,0>,<-1.75,0,-0.75> 0.065 rotate<0,-3,0>  translate<0,0,-0.29> }          
            
    object{ Supertorus( 1.00, 0.25,0.25, 0.45,0.001, 1.50) 
        scale <0.28,0.25,0.25> 
        rotate<0,-3,0> 
        translate<-1.72,0,-0.82>
      }
      
    box { <0, 0,0>,< 0.005, 0.10, 0.4>   
        texture { pigment{ color rgb< 1.0, 0.65, 0.0>}  finish { phong 1 reflection{ 0.00 metallic 0.00} } } 
        rotate<0,-3,0> translate<-1.365,-0.05,-1> 
    }
    
    
    box { <0, 0,0>,< 0.005, 0.10, 0.4>   
        texture { pigment{ color rgb< 1.0, 0.65, 0.0>}  finish { phong 1 reflection{ 0.00 metallic 0.00} } } 
        rotate<0,-3,0> translate<-2.058,-0.05,-1.05> 
    }  
                  

     texture { 
        finish{ ambient 0.2 diffuse 0.6 reflection 0.05 specular 0.2 phong 0.5 phong_size 60 metallic }
        pigment {color rgb<0.05,0.05,0.05>} 
    }  
 
}  

object pedalTodo = merge {
 object {pedivela} 
 object {pedal}
}
  
  
