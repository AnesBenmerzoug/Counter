#ifndef COUNTER_TB_H
#define COUNTER_TB_H

#include <systemc.h>
#include "constants.h"

SC_MODULE(CounterTestbench){
  // Inputs
  sc_in<bool> clk;
  sc_in<sc_uint<N> > count_out;
  sc_in<bool> overflow_intr;
  sc_in<bool> underflow_intr;

  //Outputs
  sc_out<bool> reset;
  sc_out<bool> up_down_ctrl;
  sc_out<bool> count_enable;

  // Main function of the module
  void do_testbench();

  SC_CTOR(CounterTestbench){
    SC_THREAD(do_testbench);
    sensitive << clk.pos();
  }
};

#endif
