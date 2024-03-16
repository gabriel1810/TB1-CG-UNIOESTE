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
                            location  <-0.5 , 0.8 , 15>
                            right    -x*image_width/image_height
                            look_at   <-0.5 , 0.8 , 0>}            
                            
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

 #declare cor_principal = pigment {color Green}
    #declare finish_chassi = finish {
                                ambient 0.1
                                diffuse 0.9
                                reflection 0.02
                                specular 0.2 
                                metallic
                             } 
                             

#declare chassi = union {
                             
     #declare grossuraTubosRodaTraseira = 0.04 ;   
    // Suporte direito roda traseira                                          
    union {     
      // Parte de cima   
      cylinder {
        <-0.035,-0.011,-0.18>, <-0.95,0.80,-0.043>, grossuraTubosRodaTraseira
        texture {
            pigment { cor_principal } 
            finish { finish_chassi}
        }
        scale <1,1,1> translate <0.5,0.8,0>
      }
    
      // Parte de baixo
      cylinder {
        <-0.01,0,-0.18>, <-1.30,0.02,-0.04>, grossuraTubosRodaTraseira
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



// APAGAR
#declare cor_roda = pigment {color rgb<1.1,1.1,1.1>};
#declare finish_roda = finish {
                            ambient 0.1
                            diffuse 1
                            reflection 0.002
                            specular 0.2
                            metallic
                         }    
          
 #declare disco_freio = union{                    
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
                        cylinder { <0,0,0.015>,<0,0,-0.015>,0.05} 
                      } 
                      
                    cylinder { <0,0,0.02>,<0,0,-0.02>,0.035}    
                            
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
      }
        
        
 #declare pneu = merge{
         torus {
            0.356, 0.05
            texture {
                pigment { color rgb<0.2,0.2,0.2> }
                finish {
                    ambient 0.1
                    diffuse 0.2
                    reflection 0.0009 
                }
            }
            scale <1.9,1.9,1.9> rotate <90,0,0>
        } 
 }


          
 #declare ini_lado_esq = 0.135;
 #declare ini_lado_dirr = 0.045;         

 #declare roda = union{
  
        // Roda       
        difference{
             cylinder {<0, 0, 0>, <0, 0, 0.18>, 0.61 }
             cylinder {<0, 0, -0.1>,<0, 0, 0.19>, 0.58 }
        } 
         
        // Centro da roda    
        difference{
             merge{
                cylinder {<0, 0, ini_lado_esq>, <0, 0, ini_lado_dirr>, 0.048 }
                cylinder {<0, 0, ini_lado_esq-0.01>, <0, 0, ini_lado_esq>, 0.052 }
                cylinder {<0, 0, ini_lado_dirr-0.01>, <0, 0, ini_lado_dirr>, 0.052 } 
              }
             cylinder {<0, 0, -0.1>, <0, 0, 0.19>, 0.036 } 
        }
        texture { pigment { cor_roda } finish { finish_roda} }
  }
  
  
  #declare aros = merge{
  #declare grossura_aros = 0.0055;
     difference{
               //Aros roda dianteira 
              merge{
                // LADO ESQUERDO
                  #local i = 0;
                  #local numAros = 9;
                  #local angulo = 0;
                  #while(i < numAros)
                    union{
                        cylinder {<0, 0, ini_lado_esq-0.0055>, <0, 0.58, ini_lado_dirr>, grossura_aros}
                        cylinder {<0, 0.54, ini_lado_dirr+0.005>, <0, 0.58, ini_lado_dirr>, grossura_aros+0.003}
                        rotate<0,0,angulo>
                    }
                    #declare angulo = angulo + 40;
                    #declare i = i + 1;
                  #end

                  #local i = 0;
                  #local numAros = 9;
                  #local angulo = 20;
                  
                  #while(i < numAros)
                    union{
                        cylinder {<0, 0, ini_lado_esq-0.0055>, <0, 0.58, ini_lado_esq>, grossura_aros}
                        cylinder {<0, 0.54, ini_lado_esq+0.005>, <0, 0.58, ini_lado_esq>, grossura_aros+0.003}
                         rotate<0,0,angulo>
                    }
                    #declare angulo = angulo + 40;
                    #declare i = i + 1;
                  #end
              
                  //LADO DIREITO 
                  #local i = 0;
                  #local numAros = 9;
                  #local angulo = 10;
                  #while(i < numAros)
                    union{
                        cylinder {<0, 0, ini_lado_dirr+0.0055>, <0, 0.58, ini_lado_esq>, grossura_aros}
                        cylinder {<0, 0.54, ini_lado_esq-0.005>, <0, 0.58, ini_lado_esq>, grossura_aros+0.003}
                        rotate<0,0,angulo>
                    }
                    #declare angulo = angulo + 40;
                    #declare i = i + 1;
                  #end
         
                  #local i = 0;
                  #local numAros = 9;
                  #local angulo = 30;
                  #while(i < numAros)
                    union{
                        cylinder {<0, 0, ini_lado_dirr+0.0055>, <0, 0.58, ini_lado_dirr>, grossura_aros}
                        cylinder {<0, 0.54, ini_lado_dirr-0.005>, <0, 0.58, ini_lado_dirr>, grossura_aros+0.003}
                        rotate<0,0,angulo>
                    }
                    #declare angulo = angulo + 40;
                    #declare i = i + 1;
                  #end
              }
                
               cylinder {<0, 0, -0.1>, <0, 0, 0.19>, 0.036 } 
              
           }
           texture {pigment { cor_roda } finish { finish_roda}}
  }        
     

  #declare roda_toda = merge{
            object {roda translate<0,0,-(ini_lado_dirr+0.05)>}
            object {aros translate<0,0,-(ini_lado_dirr+0.05)>}
            object {pneu} 
            object {disco_freio translate<0,0,0.12>} 
  } 
    
  #declare roda_traseira = union { 
         object{roda_toda }
            
} 
    
   
   
#declare chassi = merge{
     #declare grossuraTubosRodaTraseira = 0.04 ;
     #declare tamBarraSuporteRoda = 0.75; 
     #declare espacamentoSuporteRoda = 0.19;
     
     #declare cor_principal = pigment {color Green}
     #declare finish_chassi = finish { ambient 0.1 diffuse 0.9 reflection 0.05 specular 0.2 metallic} 
         
      // Suporte Esquerdo roda traseira     
      difference{    
           merge{
              cylinder { <0,0,0>, <-(tamBarraSuporteRoda+0.05),0,0>, grossuraTubosRodaTraseira rotate<0,0,-45> }
              cylinder { <0,0,0>, <-tamBarraSuporteRoda,0,0>, grossuraTubosRodaTraseira }
              sphere { <0,0,0>, 0.0395}
              cylinder {<-tamBarraSuporteRoda+0.02,0,0.005>, <-tamBarraSuporteRoda-0.18,0,-0.105>, grossuraTubosRodaTraseira rotate<0,0,0> }
              cylinder {<-tamBarraSuporteRoda-0.03,0,0.0045>, <-tamBarraSuporteRoda-0.36,0,-0.13>, grossuraTubosRodaTraseira rotate<0,0,-45> }
           }
           
           cylinder {<0, 0, -10>, <0, 0, 10>, 0.032 translate <-0.03,0.015,0> }
           rotate <0,-3,0> translate<0.03,-0.012,espacamentoSuporteRoda>
      }
        
      // Suporte lado Direito
      difference{    
           merge{
              cylinder { <0,0,0>, <-(tamBarraSuporteRoda+0.05),0,0>, grossuraTubosRodaTraseira rotate<0,0,-45> }
              cylinder { <0,0,0>, <-tamBarraSuporteRoda,0,0>, grossuraTubosRodaTraseira }
              sphere { <0,0,0>, 0.0395} 
              cylinder {<-tamBarraSuporteRoda+0.02,0,0.005>, <-tamBarraSuporteRoda-0.18,0,0.105>, grossuraTubosRodaTraseira rotate<0,0,0> }
              cylinder {<-tamBarraSuporteRoda-0.03,0,-0.003>, <-tamBarraSuporteRoda-0.36,0,0.13>, grossuraTubosRodaTraseira rotate<0,0,-45> }
             }
           
           cylinder {<0, 0, -10>, <0, 0, 10>, 0.032 translate <-0.03,0.015,0> }
           rotate <0,3,0>  translate<0.03,-0.012,-espacamentoSuporteRoda>
      }      
      
    
       // Tubo do selim
       merge{
           cylinder {  <0,0,-0.12>, <0,0,0.12>, 0.1  }
           cylinder { <0,0.05,0>, <0,0.9,0>, 0.07  rotate <0,0,-15>}  
           translate <-tamBarraSuporteRoda-0.18,0,0>
       }    
         
       merge{  

           // Barra central superior
           cylinder { <0,0,0>, <1.2,0,0>, grossuraTubosRodaTraseira rotate<0,0,165> translate <-tamBarraSuporteRoda,0.7,0>}   
           
           // Barra central inferior  
           cylinder { <0,0,0>, <1.10,0,0>, grossuraTubosRodaTraseira rotate<0,0,-220> translate <-tamBarraSuporteRoda-0.18,0,0>}
           cylinder { <0,0,0>, <0.2,0,0>, grossuraTubosRodaTraseira rotate<0,0,155> translate <-1.75,0.692,0>}
               
           // Conexao guidao-chassi-amortecedor   
           cylinder { <0,0.5,0>, <0,0.9,0>, 0.07  rotate <0,0,-15> translate <-2.10,0.22,0>}                                                        
        }
          
                           
        texture {
                pigment { cor_principal }
                finish {finish_chassi}
        }       

}   
   
object {roda_traseira }   
object {chassi}

        
                
         
            