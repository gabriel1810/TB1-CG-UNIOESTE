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

                            // Visao lado esquerdo
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 15      
                            location  <0.0 , 1.0 , 40.0>
                            right    -x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}        
                            
                            
                            //Visao traseira
#declare Camera_1 = camera {angle 30     
                            location  <20.0 , 2.0 , 0.0>
                            right    -x*image_width/image_height
                            look_at   <-8.0 , 1.0 , 0.0>} 
                            
                            
                            
#declare Camera_2 = camera {angle 15     
                            location  <15.0 , 1.0 , -15>
                            right    -x*image_width/image_height
                            look_at   <0 , 1.0 , 0.0>}
                            
                            
#declare Camera_pneu_traseiro = camera {angle 15     
                            location  <0.4 , 0.8 , 15>
                            right    -x*image_width/image_height
                            look_at   <0.4 , 0.8 , 0.0>}
                            
                            
#declare Camera_pneu_dianteiro = camera {angle 15     
                            location  <-1.5 , 0.8 , 15>
                            right    -x*image_width/image_height
                            look_at   <-1.5 , 0.8 , 0.0>}
                            
                            
#declare Camera_amortecedor = camera {angle 35     
                            location  <-2.4 , 1.35 , 10>
                            right    -x*image_width/image_height
                            look_at   <-2.4 , 1.35 , 0.0>}
                            
                            
#declare Camera_frente_amortecedor = camera {angle 15     
                            location  <-15 , 8 , 0>
                            right    -x*image_width/image_height
                            look_at   <-2.4 , 1.3 , 0.0>} 
                            
                            
                            
#declare Camera_centro_roda_dianteira = camera {angle 15     
                            location  <5 , 0.8 , 3>
                            right    -x*image_width/image_height
                            look_at   <-1.5 , 0.8 , 0.0>}
                            
                            
                            
                                                         
                   
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
    

//plane { <0,1,0>, 0    // plane with layered textures
//        texture { pigment{color White*1.1}
//                  finish {ambient 0.45 diffuse 0.85}}
//        texture { Raster(RasterScale,RasterHalfLine ) rotate<0,0,0> }
//        texture { Raster(RasterScale,RasterHalfLineZ) rotate<0,90,0>}
//        rotate<0,0,0>
//      }       
      
      
// Rodas      

#declare cor_roda = pigment {color rgb<1.1,1.1,1.1>};
#declare finish_roda = finish {
                            ambient 0.1
                            diffuse 1
                            reflection 0.002
                            specular 0.2 
                            metallic
                         }    
                         
#declare cor_central_roda = pigment {color rgb<0.3,0.3,0.3>};


#declare roda_traseira = union { 
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
                   
           
                                                                                            
                     
            //Aros roda traseira
            union { 
                union{ 
                // Central roda traseira
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
                // Central roda traseira
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

        //Aros roda traseira
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
            // Pneu Traseiro        
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
        
        
        translate <0.45,0.80,0>
            
}





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
               
            
                union{ 
                    cylinder {<0.35, 0.8, 0.0>, <-0.15, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}} 
                    cylinder { <0.45, 0.8, 0.0>, <0.95, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.85, 0.0>, <0.40, 1.39, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.75, 0.0>, <0.40, 0.25, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                }
                
                 union{ 
                    cylinder {<0.35, 0.8, 0.0>, <-0.15, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder { <0.45, 0.8, 0.0>, <0.95, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.85, 0.0>, <0.40, 1.39, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.75, 0.0>, <0.40, 0.25, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    rotate <0,0,15>   translate <0.220,-0.0785,0>
                }
                      
                 union{   
                    cylinder {<0.35, 0.8, 0.0>, <-0.15, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder { <0.45, 0.8, 0.0>, <0.95, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.85, 0.0>, <0.40, 1.39, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.75, 0.0>, <0.40, 0.25, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    rotate <0,0,30>   translate <0.45,-0.095,0>
                }
                
                union{   
                    cylinder {<0.35, 0.8, 0.0>, <-0.15, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder { <0.45, 0.8, 0.0>, <0.95, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.85, 0.0>, <0.40, 1.39, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.75, 0.0>, <0.40, 0.25, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    rotate <0,0,45>   translate <0.68,-0.05,0>
                }
                
                
                union{ 
                    cylinder {<0.35, 0.8, 0.0>, <-0.15, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder { <0.45, 0.8, 0.0>, <0.95, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.85, 0.0>, <0.40, 1.39, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.75, 0.0>, <0.40, 0.25, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    rotate <0,0,60>   translate <0.89,0.05,0>
                }
                
                union{   
                    cylinder {<0.35, 0.8, 0.0>, <-0.15, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}} 
                    cylinder { <0.45, 0.8, 0.0>, <0.95, 0.8, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
                    cylinder {<0.40, 0.85, 0.0>, <0.40, 1.39, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}} 
                    cylinder {<0.40, 0.75, 0.0>, <0.40, 0.25, 0>,0.007 texture {pigment { cor_roda } finish { finish_roda}}}
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
  



        
#declare chassi = union {

    #declare cor_principal = pigment {color Green}
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
        <-1.0,0.85,0>, <-2.55,1.50,0>, 0.080
        texture {
            pigment { cor_principal }
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
    }   
    
    
    
    // Barra central Inferior
    union{
    cylinder {
            <-1.25,0.05,0>, <-2.35,1.05,0>, 0.08
            texture {
                pigment { cor_principal }
                finish {finish_chassi}
            }
            scale <1,1,1> translate <0.5,0.8,0>
        }  
        
    
        cylinder {
            <-2.30,1.01,0>, <-2.65,1.25,0>, 0.080
            texture {
                pigment { cor_principal }
                finish {finish_chassi}
            }
            scale <1,1,1> translate <0.5,0.8,0>
        }
    } 
    
    // Conexao guidao-suspensao
    cylinder {
        <-2.70,1.05,0>, <-2.48,1.60,0>, 0.09
        texture {
            pigment { cor_principal }
            finish {finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
    }
}  



#declare amortecedor = union{

    #declare cor_amortecedor1 = pigment {color Gray}
    #declare cor_amortecedor2 = pigment {color Black}
    
    #declare finish_amortecedor = finish {
                                ambient 0.1
                                diffuse 0.9
                                reflection 0.05
                                specular 0.2 
                                metallic
                             }    
                             
                             
           
       union {
       
           cylinder {
                <-2.70,1.05,0>, <-2.718,1,0>, 0.05
                texture {
                    pigment { cor_amortecedor2 }
                    finish {finish_amortecedor}
                }
                scale <1,1,1> translate <0.5,0.8,0>
            }      
    
             cylinder {
                <-2.729,0.98,-0.2>, <-2.729,0.98,0.2>, 0.048
                texture {
                    pigment { cor_amortecedor2 }
                    finish {finish_amortecedor}
                }
                scale <1,1,1> translate <0.5,0.8,0>
            }
       
       }
        
        
        // Amortecedor direito
        union{
        
        // Conexao guidao-amortecedor
           sphere { <-2.7225,0.995,0.22>, 0.04 
           texture { pigment{ cor_amortecedor2}
                      finish { finish_amortecedor}
                    } 
    
              scale<1,1,1>  rotate<0,0,0>  translate<0.5,0.8,0>  
           } 
                  
                  
        cylinder {
                <-2.7225,1,0.22>, <-2.92,0.5,0.22>, 0.042
                texture {
                    pigment { cor_amortecedor2 }
                    finish {finish_amortecedor}
                }
                scale <1,1,1> translate <0.5,0.8,0>
            }
            
             
            // Amortecedor
            cylinder {
                    <-2.82,0.75,0.22>, <-3.14,0,0.22>, 0.05
                    texture {
                        pigment { cor_amortecedor1 }
                        finish {finish_amortecedor}
                    }
                    scale <1,1,1> translate <0.5,0.8,0>
                }
        
          translate <0,0.01,-0.015>
        }        
        
        
        
        
        
        // Amortecedor esquerdo 
               union{
        
        // Conexao guidao-amortecedor
           sphere { <-2.7225,0.995,0.22>, 0.04 
           texture { pigment{ cor_amortecedor2}
                      finish { finish_amortecedor}
                    } 
    
              scale<1,1,1>  rotate<0,0,0>  translate<0.5,0.8,0>  
           } 
                  
                  
        cylinder {
                <-2.7225,1,0.22>, <-2.92,0.5,0.22>, 0.042
                texture {
                    pigment { cor_amortecedor2 }
                    finish {finish_amortecedor}
                }
                scale <1,1,1> translate <0.5,0.8,0>
            }
            
             
            // Amortecedor
            cylinder {
                    <-2.82,0.75,0.22>, <-3.14,0,0.22>, 0.05
                    texture {
                        pigment { cor_amortecedor1 }
                        finish {finish_amortecedor}
                    }
                    scale <1,1,1> translate <0.5,0.8,0>
                }
        
          translate <0,0.01,-0.42>
        }        
        
 
 
 
 
}


chassi
roda_traseira
roda_dianteira
amortecedor