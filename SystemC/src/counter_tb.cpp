#include "../include/counter_tb.h"

void counter_testbench::do_testbench(){
  cout << "@" << sc_time_stamp() << " Creating VCD file" << endl;
  sc_trace_file* wf = sc_create_vcd_trace_file("vcd/counter");
  cout << "@" << sc_time_stamp() << " Dumping the desired signals" << endl;
  sc_trace(wf, clk, "clock");
  sc_trace(wf, reset, "reset");
  sc_trace(wf, count_enable, "counter_enable");
  sc_trace(wf, up_down_ctrl, "up/down_control");
  sc_trace(wf, count_out, "counter_output");
  sc_trace(wf, overflow_intr, "overflow_interrupt");
  sc_trace(wf, underflow_intr, "underflow_interrupt");

  cout << "@" << sc_time_stamp() << " Setting Reset to 1" << endl;
  reset.write(true);
  wait(1);
  cout << "@" << sc_time_stamp() << " Setting Reset to 0 and Up/Down Control to 0 (Decrement)" << endl;
  reset.write(false);
  count_enable.write(false);
  up_down_ctrl.write(false);
  wait(3);
  cout << "@" << sc_time_stamp() << " Setting Counter Enable to 1" << endl;
  count_enable.write(true);
  wait(5);
  cout << "@" << sc_time_stamp() << " Setting Up/Down Control to 1 (Increment)" << endl;
  up_down_ctrl.write(true);
  wait(20);
  cout << "@" << sc_time_stamp() << " Setting Reset to 1" << endl;
  reset.write(true);
  wait(2);
  cout << "@" << sc_time_stamp() << " Setting Reset to 0" << endl;
  reset.write(false);
  wait(50);

  sc_stop();
}
