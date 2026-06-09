#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"

#include "constants/classes.h"
#include "constants/items.h"



void EkrBuildGaugeBarTiles(u16 * tm, int arg1, int arg2)
{
    int r1, i, flag = 0;

    if (arg2 != 0)
    {
        for (i = 0; i <= 40; i = r1)
        {
            if (arg2 <= i)
            {
                if (flag == 0)
                {
                    flag = 1;
                    *tm++ = 0xE;
                }
                else
                    *tm++ = 0xFF;

                r1 = i + 4;
            }
            else if (arg2 == (i + 1))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0xD;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 1))
                        *tm++ = 0xC;
                }
            }
            else if (arg2 == (i + 2))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0xB;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm++ = 0xA;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 2))
                        *tm++ = 0x9;
                }
            }
            else if (arg2 == (i + 3))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0x8;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm++ = 0x7;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 2))
                {
                    *tm++ = 0x6;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 3))
                        *tm++ = 0x5;
                }
            }
            else if (r1 = i + 4, arg2 >= r1)
            {
                if (arg1 <= i)
                    *tm++ = 0x4;
                else if (arg1 == (i + 1))
                    *tm++ = 0x3;
                else if (arg1 == (i + 2))
                    *tm++ = 0x2;
                else if (arg1 == (i + 3))
                    *tm++ = 0x1;
                else if (arg1 >= r1)
                    *tm++ = 0x0;
            }
        }
    }
}
