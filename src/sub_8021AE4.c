#include "global.h"

extern u8 ProcScr_EventWrapAnim[];

int cw_8002DEC();

int sub_8021AE4(void)
{
    return cw_8002DEC((void *)ProcScr_EventWrapAnim) != 0;
}
