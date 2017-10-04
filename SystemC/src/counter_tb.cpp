#include "../include/counter_tb.h"

void counter_testbench::do_testbench(){
  wait();
  reset.write(true);
  wait(5);
  reset.write(false);
  count_enable.write(false);
  up_down_ctrl.write(false);
  wait();

  sc_stop();
}
