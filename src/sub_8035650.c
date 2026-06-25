#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "variables.h"
#include "bb.h"

struct SoundTestProc
{
    PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ u16 unk58;
    /* 5A */ u16 unk5A;
};

extern const u8 Gfx_SoundTest_8035650[];
extern const u16 Pal_SoundTest_8035650[];

// JP-only: BB sound-test proc init.
void sub_8035650(struct SoundTestProc * proc)
{
    proc->unk58 = 0;
    proc->unk5A = 6;

    Decompress(Gfx_SoundTest_8035650, (void *)(0x06000000 + 0x15000));
    CopyToPaletteBuffer(Pal_SoundTest_8035650, 0xA8 << 2, 0x20);
    Proc_Start(gProcScr_SubtitleHelpDarkener, (ProcPtr)3);

    if (!gPlaySt.config.disableSoundEffects)
        m4aSongNumStart(0x6a);

    gPlaySt.config.controller = 1 - gPlaySt.config.controller;
}
