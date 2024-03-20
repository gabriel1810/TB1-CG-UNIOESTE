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
#include "shapes3.inc"
//--------------------------------------------------------------------------  right handed, y up 

                            // Visao lado esquerdo
#declare Camera_visao_esquerda = camera {/*ultra_wide_angle*/ angle 15      
                            location  <0.0 , 1.0 , 15.0>
                            right    -x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
                            
                            
#declare Camera_visao_direita = camera {/*ultra_wide_angle*/ angle 20      
                            location  <0.0 , 1.0 , -10>
                            right    -x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}           
                            
                            
                            //Visao traseira
#declare Camera_visao_traseira = camera {angle 15     
                            location  <10.0 ,1.0 , 0.0>
                            right    -x*image_width/image_height
                            look_at   <-0.0 , 1.0 , 0.0>} 
                              
                              
#declare cemera_visao_cima = camera {angle 50     
                            location  <3 , 10 ,0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0.0>} 
                                                        
                            
#declare Camera_diagonal_traseira_esquerda = camera {angle 10     
                            location  <15.0 , 2.0 , 15>
                            right    -x*image_width/image_height
                            look_at   <0 , 1.0 , 0.0>}

#declare Camera_diagonal_traseira_direita = camera {angle 10     
                            location  <13 , 2.25 , -10>
                            right    -x*image_width/image_height
                            look_at   <-2 , 0.8 , 0.0>}
                                                        
                            
#declare Camera_pneu_traseiro = camera {angle 15     
                            location  <0.35 , 0.55 , -4>
                            right    -x*image_width/image_height
                            look_at   <0.35 , 0.55 , 0.0>}
                            
                            
#declare Camera_pneu_dianteiro = camera {angle 15     
                            location  <-1.92, 0.6 , -4>
                            right    -x*image_width/image_height
                            look_at   <-1.92 , 0.6 , 0.0>}
                                                    
                                                     
                                                    
#declare Camera_pneu_dianteiro_frente = camera {angle 15     
                            location  <-5, 0.6 , 0>
                            right    -x*image_width/image_height
                            look_at   <-1.92 , 0.6 , 0.0>}                            
                            
                            
                             
#declare Camera_amortecedor = camera {angle 35     
                            location  <-1.8 , 0.8 , 5>
                            right    -x*image_width/image_height
                            look_at   <-1.8 , 0.8 , 0.0>}
                            
                            
#declare Camera_frente_amortecedor = camera {angle 15     
                            location  <-15 , 2 , 0>
                            right    -x*image_width/image_height
                            look_at   <-2.4 , 1.3 , 0.0>}
                            
                             
#declare Camera_pinhao = camera {angle 15     
                            location  <0.5 , 0.8 , -8>
                            right    -x*image_width/image_height
                            look_at   <0.5 , 0.8 , 0>}                             
                            
                            
#declare Camera_centro_roda_dianteira = camera {angle 15     
                            location  <5 , 0.8 , 3>
                            right    -x*image_width/image_height
                            look_at   <-1.5 , 0.8 , 0.0>}    
                            
                            
#declare camera_0_0_0_cima = camera {/*ultra_wide_angle*/ angle 20      
                            location  <-0 , 5 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}                                  
                            

#declare camera_teste = camera {/*ultra_wide_angle*/ angle 20      
                            location  <-0 , 5 , 0>
                            right    -x*image_width/image_height
                            look_at   <0 , 0 , 0>}                               







                                                         
                   
camera{Camera_diagonal_traseira_direita}

#declare usarReflexos=1;
//------------------------------------------------------------------------
// sun -------------------------------------------------------------------
light_source{<1500,2500, -2500> color White}
// sky ---------------------------------------------------------------
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.76
                         color_map { [0.5 rgb <0.20, 0.20, 1.0>]
                                     [0.6 rgb <1,1,1>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   500
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8}



// ground ------------------------------------------------------------
plane { <0,1,0>, 0 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.9 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture
      } // end of plane
 

       
      
      
// Rodas      

#declare cor_roda = pigment {color rgb<0.45,0.45,0.45>};
#declare finish_roda = finish {
                            ambient 0.2
                            diffuse 0.6
                            reflection 0.15*usarReflexos
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
                        ambient 0.2
                        diffuse 0.6
                        reflection 0.15*usarReflexos
                        specular 0.2 
                        metallic
                     }   
                 }
      }
        
        
 #declare pneu = merge{
         torus {
            0.356, 0.05
                 
                texture { pigment{ color rgb<0.2,0.2,0.2>} 
                   normal { ripples 5.5 sine_wave  frequency 30 scale 0.8
                            }
                    finish {
                    ambient 0.1
                    diffuse 0.2
                    reflection 0 
                    phong 0.01 phong_size 60
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
            object {roda scale<0.75,0.75,0.75>   translate<0,0,-(ini_lado_dirr+0.05)>}
            object {aros scale<0.75,0.75,0.75>  translate<0,0,-(ini_lado_dirr+0.05)>}
            object {pneu scale<0.75,0.75,0.75> translate<0,0,-0.022>} 
            object {disco_freio translate<0,0,0.06> scale<1,1,0.85>}
  }                        
     

#declare pinhao =   merge{ 
            // Pinhão com 7 velocidades, relacao 11/25
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
                                  finish{ ambient 0.2 diffuse 0.8 reflection 0.4*usarReflexos specular 0.2  metallic }
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
   
        
  }

#declare roda_traseira = union { 
         object{roda_toda} 
         object {pinhao rotate<180,0,0> scale <0.065,0.065,0.065> translate<0.002,0,-0.11>}
            
} 

#declare roda_dianteira = union {    
       object{roda_toda }      
} 



#declare chassi = merge{
     #declare grossuraTubosRodaTraseira = 0.0285 ;
     #declare tamBarraSuporteRoda = 0.75; 
     #declare espacamentoSuporteRoda = 0.12;
     
     #declare cor_principal = pigment {color Red}
     #declare finish_chassi = finish { ambient 0.2 diffuse 0.6 reflection 0.1*usarReflexos specular 0.2 phong 0.5 phong_size 60 metallic} 
         
      // Suporte Esquerdo roda traseira     
      difference{    
           merge{ 
              // Tubo cima
              cylinder { <0,0,0>, <-(tamBarraSuporteRoda)*0.9,0,0>, grossuraTubosRodaTraseira*0.9 rotate<0,0,-45> }
              
              ////Ligacao tubo cima-tuboselim
              cylinder {<0,0,0>, <-0.28,0,0>, grossuraTubosRodaTraseira*0.9 rotate<0,-18,-45> translate<-0.47,0.468,0>}
             
                 
                 
               //Tubo baixo
              cylinder { <0,0,0>, <-tamBarraSuporteRoda*0.75,0,0>, grossuraTubosRodaTraseira*0.9 }
              sphere { <0,0,0>, grossuraTubosRodaTraseira*0.9 translate<-0.001,0,0>} 
              
              //Ligacao tubo baixo-tuboselim
              cylinder {<0,0,0>, <-0.22,0,0>, grossuraTubosRodaTraseira*0.88 rotate<0,-20,0> translate<-0.56,0,0>}
                                           
              }
           
           cylinder {<0, 0, -10>, <0, 0, 10>, 0.02 translate <-0.015,0.005,0> }
           rotate <0,-1,0> translate<-0.1,-0.012,espacamentoSuporteRoda>
      }  
                       
                       
      // Suporte lado Direito
      difference{    
           merge{
              // Tubo cima
              cylinder { <0,0,0>, <-(tamBarraSuporteRoda)*0.9,0,0>, grossuraTubosRodaTraseira*0.9 rotate<0,0,-45> }
              
              ////Ligacao tubo cima-tuboselim
              cylinder {<0,0,0>, <-0.28,0,0>, grossuraTubosRodaTraseira*0.9 rotate<0,18,-45> translate<-0.47,0.468,0>}
             
              
              //Tubo baixo
              cylinder { <0,0,0>, <-tamBarraSuporteRoda*0.75,0,0>, grossuraTubosRodaTraseira*0.9 }
              sphere { <0,0,0>, grossuraTubosRodaTraseira*0.9 translate<-0.001,0,0>} 
              
              //Ligacao tubo baixo-tuboselim
              cylinder {<0,0,0>, <-0.22,0,0>, grossuraTubosRodaTraseira*0.88 rotate<0,20,0> translate<-0.56,0,0>}
                          
             }
           
           cylinder {<0, 0, -10>, <0, 0, 10>, 0.02 translate <-0.015,0.005,0> }
           rotate <0,1,0>  translate<-0.1,-0.012,-espacamentoSuporteRoda>
      }
            
      
    
       // Tubo do selim
       merge{
           cylinder {  <0,0,-0.07>, <0,0,0.07>, 0.08  }
           cylinder { <0,0.05,0>, <0,0.9,0>, 0.055  rotate <0,0,-15>}  
           translate <-tamBarraSuporteRoda-0.18,0,0>
       }  
         
       merge{  

           // Barra central superior
           cylinder { <0,0,0>, <1.3,0,0>, grossuraTubosRodaTraseira+0.005 rotate<0,0,165> translate <-tamBarraSuporteRoda,0.7,0>}   
           
           // Barra central inferior  
           cylinder { <0,0,0>, <1.12,0,0>, grossuraTubosRodaTraseira+0.005 rotate<0,0,-219.5> translate <-tamBarraSuporteRoda-0.18,0,0>}
           cylinder { <0,0,0>, <0.25,0,0>, grossuraTubosRodaTraseira+0.005 rotate<0,0,155> translate <-1.78,0.705,0>}
               
           // Conexao guidao-chassi-amortecedor   
           cylinder { <0,0.5,0>, <0,0.9,0>, 0.055  rotate <0,0,-15> translate <-2.2,0.25,0>}                                                        
        }
          
            
            

        

        object{ Pyramid_N_AB( 8, <0,0,0>,      0.011, <0,0.035,0>, 0.05 ) 

                 rotate< 90,0, 0>  translate< -0.1125, -0.01, -0.16>
              } 

        object{ Pyramid_N_AB( 8, <0,0,0>,      0.011, <0,0.035,0>, 0.05 ) 

                rotate< -90,0, 0>  translate< -0.1125, -0.01, 0.16>
              } 
    
        cylinder{<0,0,0>,<0,0,0.295> 0.022 translate<-0.1125,-0.01,-0.148>}
                           
        texture {
                pigment { cor_principal }
                finish {finish_chassi}
        }
        
                                           
} 
  
  
  
#declare cor_amortecedor1 = pigment {color Gray}
#declare cor_amortecedor2 = pigment {color Black}

#declare finish_amortecedor = finish { ambient 0.2 diffuse 0.6 reflection 0.1*usarReflexos specular 0.2  metallic }    


#declare amortecedor =  merge{
    #declare tamanhoInternoAmortecedor = 0.3;
    #declare tamanhoExternoAmortecedor = 0.5;  
       
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
            
            translate <0,-tamanhoInternoAmortecedor*2.15,0>
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
        
            cylinder{<0,0,0>,<0,0,0.4> 0.02
             texture {
                pigment { cor_amortecedor1 }
                finish {finish_amortecedor}
             } 
                 translate<-0.0045,-0.66,-0.2>
            }
                
                
            
          sphere { <0,0,0>, 0.0525 

        texture {
                pigment { cor_amortecedor1 }
                finish {finish_amortecedor}
             }  // end of texture                                     

          scale<1,1,1>  rotate<0,0,0>  translate<0,-0.63,-0.188>  
       }  
         
         
          sphere { <0,0,0>, 0.0525 

        texture {
                pigment { cor_amortecedor1 }
                finish {finish_amortecedor}
             }  // end of texture                                     

          scale<1,1,1>  rotate<0,0,0>  translate<0,-0.63,0.188>  
       }  

  
            
            
            
        
        rotate <0,0,-15>      
 
}


#declare guidao = union{
    #declare tamanhoGuidao = 4;
    #declare grosGuidao = 0.15;
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
    cylinder{ <0,0,0>,<-1.6,0,0> 0.08 rotate<0,-3,0> scale<1,1.5,1> translate<0,0,-0.29> }
              
         
    
    merge{ 
        merge{
            cylinder{ <-1.75,0,0>,<-1.75,0,-0.75> 0.065 rotate<0,-3,0>  translate<0,0,-0.29> }
             object{ Supertorus( 1.00, 0.25,0.25, 0.45,0.001, 1.50) 
                scale <0.28,0.25,0.25> 
                rotate<0,-3,0> 
                translate<-1.72,0,-0.82>
              }  
          texture { 
            pigment {color rgb<0.05,0.05,0.05>}
            finish{ ambient 0.2 diffuse 0.6 reflection 0 specular 0.2  }
            }   
         }
          
        box { <0, 0,0>,< 0.005, 0.10, 0.4>   
            texture { pigment{ color rgb< 1.0, 0.65, 0.0>}  finish { phong 1 phong_size 60 reflection 0.5  } } 
            rotate<0,-3,0> translate<-1.365,-0.05,-1> 
        }
        
        
        box { <0, 0,0>,< 0.005, 0.10, 0.4>   
            texture { pigment{ color rgb< 1.0, 0.65, 0.0>}  finish { phong 1 phong_size 60 reflection 0.5 } } 
            rotate<0,-3,0> translate<-2.058,-0.05,-1.05> 
        }  
    
         rotate <0,0,-15> translate <0.2,-0.42,0>
    
    }   
       rotate<0,-1,0>
                  

     texture { 
        finish{ ambient 0.2 diffuse 0.6 reflection 0.05 specular 0.2 phong 0.5 phong_size 60 metallic }
        pigment {color rgb<0.05,0.05,0.05>} 
    }  
 
}       


#declare pedalTodo = merge {
 object {pedivela} 
 object {pedal}
 cylinder{<0,0,0>,<0,0,1.10> 0.2 translate <0,0,-0.1> texture { 
        finish{ ambient 0.2 diffuse 0.6 reflection 0.05 specular 0.2 phong 0.5 phong_size 60 metallic }
        pigment {color rgb<0.05,0.05,0.05>} 
    }  } 
 object {pedal  rotate<-180,0,-180> translate <0,0,0.75>}
 

}     


 #declare banco =  merge {
    difference{
      difference{
        merge {
            object{Round_Cone2( <0,0,0>, 0.70, <0,1.00,0>, 0.40, 0 ) translate<0.35,0,0> scale<1,1.5,1>  rotate<0,0,11> }
            object{ Round_Cone2( <0,0,0>, 0.70    , <0,1.00,0>, 0.40 , 0 ) translate<-0.35,0.0,0> scale<1,1.5,1>  rotate<0,0,-11> } 
         }     
       
        sphere{ <0,0,0>, 0.5 scale<1.5,0.2,10> rotate<0,0,90> translate<0,0.8,1> }
        rotate<-90,90,0>
       }          
        sphere{ <0,0,0>, 0.5 scale<5,1,2> translate<0,-0.4,0> } 
        
        
        
        texture{ pigment{ color rgb<0.2,0.2, 0.2> } 
                 finish{ ambient 0.2 diffuse 0.6 reflection 0 specular 0.2 phong 0.5 phong_size 60 }
        
        } 
        
  } 
     cylinder {<0,0,0>,<0,1.2,0> 0.225 rotate<0,0,-8>   translate<-0.2,-0.7,-0.02>
        texture{ pigment{ color rgb<0.05,0.05, 0.05> } 
                 finish{ ambient 0.2 diffuse 0.4 reflection 0.1 specular 0.2 phong 0.2 phong_size 60 metallic }
                 
        
        } 
     }
    
  }




 

#declare bicicleta = merge{

object {chassi rotate<0,0,-1> translate<0.438,0.8,-0.022>} 
object {roda_dianteira translate<-1.835,0.85,0> }
object {roda_traseira translate<0.323,0.8,0> }
object {amortecedorCompleto rotate<0,0,-1> translate<-1.65,1.48,-0.022>}
object {guidao rotate<0,0,-15> translate<-8.35,10.4,-0.105> scale <0.2,0.2,0.15>}
object {pedalTodo scale <0.2,0.2,0.2> translate<-0.5,0.82,-0.105>}
object {banco scale<0.16,0.115,0.15> rotate<0,0,-5> translate <-0.205,1.75,-0.02> } 

}
   
object {bicicleta translate<0,-0.22,-1.2> rotate<0,0,1.5>}   


box { <-2.25, 0.00, -1000>,< 2.25, 0.002, 1000>                            
                                               
      texture{ pigment{ color rgb< 1, 0.2, 0.2>*0.6}
               normal { bumps 0.5 scale 0.005}
               finish { phong 0.1}
             } // end of texture

      scale <1,1,1> rotate<0,90,0> translate<0,0,0> 
    } // end of box --------------------------------------  
    
    
   #local i = 0;
   #local inicio = -100;
   #local fim = -100.5;
          
   #while(i < 200)
        box { <-0.1, 0, inicio>,< 0.1, 0.003, fim>                            
                                               
      texture{ pigment{ color rgb< 1, 1, 1>}
               normal { bumps 0.5 scale 0.005}
               finish { phong 0.1}
             } // end of texture

      scale <1,1,1> rotate<0,90,0> translate<0,0,0> 
    } 

   
        #declare inicio = inicio + 1;
        #declare fim = fim + 1;
        #declare i = i+1;
   #end
   
          
          
 box { <-2.75, 0.00, -1000>,< 2.75, 0.001, 1000>                            
                                               
      texture{ pigment{ color rgb< 1, 1, 1>}
               normal { bumps 0.5 scale 0.005}
               finish { phong 0.1}
             } // end of texture

      scale <1,1,1> rotate<0,90,0> translate<0,0,0> 
    } // end of box --------------------------------------
     
     
  
  
  
     
     
box { <-34, 0.00, -1000>,< -4, 0.002, 1000>                            
                                               
      texture{ pigment{ color rgb<0.1,0.1,0.1 >}
               normal { bumps 0.5 scale 0.005}
               finish { phong 0.1}
             } // end of texture

      scale <1,1,1> rotate<0,90,0> translate<0,0,0> 
    } // end of box --------------------------------------  
                     
                     

   #local i = 0;
   #local inicio = -100;
   #local fim = -100.5;
          
   #while(i < 200)
        box { <-15, 0, inicio>,< -15.25, 0.003, fim>                            
                                               
      texture{ pigment{ color rgb< 1.0, 0.65, 0.0>}
               normal { bumps 0.5 scale 0.005}
               finish { phong 0.1}
             }

      scale <1,1,1> rotate<0,90,0> translate<0,0,0> 
    } 

   
        #declare inicio = inicio + 1;
        #declare fim = fim + 1;
        #declare i = i+1;
   #end
   
                  
                  
          
 box { <-34.5, 0.00, -1000>,<-3.5 , 0.001, 1000>                            
                                               
      texture{ pigment{ color rgb< 1, 1, 1>}
               normal { bumps 0.5 scale 0.005}
               finish { phong 0.1}
             } // end of texture

      scale <1,1,1> rotate<0,90,0> translate<0,0,0> 
    } // end of box --------------------------------------
