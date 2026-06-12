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


extern EWRAM_DATA bool gBoolSramWorking;

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



/* prototypes for same-file helpers called by this run */
void WipeSram();
void WriteGlobalSaveInfo(struct GlobalSaveInfo *header);

void InitGlobalSaveInfodata()
{
    struct GlobalSaveInfo info;
    int i;

    WipeSram();
    CopyString(info.name, sSaveMarker);

    info.magic32 = SAVEMAGIC32;
    info.magic16 = SAVEMAGIC16;

    info.completed  = 0;
    info.flag0E_1 = 0;
    info.Eirk_mode_easy = 0;
    info.Eirk_mode_norm = 0;
    info.Eirk_mode_hard = 0;
    info.Ephy_mode_easy = 0;
    info.Ephy_mode_norm = 0;
    info.Ephy_mode_hard = 0;

    info.game_end = 0;
    info.unk0F_1 = 0;

    info.unk10 = 0;
    info.unk12 = 0;

    info.last_suspend_slot = 0;
    info.last_game_save_id = 0;

    for (i = 0; i < 0xC; i++)
        info.cleared_playthroughs[i] = 0;

    for (i = 0; i < 0x20; i++)
        info.SuppordRecord[i] = 0;

    for (i = 0; i < 0x20; i++)
        info.charKnownFlags[i] = 0;

    WriteGlobalSaveInfo(&info);
}
