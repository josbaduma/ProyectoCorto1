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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000879163506_3005117834_init();
    work_m_00000000002258548198_4280876618_init();
    work_m_00000000002361218641_4033376979_init();
    work_m_00000000001650841550_1817558700_init();
    work_m_00000000001650841550_3232891280_init();
    work_m_00000000000116312777_1188369755_init();
    work_m_00000000001058250812_3445895191_init();
    work_m_00000000001817926158_2856494725_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001817926158_2856494725");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
