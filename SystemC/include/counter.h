#ifndef COUNTER_H
#define COUNTER_H

#include <systemc.h>
#include "constants.h"

SC_MODULE(CounterModule){
  // Inputs
  sc_in<bool> clk;
  sc_in<bool> reset;
  sc_in<bool> up_down_ctrl;
  sc_in<bool> count_enable;

  //Outputs
  sc_out<sc_uint<N> > count_out;
  sc_out<bool> overflow_intr;
  sc_out<bool> underflow_intr;

  // Variables
  sc_uint<N> count;

  // Main function of the module
  void do_count();

  SC_CTOR(CounterModule){
    SC_METHOD(do_count);
    sensitive << clk.pos();
  }
};

#endif
