#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08081F58
void MapAnimResetHBlank(void)
{
    SetPrimaryHBlankHandler(NULL);
}
