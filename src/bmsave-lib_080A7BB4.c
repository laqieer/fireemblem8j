#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bonusclaim.h"

// TODO: Should be in "bmsave.h", but doing so causes a non-match (implicit declaration?) in "bonusclaim.c"
bool LoadBonusContentData(void *buf);




static const char sSaveMarker[] = "AGB-FE9";
static const u8 sConvySavePackMask1[] = {
    0xC0,   /* 1100 0000 */
    0x81,   /* 1000 0001 */
    0x03,   /* 0000 0011 */
    0x07,   /* 0000 0111 */
    0x0F,   /* 0000 1111 */
    0x1F,   /* 0001 1111 */
    0x3F,   /* 0011 1111 */
    0x7F,   /* 0111 1111 */
};

static const u8 sConvySavePackMask2[] = {
    0x00,   /* 0000 0000 */
    0x00,   /* 0000 0000 */
    0x00,   /* 0000 0000 */
    0xF7,   /* 1111 0111 */
    0xFC,   /* 1111 1100 */
    0xF8,   /* 1111 1000 */
    0xF0,   /* 1111 0000 */
    0xE0,   /* 1110 0000 */
};

extern CONST_DATA struct SaveBlocks *gSram;



void ReadChapterFlags(void *ewram_dest)
{
    ReadSramFast(
        ewram_dest,
        GetChapterFlagBits(),
        GetChapterFlagBitsSize());
}

void ReadPermanentFlags(void *ewram_dest)
{
    ReadSramFast(
        ewram_dest,
        GetPermanentFlagBits(),
        GetPermanentFlagBitsSize());
}

void ReadPermanentFlags_ret(const void *sram_src, void *ewram_dest)
{
    ReadSramFast(
        sram_src,
        ewram_dest,
        GetPermanentFlagBitsSize());
}

void WriteSupplyItems(void *sram_dest)
{
    const unsigned short *items = GetConvoyItemArray();
    unsigned char *cur;
    int i, item_use, var0, var1;
    unsigned char buf[176];
    cur = &buf[100];
    var1 = 0;

    for (i = 0; i < CONVOY_ITEM_COUNT; i++) {
        buf[i] = items[0];
        item_use = ITEM_USES(items[0]) & 0x3F;
        var0 = var1 & 0x7;
        *cur = 
            (*cur & sConvySavePackMask1[var0]) |
            (item_use << var0);

        if (var0 > 1) {
            cur++;
            if (var0 > 2) {
                *cur =
                    (*cur & sConvySavePackMask2[var0]) |
                    (item_use >> (8 - var0));
            }
        }
        var1 += 6;
        ++items;
    }

    WriteAndVerifySramFast(buf, sram_dest, GAMESAVE_SIZE_SUPPLY);
}

void ReadSupplyItems(const void *sram_src)
{
    unsigned char buf[GAMESAVE_SIZE_SUPPLY];
    unsigned short *items;
    unsigned char *cur, item_use;
    int i, var0, var1;

    ReadSramFast(sram_src, buf, sizeof(buf));
    items = GetConvoyItemArray();
    cur = &buf[100];
    var1 = 0;

    for (i = 0; i < CONVOY_ITEM_COUNT; i++) {
        items[0] = buf[i];
        var0 = var1 & 0x7;
        item_use = (*cur & ~sConvySavePackMask1[var0]) >> var0;

        if (var0 > 1) {
            cur++;

            if (var0 > 2) {
                item_use |= (*cur & ~sConvySavePackMask2[var0]) << (8 - var0);
            }
        }

        items[0] |= item_use << 8;
        var1 += 6;
        items++;
    }

}

bool null_true()
{
    return true;
}
