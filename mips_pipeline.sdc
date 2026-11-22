# mips_pipeline.sdc - clock muc tieu 50 MHz (bang CLOCK_50 cua DE2)
create_clock -name clk -period 20.000 [get_ports {clk}]
derive_clock_uncertainty
