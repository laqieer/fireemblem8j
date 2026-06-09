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



/* file-scope type definitions used by this run */


struct EvCheck01 {
    u32 unk0;
    u32 script;
    u32 unk8;
};

struct EvCheck02 {
    u32 unk0;
    u32 script;
    u8 turn;
    u8 maxTurn;
    u16 faction;
};

struct EvCheck03 {
    u32 unk0;
    u32 script;
    u8 pidA;
    u8 pidB;
    u16 fillerA;
    u16 unkC;
    u16 unkE;
};

struct EvCheck04 {
    u32 unk0;
    u32 script;
    u8 pidA;
    u8 pidB;
    s8 (*func)(void *);
};

struct EvCheck05 {
    u32 unk0;
    u32 script;
    u8 x;
    u8 y;
    u16 cmdId;
};

struct EvCheck07 {
    u32 unk0;
    u16 givenItem;
    u16 givenMoney;
    u8 x;
    u8 y;
    u16 cmdId;
};

struct EvCheck08 {
    u32 unk0;
    u32 script;
    u32 unk8;
};

struct EvCheck0A {
    u32 unk0;
    u32 script;
    u8 x;
    u8 y;
    u16 tileCommand;
};

struct EvCheck0B {
    u32 unk0;
    u32 script;
    u32 unk8;
};

struct EvCheck0E {
    u32 unk0;
    u32 script;
    s8 (*func)(struct EventInfo*);
};

struct EvCheck0F {
    u32 unk0;
    u32 unk4;
    u32 script;
    u32 unkC;
};

bool EventInfoCheckTalk(struct EventInfo * info, u8 pidA, u8 pidB)
{
    if ((info->pidA == pidA) && (info->pidB == pidB)) {
        info->script = info->listScript[1];
        info->flag = EVT_CMD_HI(info->listScript[0]);

        return true;
    }
    return false;
}
