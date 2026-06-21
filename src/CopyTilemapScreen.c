#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

//! FE8U = 0x0800014EC
void CopyTilemapScreen(u16 *a, u16 *b)
{
    int i;

    for (i = 0x27F; i >= 0; i--)
        *a++ = *b++;
}
