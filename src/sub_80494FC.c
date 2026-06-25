#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "bmlib.h"
#include "helpbox.h"
#include "statscreen.h"

extern struct ProcCmd ProcScr_SioBattleMapBonus[];

extern u8 gUnk_02000C00;
extern const u16 gObject_085D3FF4[];

void sub_8043190(int kind);
void sub_804F528(int x, int y);
void sub_8042678(u8 * dst, int n);

struct Sub80494FCInner
{
    /* 00 */ STRUCT_PAD(0x00, 0x44);
    /* 44 */ int unk_44;
    /* 48 */ STRUCT_PAD(0x48, 0x50);
    /* 50 */ int unk_50;
};

struct Sub80494FCProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ STRUCT_PAD(0x2C, 0x54);
    /* 54 */ struct Sub80494FCInner * unk_54;
    /* 58 */ STRUCT_PAD(0x58, 0x68);
    /* 68 */ s16 unk_68;
};

//! FE8J = 0x080494FC
void sub_80494FC(struct Sub80494FCProc * proc)
{
    struct Sub80494FCInner * inner = proc->unk_54;

    PutSprite(4, 0x18, 0x50, gObject_085D3FF4, 0);
    PutSprite(4, 0x30, 0x60, gObject_085D3FF4, 0x10);

    sub_804F528(proc->unk_68 * 0x34 + 0x28, 0x60);

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        sub_8043190(1);
        inner->unk_50 = 2;

        TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 2, 9), 0x10, 6, 0);
        BG_EnableSyncByMask(BG1_SYNC_BIT);
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT)
    {
        if (proc->unk_68 == 1)
        {
            proc->unk_68--;
            sub_8043190(3);
        }
    }

    if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
    {
        if (proc->unk_68 == 0)
        {
            proc->unk_68++;
            sub_8043190(3);
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (proc->unk_68 != 0)
        {
            sub_8043190(1);
            inner->unk_50 = 2;

            TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 2, 9), 0x10, 6, 0);
            BG_EnableSyncByMask(BG1_SYNC_BIT);
            Proc_Break(proc);
        }
        else
        {
            sub_8043190(2);

            gUnk_02000C00 = inner->unk_44;
            sub_8042678(&gUnk_02000C00, 4);

            TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 2, 9), 0x10, 6, 0);
            BG_EnableSyncByMask(BG1_SYNC_BIT);

            LoadHelpBoxGfx(OBJ_CHR_ADDR(0x340), 0xd);
            StartHelpBoxExt_Unk(0x40, 0x48, 0x67);

            Proc_Goto(proc, 3);
        }
    }
}
