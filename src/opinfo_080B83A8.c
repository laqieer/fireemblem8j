#include "global.h"

#include <string.h>

#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "bmlib.h"
#include "scene.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "opinfo.h"

/* ClassInfoDisplay_Init @ JP 0x080B83A8 (fe8u opinfo.c:991), region-different.
 *
 * The JP runtime ClassReelEnt is SHIFTED vs the fe8u-style layout declared in
 * include/opinfo.h (which we must not edit): descTextId@0x04, paletteId@0x0D,
 * classId@0x0E, script@0x18. Use a local struct + cast for the real JP layout.
 * Every offset/width below was verified against the asm load/store mnemonics. */

struct ClassReelEntJ
{
    /* 00 */ u32 _00;
    /* 04 */ u32 descTextId;
    /* 08 */ u8 _08[5];
    /* 0D */ s8 paletteId;
    /* 0E */ u8 classId;
    /* 0F */ u8 unk_06;
    /* 10 */ u8 banimId;
    /* 11 */ u8 magicFx;
    /* 12 */ u8 unk_09;
    /* 13 */ u8 unk_0A;
    /* 14 */ u8 unk_0B;
    /* 15 */ u8 unk_0C;
    /* 16 */ u8 unk_0D;
    /* 17 */ u8 unk_0E;
    /* 18 */ struct ClassReelAnimScr* script;
};

/* gOpinfo_0: the 2x6 stat-name msgid table, loaded from FIXED ROM 0x081F5900
 * (asm ldm) -> bind as an extern data alias, do NOT re-emit. */
extern const int gOpinfo_0[2][6];

/* EWRAM working buffers, bound by their JP literal-pool addresses. */
extern struct Text gUnk_OpInfo_1[6];   /* 0x0201FB28 */
extern u8 gUnk_0[];                     /* 0x02002038 */
extern u8 gUnk_1[];                     /* 0x02007838 */
extern u8 gUnk_2[];                     /* 0x020078D8 */
extern u8 gUnk_5[];                     /* 0x0200A300 */
extern u8 gUnk_7[];                     /* 0x0200C300 */
extern u8 gUnk_8[];                     /* 0x0200CB00 */
extern u8 gUnk_OpInfo_0[];              /* 0x0201DB28 */

/* Graphics/palette sources referenced at the JP literal-pool addresses. The
 * committed gUnkData_8x / gUiFramePaletteA symbols sit +4 (past a 4-byte LZ77
 * header), so this fn's own pointers must alias the true header addresses. */
extern u8 gOpinfoBgGfx3[];              /* 0x08AB1C58 (compressed, bg3 gfx) */
extern u8 gOpinfoBgTsa3[];              /* 0x08AB62B4 (bg3 tsa) */
extern u8 gOpinfoBgPal3[];              /* 0x08AB6768 (bg3 pal) */
extern u8 gOpinfoBgGfx2[];              /* 0x08AB162C (compressed, bg2 gfx) */
extern u8 gOpinfoBgTsa2[];              /* 0x08AB17A4 (bg2 tsa) */
extern u16 gOpinfoFramePal[];           /* 0x085E0D94 (ui frame pal) */

/* JP callees not yet declared in headers (bound thumb by their .set addresses). */
void j_TmApplyTsa(u16* tilemap, const void* tsa, int tileref);
ProcPtr sub_80B8C64(ProcPtr);
void InitBanimTerrain(void*);
void SetBanimTerrainPos(void*, s16, s16, s16, s16);
void ClassInfoDisplay_ResetWindowBlend(void);
void ClassInfoDisplay_HBlankHandler(void);

void ClassInfoDisplay_Init(struct OpInfoClassDisplayProc* proc)
{
    union {
        int hack_4d[2][6][1][1];
        int hack_2d[2][6];
    } hack;
    int i;
    int hasMagicRank;
    int r5;
    u16 *buffer;

#define ent ((struct ClassReelEntJ*)proc->classReelEnt)

    hasMagicRank = 0;

    memcpy(hack.hack_2d, gOpinfo_0, sizeof(hack.hack_2d));

    proc->script = ent->script;

    for (i = 4; i <= 7; i++) {

        if ((GetClassData(ent->classId)->baseRanks[i]) != 0) {
            hasMagicRank = 1;
            break;
        }
    }

    SetupBackgrounds(0);

    proc->unk_2a = 0;
    proc->unk_2c = 0;

    proc->unk_46 = 0xFA;

    BG_Fill(buffer = gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetDefaultColorEffects();

    ResetTextFont();

    ResetText();

    gLCDControlBuffer.bg0cnt.priority = 2;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    Decompress(gOpinfoBgGfx3, (void *)(GetBackgroundTileDataOffset(3) + VRAM));
    ApplyPalettes(gOpinfoBgPal3, 7, 8);

    j_TmApplyTsa(gBG3TilemapBuffer, gOpinfoBgTsa3, 0x7000);

    Decompress(gOpinfoBgGfx2, (void *)(GetBackgroundTileDataOffset(2) + VRAM));
    ApplyPalette(gOpinfoFramePal, 6);

    j_TmApplyTsa(gBG2TilemapBuffer, gOpinfoBgTsa2, 0x6000);

    BG_EnableSyncByMask(0xF);

    BG_Fill(buffer, 0);

    proc->unk_40[0] = GetClassData(ent->classId)->baseHP;
    proc->unk_40[1] = GetClassData(ent->classId)->basePow;
    proc->unk_40[2] = GetClassData(ent->classId)->baseSkl;
    proc->unk_40[3] = GetClassData(ent->classId)->baseSpd;
    proc->unk_40[4] = GetClassData(ent->classId)->baseDef;
    proc->unk_40[5] = GetClassData(ent->classId)->baseRes;

    for (i = 0; i <= 5; i++) {

        InitText(&gUnk_OpInfo_1[i], 3);

        ClearText(&gUnk_OpInfo_1[i]);

        Text_SetColor(&gUnk_OpInfo_1[i], 3);
        Text_SetCursor(&gUnk_OpInfo_1[i], 0);

        if (hasMagicRank != 0) {
            Text_DrawString(&gUnk_OpInfo_1[i], GetStringFromIndex(hack.hack_2d[1][i]));
        } else {
            Text_DrawString(&gUnk_OpInfo_1[i], GetStringFromIndex(hack.hack_4d[0][i][1][-1]));
        }

        PutText(&gUnk_OpInfo_1[i], buffer + 0x21 + (i * 0x40));

        PutNumber(buffer + 0x25 + (i * 0x40), 0, proc->unk_40[i]);
    }

    r5 = 0;

    proc->unk_3c = sub_80B8C64(proc);

    InitTalk(0x100, 2, 0);

    SetInitTalkTextFont();
    ClearTalkText();
    EndTalk();

    StartTalkMsg(2, 15, ent->descTextId);

    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);
    SetTalkFlag(TALK_FLAG_NOFAST);
    SetTalkFlag(TALK_FLAG_SILENT);

    SetTalkPrintDelay(4);

    gOpInfoData.charPalId = ent->paletteId;
    gOpInfoData.xPos = 0x104;
    gOpInfoData.yPos = 0x58;
    gOpInfoData.animId = ent->banimId;
    gOpInfoData.roundType = 6;
    gOpInfoData.genericPalId = ent->unk_06;
    gOpInfoData.state2 = 1;
    gOpInfoData.oam2Tile = 0x180;
    gOpInfoData.oam2Pal = 2;
    gOpInfoData.pImgSheetBuf = &gEkrBg0QuakeVec;
    gOpInfoData.unk_24 = gUnk_0;
    gOpInfoData.unk_20 = gUnk_1;
    gOpInfoData.unk_28 = gUnk_2;

    gOpInfoData.unk_30 = &gUnk_4;

    gUnk_4.magicFuncIdx = ent->magicFx;
    gUnk_4.xOffsetBg = ent->unk_09;
    gUnk_4.yOffsetBg = ent->unk_0A;
    gUnk_4.xOffsetObj = ent->unk_0B;
    gUnk_4.yOffsetObj = ent->unk_0C;
    gUnk_4.objChr = 0x280;
    gUnk_4.objPalId = 0xF;
    gUnk_4.bgChr = 0x200;
    gUnk_4.bgPalId = 0xF;
    gUnk_4.bg = 1;
    gUnk_4.bgTmBuf = gBG1TilemapBuffer;
    gUnk_4.bgImgBuf = gUnk_5;
    gUnk_4.bgTsaBuf = gUnk_7;
    gUnk_4.objImgBuf = gUnk_8;
    gUnk_4.resetCallback = ClassInfoDisplay_ResetWindowBlend;

    NewEkrUnitMainMini(&gOpInfoData);

    gUnk_Opinfo_0.terrain_l = ent->unk_0D;
    gUnk_Opinfo_0.pal_l = 10;
    gUnk_Opinfo_0.chr_l = 0x380;
    gUnk_Opinfo_0.terrain_r = ent->unk_0E;
    gUnk_Opinfo_0.pal_r = 11;
    gUnk_Opinfo_0.chr_r = 0x3C0;
    gUnk_Opinfo_0.distance = r5;
    gUnk_Opinfo_0.unk0E = -1;

    gUnk_Opinfo_0.unk1C = (void *)0x06010000;
    gUnk_Opinfo_0.unk20 = &gUnk_OpInfo_0;

    InitBanimTerrain(&gUnk_Opinfo_0);
    SetBanimTerrainPos(&gUnk_Opinfo_0, 0xD0, 0x68, 0x130, 0x68);

    SetPrimaryHBlankHandler(ClassInfoDisplay_HBlankHandler);

    return;
}
