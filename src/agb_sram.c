#include "global.h"
#include "agb_sram.h"



static u16 verifySramFast_Work[80];  // buffer to hold code of ReadSramFast_Core

u32 (* VerifySramFast)(void const * src, void * dest, u32 size);    // pointer to verifySramFast_Work
void (* ReadSramFast)(void const * src, void * dest, u32 size);

/* prototypes for same-file helpers called by this run */
void WriteSramFast(const u8 *src, u8 *dest, u32 size);

u32 WriteAndVerifySramFast(void const * src, void * dest, u32 size)
{
    u8 i;
    u32 errorAddr;

    // try writing and verifying the data 3 times
    for (i = 0; i < 3; i++)
    {
        WriteSramFast(src, dest, size);
        errorAddr = VerifySramFast(src, dest, size);
        if (errorAddr == 0)
            break;
    }

    return errorAddr;
}
