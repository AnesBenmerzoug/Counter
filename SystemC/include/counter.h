#ifndef COUNTER_H
#define COUNTER_H

#include <systemc.h>

SC_MODULE(counter_module){
  // Inputs
  sc_in<bool> clock;
  sc_in<bool> reset;
  sc_in<bool> up_down_ctrl;
  sc_in<bool> count_enable;

  //Outputs
  sc_out<sc_uint<17> > count_out;
  sc_out<bool> overflow_intr;
  sc_out<bool> underflow_intr;

  // Variables
  sc_uint<17> count;

  // Main function of the module
  void do_count();

  SC_CTOR(counter_module){
    SC_CTHREAD(do_count, clock);
    reset_signal_is(reset, true);
  }
};

#endif
