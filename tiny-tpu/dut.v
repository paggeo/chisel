module accumCol(
  input        clock,
  input        reset,
  input        io_clear,
  input        io_rd_en,
  input        io_wr_en,
  input  [3:0] io_rd_addr,
  input  [3:0] io_wr_addr,
  input  [7:0] io_wr_data,
  output [7:0] io_rd_data
);
  reg [7:0] mem [0:15]; // @[accumCol.scala 19:16]
  wire  mem_MPORT_1_en; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_1_addr; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_1_data; // @[accumCol.scala 19:16]
  wire  mem_io_rd_data_MPORT_en; // @[accumCol.scala 19:16]
  wire [3:0] mem_io_rd_data_MPORT_addr; // @[accumCol.scala 19:16]
  wire [7:0] mem_io_rd_data_MPORT_data; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_2_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_2_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_2_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_2_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_3_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_3_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_3_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_3_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_4_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_4_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_4_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_4_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_5_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_5_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_5_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_5_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_6_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_6_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_6_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_6_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_7_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_7_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_7_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_7_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_8_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_8_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_8_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_8_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_9_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_9_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_9_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_9_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_10_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_10_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_10_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_10_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_11_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_11_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_11_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_11_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_12_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_12_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_12_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_12_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_13_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_13_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_13_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_13_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_14_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_14_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_14_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_14_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_15_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_15_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_15_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_15_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_16_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_16_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_16_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_16_en; // @[accumCol.scala 19:16]
  wire [7:0] mem_MPORT_17_data; // @[accumCol.scala 19:16]
  wire [3:0] mem_MPORT_17_addr; // @[accumCol.scala 19:16]
  wire  mem_MPORT_17_mask; // @[accumCol.scala 19:16]
  wire  mem_MPORT_17_en; // @[accumCol.scala 19:16]
  assign mem_MPORT_1_en = io_wr_en;
  assign mem_MPORT_1_addr = io_wr_addr;
  assign mem_MPORT_1_data = mem[mem_MPORT_1_addr]; // @[accumCol.scala 19:16]
  assign mem_io_rd_data_MPORT_en = io_rd_en;
  assign mem_io_rd_data_MPORT_addr = io_rd_addr;
  assign mem_io_rd_data_MPORT_data = mem[mem_io_rd_data_MPORT_addr]; // @[accumCol.scala 19:16]
  assign mem_MPORT_data = mem_MPORT_1_data + io_wr_data;
  assign mem_MPORT_addr = io_wr_addr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wr_en;
  assign mem_MPORT_2_data = 8'h0;
  assign mem_MPORT_2_addr = 4'h0;
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = io_clear;
  assign mem_MPORT_3_data = 8'h0;
  assign mem_MPORT_3_addr = 4'h1;
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = io_clear;
  assign mem_MPORT_4_data = 8'h0;
  assign mem_MPORT_4_addr = 4'h2;
  assign mem_MPORT_4_mask = 1'h1;
  assign mem_MPORT_4_en = io_clear;
  assign mem_MPORT_5_data = 8'h0;
  assign mem_MPORT_5_addr = 4'h3;
  assign mem_MPORT_5_mask = 1'h1;
  assign mem_MPORT_5_en = io_clear;
  assign mem_MPORT_6_data = 8'h0;
  assign mem_MPORT_6_addr = 4'h4;
  assign mem_MPORT_6_mask = 1'h1;
  assign mem_MPORT_6_en = io_clear;
  assign mem_MPORT_7_data = 8'h0;
  assign mem_MPORT_7_addr = 4'h5;
  assign mem_MPORT_7_mask = 1'h1;
  assign mem_MPORT_7_en = io_clear;
  assign mem_MPORT_8_data = 8'h0;
  assign mem_MPORT_8_addr = 4'h6;
  assign mem_MPORT_8_mask = 1'h1;
  assign mem_MPORT_8_en = io_clear;
  assign mem_MPORT_9_data = 8'h0;
  assign mem_MPORT_9_addr = 4'h7;
  assign mem_MPORT_9_mask = 1'h1;
  assign mem_MPORT_9_en = io_clear;
  assign mem_MPORT_10_data = 8'h0;
  assign mem_MPORT_10_addr = 4'h8;
  assign mem_MPORT_10_mask = 1'h1;
  assign mem_MPORT_10_en = io_clear;
  assign mem_MPORT_11_data = 8'h0;
  assign mem_MPORT_11_addr = 4'h9;
  assign mem_MPORT_11_mask = 1'h1;
  assign mem_MPORT_11_en = io_clear;
  assign mem_MPORT_12_data = 8'h0;
  assign mem_MPORT_12_addr = 4'ha;
  assign mem_MPORT_12_mask = 1'h1;
  assign mem_MPORT_12_en = io_clear;
  assign mem_MPORT_13_data = 8'h0;
  assign mem_MPORT_13_addr = 4'hb;
  assign mem_MPORT_13_mask = 1'h1;
  assign mem_MPORT_13_en = io_clear;
  assign mem_MPORT_14_data = 8'h0;
  assign mem_MPORT_14_addr = 4'hc;
  assign mem_MPORT_14_mask = 1'h1;
  assign mem_MPORT_14_en = io_clear;
  assign mem_MPORT_15_data = 8'h0;
  assign mem_MPORT_15_addr = 4'hd;
  assign mem_MPORT_15_mask = 1'h1;
  assign mem_MPORT_15_en = io_clear;
  assign mem_MPORT_16_data = 8'h0;
  assign mem_MPORT_16_addr = 4'he;
  assign mem_MPORT_16_mask = 1'h1;
  assign mem_MPORT_16_en = io_clear;
  assign mem_MPORT_17_data = 8'h0;
  assign mem_MPORT_17_addr = 4'hf;
  assign mem_MPORT_17_mask = 1'h1;
  assign mem_MPORT_17_en = io_clear;
  assign io_rd_data = io_rd_en ? mem_io_rd_data_MPORT_data : 8'h0; // @[accumCol.scala 20:14 23:{27,39}]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_4_en & mem_MPORT_4_mask) begin
      mem[mem_MPORT_4_addr] <= mem_MPORT_4_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_5_en & mem_MPORT_5_mask) begin
      mem[mem_MPORT_5_addr] <= mem_MPORT_5_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_6_en & mem_MPORT_6_mask) begin
      mem[mem_MPORT_6_addr] <= mem_MPORT_6_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_7_en & mem_MPORT_7_mask) begin
      mem[mem_MPORT_7_addr] <= mem_MPORT_7_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_8_en & mem_MPORT_8_mask) begin
      mem[mem_MPORT_8_addr] <= mem_MPORT_8_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_9_en & mem_MPORT_9_mask) begin
      mem[mem_MPORT_9_addr] <= mem_MPORT_9_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_10_en & mem_MPORT_10_mask) begin
      mem[mem_MPORT_10_addr] <= mem_MPORT_10_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_11_en & mem_MPORT_11_mask) begin
      mem[mem_MPORT_11_addr] <= mem_MPORT_11_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_12_en & mem_MPORT_12_mask) begin
      mem[mem_MPORT_12_addr] <= mem_MPORT_12_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_13_en & mem_MPORT_13_mask) begin
      mem[mem_MPORT_13_addr] <= mem_MPORT_13_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_14_en & mem_MPORT_14_mask) begin
      mem[mem_MPORT_14_addr] <= mem_MPORT_14_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_15_en & mem_MPORT_15_mask) begin
      mem[mem_MPORT_15_addr] <= mem_MPORT_15_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_16_en & mem_MPORT_16_mask) begin
      mem[mem_MPORT_16_addr] <= mem_MPORT_16_data; // @[accumCol.scala 19:16]
    end
    if (mem_MPORT_17_en & mem_MPORT_17_mask) begin
      mem[mem_MPORT_17_addr] <= mem_MPORT_17_data; // @[accumCol.scala 19:16]
    end
  end
endmodule
