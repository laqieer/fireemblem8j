#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "sio.h"

//! FE8U = 0x0804B92C
void Clear_UnkData_0(void)
{
    gUnk_Sio_22 = 0;
    return;
}
