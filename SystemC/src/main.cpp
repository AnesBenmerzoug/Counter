#include <systemc.h>
#include "counter.h"
#include "counter_tb.h"
#include "constants.h"

int sc_main(int argc, char* argv[]){
  CounterModule* counter = new CounterModule("Counter");
  CounterTestbench* testbench = new CounterTestbench("Testbench");

  sc_clock Clock("Clock", 10, SC_NS, 0.5, 10, SC_NS, false);
  sc_signal<bool> Reset;
  sc_signal<bool> Count_Enable;
  sc_signal<bool> Up_Down_Ctrl;
  sc_signal<sc_uint<N> > Count_Out;
  sc_signal<bool> Overflow_Intr;
  sc_signal<bool> Underflow_Intr;

  counter->clk(Clock);
  counter->reset(Reset);
  counter->count_enable(Count_Enable);
  counter->up_down_ctrl(Up_Down_Ctrl);
  counter->count_out(Count_Out);
  counter->overflow_intr(Overflow_Intr);
  counter->underflow_intr(Underflow_Intr);

  testbench->clk(Clock);
  testbench->reset(Reset);
  testbench->count_enable(Count_Enable);
  testbench->up_down_ctrl(Up_Down_Ctrl);
  testbench->count_out(Count_Out);
  testbench->overflow_intr(Overflow_Intr);
  testbench->underflow_intr(Underflow_Intr);

  cout << "Starting simulation" << endl;

  sc_start();

  return 0;
}
