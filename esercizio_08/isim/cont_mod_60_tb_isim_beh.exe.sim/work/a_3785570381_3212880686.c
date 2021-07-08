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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Windows/Desktop/Progetto/esercizio_08/esercizio08/cont_mod_60.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );


static void work_a_3785570381_3212880686_p_0(char *t0)
{
    char t24[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;

LAB0:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3720);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 6164);
    t6 = (t0 + 3816);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB10;

LAB12:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB13;

LAB14:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)2);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1512U);
    t7 = *((char **)t2);
    t2 = (t0 + 3816);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t15 = *((char **)t10);
    memcpy(t15, t7, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB11;

LAB13:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 1992U);
    t5 = *((char **)t1);
    t1 = (t0 + 6172);
    t11 = 1;
    if (8U == 8U)
        goto LAB18;

LAB19:    t11 = 0;

LAB20:    if (t11 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t16 = (7 - 3);
    t21 = (t16 * 1U);
    t22 = (0 + t21);
    t1 = (t2 + t22);
    t5 = (t0 + 6188);
    t3 = 1;
    if (4U == 4U)
        goto LAB27;

LAB28:    t3 = 0;

LAB29:    if (t3 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t16 = (7 - 3);
    t21 = (t16 * 1U);
    t22 = (0 + t21);
    t1 = (t2 + t22);
    t5 = (t0 + 6104U);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t24, t1, t5, 1);
    t7 = (t0 + 3816);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t15 = *((char **)t10);
    memcpy(t15, t6, 4U);
    xsi_driver_first_trans_delta(t7, 4U, 4U, 0LL);

LAB25:
LAB16:    goto LAB11;

LAB15:    xsi_set_current_line(35, ng0);
    t9 = (t0 + 6180);
    t15 = (t0 + 3816);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t9, 8U);
    xsi_driver_first_trans_fast(t15);
    goto LAB16;

LAB18:    t16 = 0;

LAB21:    if (t16 < 8U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t7 = (t5 + t16);
    t8 = (t1 + t16);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB19;

LAB23:    t16 = (t16 + 1);
    goto LAB21;

LAB24:    xsi_set_current_line(40, ng0);
    t9 = (t0 + 6192);
    t15 = (t0 + 3816);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t9, 4U);
    xsi_driver_first_trans_delta(t15, 4U, 4U, 0LL);
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t16 = (7 - 7);
    t21 = (t16 * 1U);
    t22 = (0 + t21);
    t1 = (t2 + t22);
    t5 = (t0 + 6120U);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t24, t1, t5, 1);
    t7 = (t0 + 3816);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t15 = *((char **)t10);
    memcpy(t15, t6, 4U);
    xsi_driver_first_trans_delta(t7, 0U, 4U, 0LL);
    goto LAB25;

LAB27:    t23 = 0;

LAB30:    if (t23 < 4U)
        goto LAB31;
    else
        goto LAB29;

LAB31:    t7 = (t1 + t23);
    t8 = (t5 + t23);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB28;

LAB32:    t23 = (t23 + 1);
    goto LAB30;

}

static void work_a_3785570381_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(50, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 3880);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3736);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3785570381_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3785570381_3212880686_p_0,(void *)work_a_3785570381_3212880686_p_1};
	xsi_register_didat("work_a_3785570381_3212880686", "isim/cont_mod_60_tb_isim_beh.exe.sim/work/a_3785570381_3212880686.didat");
	xsi_register_executes(pe);
}
