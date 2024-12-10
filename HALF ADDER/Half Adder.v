\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   $out_sum = $in0 ^ $in1 ;
   $out_carry = $in0 && $in1  ;
   
   
   \viz_js
      init(){
      let ret = {}
      ret.heading = new fabric.Text( "Half Adder" , {top: 0, left: 0})
      ret.image  = this.newImageFromURL( "https://upload.wikimedia.org/wikipedia/commons/b/b0/Half_adder_using_xor.png?20070417123224" ,
      "",
      { left: 80, top : 50 , scaleX: 1 , scaleY: 1, originX: "center",
      })
      ret.in0 = new fabric.Text("0", 
      {left: 10, top : 55, fontSize: 12 , originY: "center"
      })
      ret.in1 = new fabric.Text("0", 
      {left: 10, top : 105 , fontSize: 12 , originY: "center"
      })
      ret.out = new fabric.Text("0", 
      {left: 140, top : 100 , fontSize: 16 , originY: "center"
      })
      ret.out1 = new fabric.Text("0", 
      {left: 140, top : 65 , fontSize: 16 , originY: "center"
      })
      return ret
      
      },
      render(){
      let ret = this.getObjects()
      ret.in0.set({text: '$in0' .asBinaryStr()})
      ret.in1.set({text: '$in1' .asBinaryStr()})
      ret.out1.set({text: '$out_sum' .asBinaryStr()})
      ret.out.set({text: '$out_carry' .asBinaryStr()})
      }
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule