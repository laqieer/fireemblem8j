#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"

#include "unitlistscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct SortedUnitEnt gSortedUnitsBuf[0x40];
extern EWRAM_OVERLAY(0) struct SortedUnitEnt * gSortedUnits[0x40];
extern EWRAM_OVERLAY(0) u16 gUnitlistscreen_0[0x20][0x20];
extern EWRAM_OVERLAY(0) u16 gUnitlistscreen_1[2][0x20];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_7[0x1000];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_8;
extern EWRAM_OVERLAY(0) u32 gUnitlistscreen_9[8]; // equipped item icons

// clang-format off











NAKEDFUNC
void UnitList_PageChangeIn_Loop(struct UnitListScreenProc * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #4\n\
        mov r8, r0\n\
        mov r2, r8\n\
        adds r2, #0x38\n\
        ldr r1, _08091FEC  @ gUnitlistscreen_11\n\
        mov r3, r8\n\
        ldrh r0, [r3, #0x3c]\n\
        adds r0, r0, r1\n\
        ldrb r0, [r0]\n\
        ldrb r1, [r2]\n\
        adds r0, r0, r1\n\
        strb r0, [r2]\n\
        lsls r0, r0, #0x18\n\
        lsrs r0, r0, #0x18\n\
        cmp r0, #0x14\n\
        bls _08091F3E\n\
        movs r0, #0x14\n\
        strb r0, [r2]\n\
    _08091F3E:\n\
        mov r3, r8\n\
        ldrh r0, [r3, #0x3c]\n\
        adds r0, #1\n\
        strh r0, [r3, #0x3c]\n\
        mov r0, r8\n\
        adds r0, #0x36\n\
        mov r1, r8\n\
        adds r1, #0x37\n\
        ldrb r0, [r0]\n\
        ldrb r1, [r1]\n\
        cmp r0, r1\n\
        bls _08092000\n\
        movs r5, #0\n\
        str r2, [sp]\n\
        ldrb r0, [r2]\n\
        cmp r5, r0\n\
        blt _08091F62\n\
        b _0809208E\n\
    _08091F62:\n\
        adds r7, r2, #0\n\
    _08091F64:\n\
        mov r1, r8\n\
        ldrh r0, [r1, #0x3e]\n\
        lsrs r4, r0, #3\n\
        adds r0, r4, #0\n\
        adds r0, #0xc\n\
        adds r6, r5, #0\n\
        adds r6, #0x1c\n\
        movs r3, #8\n\
        adds r3, r3, r5\n\
        mov ip, r3\n\
        adds r5, #1\n\
        mov sl, r5\n\
        cmp r4, r0\n\
        bge _08091FB6\n\
        adds r5, r6, #0\n\
        lsls r2, r3, #1\n\
        movs r0, #0x1f\n\
        mov r9, r0\n\
    _08091F88:\n\
        adds r3, r4, #0\n\
        mov r1, r9\n\
        ands r3, r1\n\
        lsls r1, r3, #5\n\
        ldrb r0, [r7]\n\
        subs r0, r5, r0\n\
        adds r1, r1, r0\n\
        lsls r1, r1, #1\n\
        ldr r0, _08091FF0  @ gBG0TilemapBuffer\n\
        adds r1, r1, r0\n\
        lsls r0, r3, #6\n\
        adds r0, r2, r0\n\
        ldr r3, _08091FF4  @ gUnitlistscreen_0\n\
        adds r0, r0, r3\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        adds r4, #1\n\
        mov r1, r8\n\
        ldrh r0, [r1, #0x3e]\n\
        lsrs r0, r0, #3\n\
        adds r0, #0xc\n\
        cmp r4, r0\n\
        blt _08091F88\n\
    _08091FB6:\n\
        ldr r3, _08091FF8  @ gBG2TilemapBuffer\n\
        mov r9, r3\n\
        adds r5, r6, #0\n\
        mov r1, ip\n\
        lsls r0, r1, #1\n\
        ldr r3, _08091FFC  @ gUnitlistscreen_1\n\
        adds r2, r0, r3\n\
        movs r3, #0xa0\n\
        movs r4, #1\n\
    _08091FC8:\n\
        ldrb r0, [r7]\n\
        subs r0, r5, r0\n\
        adds r0, r3, r0\n\
        lsls r0, r0, #1\n\
        add r0, r9\n\
        ldrh r1, [r2]\n\
        strh r1, [r0]\n\
        adds r2, #0x40\n\
        adds r3, #0x20\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bge _08091FC8\n\
        mov r5, sl\n\
        ldrb r0, [r7]\n\
        cmp r5, r0\n\
        blt _08091F64\n\
        b _0809208E\n\
        .align 2, 0\n\
    _08091FEC: .4byte gUnitlistscreen_11\n\
    _08091FF0: .4byte gBG0TilemapBuffer\n\
    _08091FF4: .4byte gUnitlistscreen_0\n\
    _08091FF8: .4byte gBG2TilemapBuffer\n\
    _08091FFC: .4byte gUnitlistscreen_1\n\
    _08092000:\n\
        movs r5, #0\n\
        str r2, [sp]\n\
        ldrb r1, [r2]\n\
        cmp r5, r1\n\
        bge _0809208E\n\
        adds r7, r2, #0\n\
    _0809200C:\n\
        mov r3, r8\n\
        ldrh r0, [r3, #0x3e]\n\
        lsrs r4, r0, #3\n\
        adds r0, r4, #0\n\
        adds r0, #0xc\n\
        adds r6, r5, #0\n\
        adds r6, #0x1c\n\
        adds r1, r5, #1\n\
        mov sl, r1\n\
        cmp r4, r0\n\
        bge _0809205C\n\
        mov ip, r6\n\
        movs r3, #0x1f\n\
        mov r9, r3\n\
    _08092028:\n\
        adds r3, r4, #0\n\
        mov r0, r9\n\
        ands r3, r0\n\
        lsls r2, r3, #5\n\
        adds r2, #8\n\
        adds r2, r2, r5\n\
        lsls r2, r2, #1\n\
        ldr r1, _080920B4  @ gBG0TilemapBuffer\n\
        adds r2, r2, r1\n\
        ldrb r0, [r7]\n\
        mov r1, ip\n\
        subs r0, r1, r0\n\
        lsls r0, r0, #1\n\
        lsls r1, r3, #6\n\
        adds r0, r0, r1\n\
        ldr r3, _080920B8  @ gUnitlistscreen_0\n\
        adds r0, r0, r3\n\
        ldrh r0, [r0]\n\
        strh r0, [r2]\n\
        adds r4, #1\n\
        mov r1, r8\n\
        ldrh r0, [r1, #0x3e]\n\
        lsrs r0, r0, #3\n\
        adds r0, #0xc\n\
        cmp r4, r0\n\
        blt _08092028\n\
    _0809205C:\n\
        movs r4, #0\n\
        ldr r3, _080920BC  @ gUnitlistscreen_1\n\
        mov ip, r3\n\
        adds r3, r6, #0\n\
        adds r0, r5, #0\n\
        adds r0, #0xa8\n\
        lsls r0, r0, #1\n\
        ldr r1, _080920C0  @ gBG2TilemapBuffer\n\
        adds r2, r0, r1\n\
    _0809206E:\n\
        ldrb r0, [r7]\n\
        subs r0, r3, r0\n\
        lsls r0, r0, #1\n\
        lsls r1, r4, #6\n\
        adds r0, r0, r1\n\
        add r0, ip\n\
        ldrh r0, [r0]\n\
        strh r0, [r2]\n\
        adds r2, #0x40\n\
        adds r4, #1\n\
        cmp r4, #1\n\
        ble _0809206E\n\
        mov r5, sl\n\
        ldrb r3, [r7]\n\
        cmp r5, r3\n\
        blt _0809200C\n\
    _0809208E:\n\
        movs r0, #5\n\
        bl BG_EnableSyncByMask\n\
        ldr r1, [sp]\n\
        ldrb r0, [r1]\n\
        cmp r0, #0x13\n\
        bls _080920A2\n\
        mov r0, r8\n\
        bl Proc_Break\n\
    _080920A2:\n\
        add sp, #4\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080920B4: .4byte gBG0TilemapBuffer\n\
    _080920B8: .4byte gUnitlistscreen_0\n\
    _080920BC: .4byte gUnitlistscreen_1\n\
    _080920C0: .4byte gBG2TilemapBuffer\n\
        .syntax divided\n\
    ");
}
