#include "../include/counter.h"

void counter_module::do_count(){
  if(reset.read() == true){
    count = 0;
    count_out.write(count);
    overflow_intr.write(false);
    underflow_intr.write(false);
  }
  else{
    if(count_enable.read() == true){
      if(up_down_ctrl.read() == true){
        count +=1;
        count_out.write(count);
        if(count == 0)
          overflow_intr.write(true);
        else
          overflow_intr.write(false);
        underflow_intr.write(false);
      }
      else{
        count -=1;
        count_out.write(count);
        overflow_intr.write(false);
        if(count == 0x1FFFF)
          underflow_intr.write(true);
        else
          underflow_intr.write(false);
      }
    }
  }
}
