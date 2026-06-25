#include "global.h"
#include <string.h>
#include "hardware.h"
#include "bmlib.h"
#include "bmfx.h"
#include "proc.h"
#include "opinfo.h"

struct ClassReelEntJ
{
    /* 00 */ u32 descTextId;
    /* 04 */ u8 _04[4];
    /* 08 */ u8* reelStr;
    /* 0C */ u8 nameLength;
    /* 0D */ u8 _0D[3];
};

struct OpInfoEnterProcJ
{
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ s16 unk_2c;
    /* 2E */ u8 classNameLength;

    /* 2F */ u8 _pad1[0x34 - 0x2F];

    /* 34 */ ProcPtr letterProcs[10];
    /* 5C */ ProcPtr iconProc;
    /* 60 */ ProcPtr parentProc;
    /* 64 */ struct ClassReelEntJ* classReelEnt;
};

ProcPtr StartClassNameIntroLetter(ProcPtr parent, u8 index);

extern u8* CONST_DATA gOpinfo_1[];
extern u16 gUnkData_ClassIntroBgConfig[12];

void ClassIntro_Init(struct OpInfoEnterProcJ* proc)
{
    int i;
    register int ptr asm("r6");

    u16 bgConfig[12];

    memcpy(bgConfig, gUnkData_ClassIntroBgConfig, sizeof(bgConfig));

    SetupBackgrounds(bgConfig);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetBlendConfig(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 1);

    proc->timer = 0;

    {
        register ProcPtr zero asm("r1") = 0;

        for (i = 9; i >= 0; i--)
        {
            proc->letterProcs[i] = zero;
        }
    }

    proc->iconProc = 0;

    BG_Fill(gBG0TilemapBuffer, 0);

    ApplyPalette(gUnkData_96, 0x10);

    ptr = 0;
    i = 0;

    if (proc->classReelEnt->reelStr[0] != 0xff)
    {
        struct ClassReelEntJ* ent = proc->classReelEnt;
        u8** font = gOpinfo_1;
        u8* gb = gGenericBuffer;

        for (;;)
        {
            Decompress(font[ent->reelStr[i]], gb);
            Copy2dChr(gb, (void*)(ptr + 0x06010000), 4, 4);

            ptr += 0x80;
            i++;

            if (i > 7)
                break;

            ent = proc->classReelEnt;

            if (ent->reelStr[i] == 0xff)
                break;
        }
    }

    ApplyPalette(gUnkData_82, 0x1E);
    ApplyPalette(gUnkData_82, 0x1F);

    Decompress(gUnkData_81, (void*)0x06016000);

    proc->unk_2c = ((240 - (((proc->classReelEnt->nameLength << 3) - proc->classReelEnt->nameLength) << 2)) >> 1) - 0x10;

    proc->letterProcs[0] = StartClassNameIntroLetter(proc, 0);

    Decompress(gUnkData_91, (void*)VRAM);

    Decompress(gUnkData_92, gGenericBuffer);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 0x7), gGenericBuffer, 0x4000);

    Decompress(gUnkData_88, (void*)0x06000800);

    Decompress(gUnkData_89, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x5040);
    ApplyPalette(gUnkData_90, 5);

    Decompress(Img_ChapterIntro_LensFlare, (void*)0x06008000);

    BlitU8TileMapData(gBG2TilemapBuffer, Tsa_UnkData_6, 0, 5);

    ApplyPalettes(Pal_ChapterIntro_LensFlare, 0, 3);

    BG_EnableSyncByMask(4);

    return;
}
