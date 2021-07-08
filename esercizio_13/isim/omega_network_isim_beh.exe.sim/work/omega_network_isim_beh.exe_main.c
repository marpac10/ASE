/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *IEEE_P_2592010699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_0834555087_3990940387_init();
    work_a_2381583409_3212880686_init();
    work_a_3876387261_3212880686_init();
    work_a_3853510154_1181938964_init();
    work_a_3641411212_3990940387_init();
    work_a_4277038523_3212880686_init();
    work_a_1313696814_1181938964_init();
    work_a_1351325181_1181938964_init();
    work_a_1268656262_3212880686_init();
    work_a_4028369871_1181938964_init();


    xsi_register_tops("work_a_4028369871_1181938964");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);

    return xsi_run_simulation(argc, argv);

}
