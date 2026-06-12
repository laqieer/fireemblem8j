extern int DrawMusicPlayerTime();
extern int SoundRoom_DrawVolumeGraphSprites();
#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gSprite_MusicPlayer_SeekBar[];
extern u16 gSprite_MusicPlayer_SeekBarIndicator[];
extern u16 gSprite_RandomModeBanner[];
extern u16 gSprite_SoundRoom_AButtonPlay[];
extern u16 gSprite_SoundRoom_SelectButtonRandom[];
extern u16 gSprite_SoundRoom_StartButtonStop[];

struct SoundRoomSpriteDrawProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
};

void SoundRoom_DrawSongTitleSprites(int y, u16 unk);

//! FE8U = 0x080B0324
void SoundRoom_DrawSprites_Loop(struct SoundRoomSpriteDrawProc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;

    SoundRoom_DrawSongTitleSprites(parent->unk_3c * 8 + 6, 0x100);

    if (parent->isSongPlaying != 0)
    {
        int y = OAM0_Y(parent->unk_3c * 8 + 36);

        // Draw "Random Mode" banner
        PutSpriteExt(0, 4, OAM0_Y((12 - parent->unk_3c) * 8 + 4) + OAM0_BLEND, gSprite_RandomModeBanner, OAM2_PAL(5));

        // Draw "seek bar" for music player
        PutSpriteExt(0, 124, OAM0_Y(y + 1), gSprite_MusicPlayer_SeekBar, OAM2_PAL(4));

        // Draw indicator at the song's current playback position
        PutSpriteExt(
            0, parent->currentSongTime * 66 / (gSoundRoomTable[parent->currentSongIdx].songLength + 120) + 124, y,
            gSprite_MusicPlayer_SeekBarIndicator, OAM2_PAL(4));

        DrawMusicPlayerTime(48, y, parent->currentSongTime);
    }

    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 17), 88, gSprite_SoundRoom_AButtonPlay, OAM2_PAL(3));
    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 17), 104, gSprite_SoundRoom_StartButtonStop, OAM2_PAL(3));
    PutSprite(0xb, OAM1_X(parent->unk_3d * 8 + 17), 120, gSprite_SoundRoom_SelectButtonRandom, OAM2_PAL(3));

    SoundRoom_DrawVolumeGraphSprites(proc);

    return;
}
