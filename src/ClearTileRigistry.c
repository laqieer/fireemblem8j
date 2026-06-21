#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

//! FE8U = 0x080001F30
void ClearTileRigistry(void)
{
    int i;

    gFrameTmRegisterConfig.count = 0;
    gFrameTmRegisterConfig.size = 0;
    for (i = 0; i < 32; i++)
    {
        gFrameTmRegister[i].src = 0;
        gFrameTmRegister[i].dest = 0;
        gFrameTmRegister[i].size = 0;
        gFrameTmRegister[i].mode = 0;
    }
    gFrameTmRegister[0].src = 0;
}
