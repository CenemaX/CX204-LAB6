`timescale 1ns / 1ps


module data_mem #(parameter n=32)(
input logic clk,
input logic reset_n,
input logic mem_write,
input logic [n-1:0]addr,
input logic [n-1:0]wdata,
output logic [n-1:0]rdata1, //after load 
input logic [3:0] wsel 
 );
 
 logic [n-1:0]rdata; // before the load
 
 logic [n-1:0] dmem[0:1023];  //for creatign the mem elments 
 
 always@(posedge clk, negedge reset_n) // fillign the mem
 begin 
        if(!reset_n)
        begin 
            for( int i = 0; i<100; i = i+1) begin 
                dmem[i]<=0;
            end
        end
            
        else if (mem_write)
            dmem[addr][31:0]<=wdata[31:0];
        // we have a wsel[3:0] signal
//        if(wsel[0]) dmem[addr[31:2]][7:0]<= wdata[7:0];
//        if(wsel[1]) dmem[addr][15:8]<= wdata[15:8];
//        if(wsel[2]) dmem[addr][7:0]<= wdata[7:0];
//        if(wsel[3]) dmem[addr][7:0]<= wdata[7:0];    
            
 
 end 
 
  assign rdata=dmem[addr];
 
 logic [7:0] out_b;
 logic [15:0]out_hb;
 logic [31:0]out_bsig,out_busig,out_hbsig,out_hbusig;
 logic [31:0]finl_b,finl_hb;
 
 always@(*)begin // first mux 
 
   case(addr[1:0])
     
     0:
     out_b=rdata[7:0];
     
     1:
     out_b=rdata[15:8];
     
     2:
     out_b=rdata[23:16];       
     
     3:
     out_b=rdata[31:24];   
   endcase
   
 end 
 
 

  assign out_busig[7:0]=out_b[7:0]; //for sig and unsig for byet
  assign out_busig[31:8]=24'b0;
 
  assign out_bsig[7:0]=out_b[7:0];
  assign out_bsig[31:8]={(24){out_b[7]}};
  
  
  
 logic lb; //control sig 
 
 assign finl_b= lb ? out_bsig:out_busig;   // 2 mux 
  
 
 
 assign out_hb=addr[1]? rdata[15:0]:rdata[31:16]; //3 mux
 
 
  assign out_hbusig[15:0]=out_hb[15:0]; //for sig and unsig for half byet
  assign out_hbusig[31:16]=16'b0;
 
  assign out_hbsig[15:0]=out_hb[15:0];
  assign out_hbsig[31:16]={(16){out_hb[15]}};
  
  
  logic lh; //control sig
  
  assign finl_hb=lh? out_hbsig:out_hbusig; // 4 mux
  
  
  
  logic [1:0]load; // control sig 
  
   always@(*)begin // last mux 
 
   case(load)
     
     0:
     rdata1=finl_b;
     
     1:
     rdata1=finl_hb;
     
     2:
     rdata1=rdata;       
     
        
   endcase
   
 end 
 
 
 
endmodule
