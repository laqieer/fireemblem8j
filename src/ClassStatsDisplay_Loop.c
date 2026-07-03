#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "classdisplayfont.h"
#include "opinfo.h"

// The 4-entry sprite LUT for the class-stats gauge pips, resident in the raw-ROM
// baseline at JP 0x08AAFEE4 (bound via layout/baseline_syms.d).
extern u16* sSpriteLut_GaugePips[];

// The JP ROM re-reads proc->unk_30 from memory once per loop iteration (the
// descriptive asm re-issues `ldr rN, [proc, #0x30]`), matching the sibling
// ClassStatsDisplay_Init (src/sub_80B8AA8.c). A volatile pointer read pins that.
// In the name loop the JP ROM keeps unk_30 live in a register but re-derives
// ->classReelEnt fresh in the condition AND the body (never CSE'd across them).
// A volatile read of the classReelEnt field reproduces that (unk_30 cached, the
// classReelEnt load re-issued at every use). descTextId here holds the resolved
// class-name string pointer (region-different vs the US buffer[] path).
#define UNK30 (*(struct OpInfoClassDisplayProc * volatile *)&proc->unk_30)
#define CREEL(p) (*(struct ClassReelEnt * volatile *)&(p)->classReelEnt)

void ClassStatsDisplay_Loop(struct OpInfoGaugeDrawProc* proc)
{
    struct OpInfoClassDisplayProc* p;
    u8 value;
    int i;
    int x;

    for (i = 0; i < 6; i++) {
        value = UNK30->unk_40[i];

        if (value >= 30)
            value = 30;

        for (x = 0; x < (value >> 2); x++) {
            PutSpriteExt(13, (x * 8) + 48, (i * 16) + 16, sSpriteLut_GaugePips[3], 0x4000);
        }

        if ((value & 3) != 0) {
            PutSpriteExt(13, (x * 8) + 48, (i * 16) + 16, sSpriteLut_GaugePips[(value & 3) - 1], 0x4000);
        }
    }

    x = ((120 - proc->unk_34) / 2) + proc->unk_35;

    for (i = 0; ((u8*)CREEL(p = UNK30)->descTextId)[i] != 0; ) {
        struct ClassDisplayFont* res = GetClassDisplayFontInfo(((u8*)CREEL(p)->descTextId)[i]);

        if (res->a != 0) {
            PutSpriteExt(4, x - res->xBase - 2, 5 - res->yBase, res->a, 0x4000);
            x += res->width - res->xBase;
        }

        i++;

        if (i > 13)
            break;
    }

    if (proc->unk_2a < 255)
        proc->unk_2a++;
}
