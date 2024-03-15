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


#declare Camera_centro_roda_dianteira = camera {angle 15     
                            location  <-1.5, 0.8 , 15>
                            right    -x*image_width/image_height
                            look_at   <-1.5 , 0.8 , 0.0>}
                            
                            
                            
                                                         
                   
camera{Camera_centro_roda_dianteira  }
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
                 
                 
                 
#declare cor_roda = pigment {color rgb<1.1,1.1,1.1>};
#declare finish_roda = finish {
                            ambient 0.1
                            diffuse 1
                            reflection 0.002
                            specular 0.2 
                            metallic
                         }    
                         
#declare cor_central_roda = pigment {color rgb<0.3,0.3,0.3>};

#declare roda_dianteira = union { 
         union{ 
            // Roda       
            difference{
                 cylinder {
                    <0.4, 0.8, -0.09>,    // Ponto inicial
                    <0.4, 0.8, 0.09>,  // Ponto final
                    0.61       // Raio
                    texture {
                        pigment { cor_roda } 
                        finish { finish_roda}
                    }
                }
                  
                  
                  cylinder {
                    <0.4, 0.8, -0.095>,    // Ponto inicial
                    <0.4, 0.8, 0.095>,  // Ponto final
                    0.55       // Raio
                    texture {
                        pigment { cor_roda} 
                        finish { finish_roda}
                    }
                }
            
            } 
                   
           
                                                                                            
                     
            //Aros roda dianteira
            union { 
                union{ 
                // Central roda dianteira
                   torus {
                    0.035, 0.015
                    texture {
                            pigment { cor_central_roda }
                            finish {
                                ambient 0.1
                                diffuse 0.2
                                reflection 0.0009 
                            }
                        }
                        scale <1,1,1> rotate<90,0,0>
                    }
                    
                      scale<0,0,0.4>
                      translate <0.398,0.798,0> 
                
                    }
                     union{ 
                // Central roda dianteira
                   torus {
                    0.035, 0.015
                    texture {
                            pigment { cor_central_roda }
                            finish {
                                ambient 0.1
                                diffuse 0.2
                                reflection 0.0009 
                            }
                        }
                        scale <1,1,1> rotate<90,0,0>
                    }
                    
                      scale<0,0,0.4>
                      translate <0.398,0.798,-0.03> 
                
                    }
            }
            
         
         #declare grossura_aros = 0.0055;
         #declare ini_pares = 0.0;
         #declare fim_pares = -0.06;
         #declare ini_impar = -0.03;
         #declare fim_impar = 0.055;

        //Aros roda dianteira
        union {
        
              
            union{ 
                cylinder {<0.35, 0.8, ini_impar>, <-0.15, 0.8, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}} 
                cylinder {<0.45, 0.8, ini_pares>, <0.95, 0.8, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.85, ini_impar>, <0.40, 1.39, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.75, ini_pares>, <0.40, 0.25, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
            }
            
             union{ 
                cylinder {<0.35, 0.8, ini_pares>, <-0.15, 0.8, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder { <0.45, 0.8, ini_impar>, <0.95, 0.8, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.85, ini_pares>, <0.40, 1.39, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.75, ini_impar>, <0.40, 0.25, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                rotate <0,0,15>   translate <0.220,-0.0785,0>
            }
            
            union{   
                cylinder {<0.35, 0.8, ini_impar>, <-0.15, 0.8, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder { <0.45, 0.8, ini_pares>, <0.95, 0.8, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.85, ini_impar>, <0.40, 1.39, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.75, ini_pares>, <0.40, 0.25, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                rotate <0,0,30>   translate <0.45,-0.095,0>
            }
            
            union{   
                cylinder {<0.35, 0.8, ini_pares>, <-0.15, 0.8, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder { <0.45, 0.8, ini_impar>, <0.95, 0.8, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.85, ini_pares>, <0.40, 1.39, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.75, ini_impar>, <0.40, 0.25, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                rotate <0,0,45>   translate <0.68,-0.05,0>
            }
            
            
            union{ 
                cylinder {<0.35, 0.8, ini_impar>, <-0.15, 0.8, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder { <0.45, 0.8, ini_pares>, <0.95, 0.8, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.85, ini_impar>, <0.40, 1.39, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.75, ini_pares>, <0.40, 0.25, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                rotate <0,0,60>   translate <0.89,0.05,0>
            }
            
            union{   
                cylinder {<0.35, 0.8, ini_pares>, <-0.15, 0.8, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}} 
                cylinder { <0.45, 0.8, ini_impar>, <0.95, 0.8, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                cylinder {<0.40, 0.85, ini_pares>, <0.40, 1.39, fim_pares>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}} 
                cylinder {<0.40, 0.75, ini_impar>, <0.40, 0.25, fim_impar>,grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                rotate <0,0,75>   translate <1.065,0.205,0>
            }
                  
             
        
        } 
            translate <-0.40,-0.80,0> 
            
            
            
           }  
            // Pneu dianteiro        
        torus {
            0.35, 0.05
            texture {
                pigment { color rgb<0.2,0.2,0.2> }
                finish {
                    ambient 0.1
                    diffuse 0.2
                    reflection 0.0009 
                }
                
            }
            scale <1.85,1.85,1.85> rotate <90,0,0>
        } 
        
        
        
        
        translate <-2.65,0.80,0>
            
}



   roda_dianteira