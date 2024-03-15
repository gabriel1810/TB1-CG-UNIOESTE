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


#declare Camera_centro_roda_dianteira = camera {angle 10     
                            location  <-2.5, 0.8 , 15>
                            right    -x*image_width/image_height
                            look_at   <-2.5 , 0.8 , 0.0>}
                            
#declare Camera_diagonal_traseira = camera {angle 10     
                            location  <8, 0.8 , 8>
                            right    -x*image_width/image_height
                            look_at   <-1.5 , 0.8 , 0.0>}
                            
#declare camera_0_0_0 = camera {angle 30     
                            location  <8, 0 , 2>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0.0>}                          
                                                        
                   
camera{camera_0_0_0}
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
                     scale 0 }
           } // end of sky_sphere 
//------------------------------------------------------------------------



                 
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
                 cylinder {<0, 0, -0.09>, <0, 0, 0.09>, 0.61 }
                 cylinder {<0, 0, -0.095>,<0, 0, 0.095>, 0.58 }
                 texture { pigment { cor_roda } finish { finish_roda} }
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
     
   

    union{                    
        difference{
            difference{                
                difference{  
                    difference{
                        cylinder { <0,0,0.01>,<0,0,-0.01>,0.18} 
                        cylinder { <0,0,0.02>,<0,0,-0.02>,0.12}
                    }           
                    
                    #local angulo = 0; 
                    #local totalEsferas = 12;
                    #local i = 0;
                    
                    #while(i < totalEsferas)
                       cylinder {<0,0.25,-0.05>, <0,0.25,0.05>, 0.1 rotate<0,0,angulo>}
                        #declare angulo = angulo + 30;
                        #declare i = i + 1;
                    #end 
                    } 
                      
                    #local angulo = 15; 
                    #local totalEsferas = 12;
                    #local i = 0;
                    
                    #while(i < totalEsferas)
                         cylinder {<0,0.255,-0.05>, <0,0.255,0.05>, 0.1  rotate<0,0,angulo>}
                        #declare angulo = angulo + 30;
                        #declare i = i + 1;
                    #end  
        
            } 
                #local angulo = 0; 
                #local totalEsferas = 36;
                #local i = 0;
                
                #while(i < totalEsferas)
                    cylinder {<0,0.135,-0.1>, <0,0.135,0.1>, 0.0040 texture {pigment { cor_roda } finish { finish_roda}} rotate<0,0,angulo>}
                    #declare angulo = angulo + 10;
                    #declare i = i + 1;
                #end
                
          }             
          
                    difference{
                         union{
                            #local total = 6;
                            #local i = 0; 
                            #local angulo = 0 ;
                            
                            #while(i < total)
                                     
                               union{    
                                 isosurface { //-------------------------------------------------------------
                                  function{
                                     f_spiral(
                                        x,y,z,
                                        1.5,  // distance between windings,
                                        0.01, // thickness,
                                        0.24,  // outer diameter of the spiral,
                                        0,    // not used,
                                        0,    // not used,
                                        0.01   // cross section type
                                     )
                                  }          
                                
                                 threshold 0
                                 max_gradient 5
                                 rotate<90,0,0>
                                 scale 0.5
                                 translate< 0,0,0>
                                } // end of isosurface -------------------------------------------------------
                                   
                                  rotate <0,0,angulo>  
                               } 
                                       
                                #declare angulo = angulo + 60;
                                #declare i = i + 1;
                            #end   
                            cylinder { <0,0,0.015>,<0,0,-0.015>,0.022} 
                          } 
                          
                        cylinder { <0,0,0.02>,<0,0,-0.02>,0.02}    
                                
                    }  
                            
               texture {pigment {color rgb<0.05,0.05,0.05>} 
               
                          finish {
                            ambient 0.1
                            diffuse 1
                            reflection 0.35
                            specular 0.1 
                            metallic
                         }   
                     }
                     
         translate <-2.65,0.80,0>
      }
          
          
 #declare ini_lado_esq = 0.09;
 #declare ini_lado_dirr = 0.045;         

  #declare roda = union{
  
        // Roda       
        difference{
             cylinder {<0, 0, 0>, <0, 0, 0.18>, 0.61 }
             cylinder {<0, 0, -0.1>,<0, 0, 0.19>, 0.58 }
             texture { pigment { cor_roda } finish { finish_roda} }
        }
         
         
        // Centro da roda    
        difference{
             cylinder {<0, 0, ini_lado_esq>, <0, 0, ini_lado_dirr>, 0.048 }
             cylinder {<0, 0, -0.1>, <0, 0, 0.19>, 0.036 } 
             texture { pigment { cor_roda } finish { finish_roda} }
        }
        

  }        
      
      
  #declare nova_roda_dianteira = union{
  
            

                                        
      
  
         object{ roda }
                           
                           
         #declare grossura_aros = 0.0055;

                                    
         #declare fim_lado_esq_1 = 0.05;
         #declare fim_lado_esq_2 = -0.09;                        
                                    
                                    
                                    
         #declare fim_pares = 0.075;
         #declare fim_impar = -0.165;   
         

        //Aros roda dianteira 
        
          // LADO ESQUERDO 
          /*union{
              #local i = 0;
              #local numAros = 12;
              #local angulo = 0;
              
              #while(i < numAros)
                union{
                    cylinder {<0, 0, ini_lado_esq>, <0, 0.58, fim_lado_esq_1>, grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                    //cylinder {<0, 0.54, fim_pares>, <0, 0.58, fim_pares>, grossura_aros+0.003 texture {pigment { cor_roda } finish { finish_roda}}}  
                    rotate<0,0,angulo>
                }
                #declare angulo = angulo + 15;
                #declare i = i + 1;
              #end
     
          } 
             
             
          
          union{
              #local i = 0;
              #local numAros = 12;
              #local angulo = 7.5;
              
              #while(i < numAros)
                union{
                    cylinder {<0, 0, ini_lado_esq>, <0, 0.58, fim_lado_esq_2>, grossura_aros texture {pigment { cor_roda } finish { finish_roda}}}
                    //cylinder {<0, 0.54, fim_pares>, <0, 0.58, fim_pares>, grossura_aros+0.003 texture {pigment { cor_roda } finish { finish_roda}}}  
                    rotate<0,0,angulo>
                }
                #declare angulo = angulo + 15;
                #declare i = i + 1;
              #end
     
          } 
               */
          
          
          
          
          
                        
      
            
                
  
  }
    
     
     
     
     
   
   
   
      
      

         
                  
                  
                      
                      
   nova_roda_dianteira                   

  // roda_dianteira