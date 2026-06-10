#include "global.h"

#include "event.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "soundwrapper.h"
#include "bmsave.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmmap.h"
#include "rng.h"
#include "event.h"
#include "bmshop.h"
#include "bmbattle.h"
#include "worldmap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

#define EVT_CMD_LO(cmd) (((cmd) & 0x0000FFFF))
#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)
#define EVT_CMD_B1(cmd) (((cmd) & 0x000000FF))
#define EVT_CMD_B2(cmd) (((cmd) & 0x0000FF00) >> 8)
#define EVT_CMD_B3(cmd) (((cmd) & 0x00FF0000) >> 16)
#define EVT_CMD_B4(cmd) (((cmd) & 0xFF000000) >> 24)

int EvCheck00_Always(struct EventInfo* info);
int EvCheck01_AFEV(struct EventInfo* info);
int EvCheck02_TURN(struct EventInfo* info);
int EvCheck03_CHAR(struct EventInfo* info);
int EvCheck04_CHARASM(struct EventInfo* info);
int EvCheck05_LOCA(struct EventInfo* info);
int EvCheck06_VILL(struct EventInfo* info);
int EvCheck07_CHES(struct EventInfo* info);
int EvCheck08_DOOR(struct EventInfo* info);
int EvCheck09_(struct EventInfo* info);
int EvCheck0A_SHOP(struct EventInfo* info);
int EvCheck0B_AREA(struct EventInfo* info);
int EvCheck0C_Never(struct EventInfo* info);
int EvCheck0D_Never(struct EventInfo* info);
int EvCheck0E_(struct EventInfo* info);
int EvCheck0F_(struct EventInfo* info);
int EvCheck10_(struct EventInfo* info);

u8 CONST_DATA gFlagBitMaskLut[100 / 8 + 1] = {
    [0] = 1 << 0,
    [1] = 1 << 1,
    [2] = 1 << 2,
    [3] = 1 << 3,
    [4] = 1 << 4,
    [5] = 1 << 5,
    [6] = 1 << 6,
    [7] = 1 << 7,
};



//! FE8U = 0x08083280
void CallEndEvent(void) {
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH) {
        CallEvent(evGroup->endingSceneEvents, 1);
    } else {
        CallEvent((u16 *)EventScr_SkirmishCommonEnd, 1);
    }

    RefreshAllies();
    SetFlag(0x84);

    return;
}

//! FE8U = 0x080832C4
s8 Eventinfo_CondFalse_0(void) {
    return 0;
}

//! FE8U = 0x080832C8
s8 Eventinfo_CondFalse_1(void) {
    return 0;
}

//! FE8U = 0x080832CC
s8 Eventinfo_CondFalse_2(void) {
    return 0;
}

//! FE8U = 0x080832D0
s8 Eventinfo_CondFalse_3(void) {
    return 0;
}

//! FE8U = 0x080832D4
s8 Eventinfo_CondFalse_4(void) {
    return 0;
}

//! FE8U = 0x080832D8
s8 CheckWin(void) {
    return CheckFlag(3);
}

//! FE8U = 0x080832E8
void MaybeCallEndEvent(void) {
    if (!CheckFlag(3)) {
        return;
    }

    if (!ShouldCallEndEvent()) {
        return;
    }

    CallEndEvent();

    return;
}

//! FE8U = 0x08083308
const struct TrapData * GetTrapPointer(void)
{
    return GetChapterEventDataPointer(gPlaySt.chapterIndex)->traps;
}

//! FE8U = 0x08083320
const struct TrapData * GetHardModeTrapPointer(void)
{
    const struct ChapterEventGroup* evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
        return evGroup->extraTrapsInHard;

    return NULL;
}
