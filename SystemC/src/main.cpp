#include <systemc.h>
#include "../include/counter.h"
#include "../include/counter_tb.h"

int sc_main(int argc, char* argv[]){
  counter_module* counter = new counter_module("Counter");
  counter_testbench* testbench = new counter_testbench("Testbench");

  sc_clock Clock("Clock", 10, SC_NS, 0.5, 10, SC_NS);
  sc_signal<bool> Reset;
  sc_signal<bool> Count_Enable;
  sc_signal<bool> Up_Down_Ctrl;
  sc_signal<sc_uint<17> > Count_Out;
  sc_signal<bool> Overflow_Intr;
  sc_signal<bool> Underflow_Intr;

  counter->clock(Clock);
  counter->reset(Reset);
  counter->count_enable(Count_Enable);
  counter->up_down_ctrl(Up_Down_Ctrl);
  counter->count_out(Count_Out);
  counter->overflow_intr(Overflow_Intr);
  counter->underflow_intr(Underflow_Intr);

  testbench->clock(Clock);
  testbench->reset(Reset);
  testbench->count_enable(Count_Enable);
  testbench->up_down_ctrl(Up_Down_Ctrl);
  testbench->count_out(Count_Out);
  testbench->overflow_intr(Overflow_Intr);
  testbench->underflow_intr(Underflow_Intr);

  sc_start();

  return 0;
}
