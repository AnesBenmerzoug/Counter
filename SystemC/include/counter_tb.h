#ifndef COUNTER_TB_H
#define COUNTER_TB_H

#include <systemc.h>

SC_MODULE(counter_testbench){
  // Inputs
  sc_in<bool> clk;
  sc_in<sc_uint<17> > count_out;
  sc_in<bool> overflow_intr;
  sc_in<bool> underflow_intr;

  //Outputs
  sc_out<bool> reset;
  sc_out<bool> up_down_ctrl;
  sc_out<bool> count_enable;

  // Main function of the module
  void do_testbench();

  SC_CTOR(counter_testbench){
    SC_THREAD(do_testbench);
    sensitive << clk.pos();
  }
};

#endif
