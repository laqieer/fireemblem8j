#include "global.h"
#include "gba/m4a_internal.h"

// The m4a engine RAM globals live at fixed IWRAM addresses in the JP ROM
// (gSoundInfo @0x03005400, gCgbChans @0x03006500, gMPlayMemAccArea @0x03006700,
// SoundMainRAM_Buffer @0x03002C08); src/m4a.c's C definitions are auto-placed
// elsewhere, so reference the real runtime addresses directly (D215 raw-addr).
#define gSoundInfo          (*(struct SoundInfo *)0x03005400)
#define gCgbChans           ((struct CgbChannel *)0x03006500)
#define gMPlayMemAccArea    ((u8 *)0x03006700)
#define SoundMainRAM_Buffer ((char *)0x03002C08)

//! FE8U = 0x080D4E70
void m4aSoundInit(void)
{
    s32 i;

    CpuCopy32((void *)((s32)SoundMainRAM & ~1), SoundMainRAM_Buffer, 0x400);

    SoundInit(&gSoundInfo);
    MPlayExtender(gCgbChans);
    m4aSoundMode(SOUND_MODE_DA_BIT_8
               | SOUND_MODE_FREQ_13379
               | (13 << SOUND_MODE_MASVOL_SHIFT)
               | (7 << SOUND_MODE_MAXCHN_SHIFT));

    for (i = 0; i < NUM_MUSIC_PLAYERS; i++)
    {
        struct MusicPlayerInfo *mplayInfo = gMPlayTable[i].info;
        MPlayOpen(mplayInfo, gMPlayTable[i].track, gMPlayTable[i].unk_8);
        mplayInfo->unk_B = gMPlayTable[i].unk_A;
        mplayInfo->memAccArea = gMPlayMemAccArea;
    }
}
