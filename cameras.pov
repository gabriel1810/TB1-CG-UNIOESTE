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
                                                        
                            
#declare Camera_diagonal_traseira_esquerda = camera {angle 20     
                            location  <20.0 , 1.0 , 15>
                            right    -x*image_width/image_height
                            look_at   <0 , 1.0 , 0.0>}

#declare Camera_diagonal_traseira_direita = camera {angle 20     
                            location  <5 , 2 , -10>
                            right    -x*image_width/image_height
                            look_at   <-2 , 0.7 , 0.0>}
                                                        
                            
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
