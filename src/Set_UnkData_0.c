#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "sio.h"

//! FE8U = 0x0804B920
void Set_UnkData_0(void)
{
    gUnk_Sio_22 = 1;
    return;
}
