#include "../include/counter.h"

void counter_module::do_count(){
  if(reset.read() == true){
    count = 0;
  }
  else{
    if(count_enable.read() == true){
      count += 1;
    }
  }
}
