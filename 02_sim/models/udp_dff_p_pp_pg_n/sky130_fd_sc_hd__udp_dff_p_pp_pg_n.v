/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HD__UDP_DFF_P_PP_PG_N_V
`define SKY130_FD_SC_HD__UDP_DFF_P_PP_PG_N_V

/**
 * udp_dff$P_pp$PG$N: Positive edge triggered D flip-flop
 *                    (Q output UDP).
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`else
primitive sky130_fd_sc_hd__udp_dff$P_pp$PG$N (
    Q       ,
    D       ,
    CLK     ,
    NOTIFIER,
    VPWR    ,
    VGND
);

    output Q       ;
    input  D       ;
    input  CLK     ;
    input  NOTIFIER;
    input  VPWR    ;
    input  VGND    ;

    reg Q;

    table
     //          D           CLK  NOTIFIER VPWR VGND :  Qt : Qt+1
                 1           (01)    ?      1    0   :  ?  :  1    ; // clocked data
                 0           (01)    ?      1    0   :  ?  :  0    ;
                 1           (x1)    ?      1    0   :  1  :  1    ; // reducing pessimism
                 0           (x1)    ?      1    0   :  0  :  0    ;
                 1           (0x)    ?      1    0   :  1  :  1    ;
                 0           (0x)    ?      1    0   :  0  :  0    ;
                 0            x      ?      1    0   :  0  :  0    ; // Hold when CLK=X and D=Q
                 1            x      ?      1    0   :  1  :  1    ; // Hold when CLK=X and D=Q
                 ?           (?0)    ?      1    0   :  ?  :  -    ;
                 *            b      ?      1    0   :  ?  :  -    ; // ignore edges on data
        // ['IfDef(functional)', '']                 ?            ?      *      1    0   :  ?  :  -    ;
        // ['Else', '']                 ?            ?      *      1    0   :  ?  :  x    ;
        // ['EndIfDef(functional)', '']                 ?            ?      ?      *    ?   :  ?  :  x    ; // any change on vpwr
                 ?            ?      ?      ?    *   :  ?  :  x    ; // any change on vgnd
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HD__UDP_DFF_P_PP_PG_N_V
