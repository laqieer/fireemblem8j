#include "global.h"
#include "hardware.h"

extern u8 gUnk_AugTiles[];  // ROM 0x08AC4C88
extern u8 gUnk_AugChr[];    // ROM 0x08AC4CA8
extern u8 gUnk_AugTsa[];    // ROM 0x08AC50A4
extern u8 gUnk_AugTsaBuf[]; // RAM 0x02023CA8

void sub_8000D68(const void* src, void* dst, int size);
void sub_8013008(const void* src, void* dst);
void j_TmApplyTsa(void* dst, const void* tsa, int base);

// JP-only worldmap/menu graphics init.
void sub_80BBF18(void)
{
    sub_8000D68(gUnk_AugTiles, (void*)(0xE0 << 1), 0x20);
    sub_8013008(gUnk_AugChr, (void*)0x06001000);
    j_TmApplyTsa(gUnk_AugTsaBuf, gUnk_AugTsa, 0xE080);
    BG_EnableSyncByMask(4);
}
