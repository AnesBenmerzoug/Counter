#include "counter.h"

void CounterModule::do_count(){
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
        overflow_intr.write(count == 0 ? true : false);
        underflow_intr.write(false);
      }
      else{
        count -=1;
        count_out.write(count);
        overflow_intr.write(false);
        underflow_intr.write(count == (1 << N) - 1 ? true : false);
      }
    }
  }
}
