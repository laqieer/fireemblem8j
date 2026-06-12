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
extern s8 * gSoundRoomShuffleBuffer;

bool StartSoundRoomSong(struct SoundRoomProc * proc, int index, int flagsMaybe);
void DrawSoundRoomSongTitle(int index);

//! FE8U = 0x080AEEE8
void SoundRoomSongChange_StartNext(struct Proc * proc)
{
    struct SoundRoomProc * parent = proc->proc_parent;
    StartSoundRoomSong(parent, gSoundRoomShuffleBuffer[parent->shuffleIndex], 0);
    DrawSoundRoomSongTitle(parent->currentSongIdx);
    parent->unk_3f = 0;
    return;
}
