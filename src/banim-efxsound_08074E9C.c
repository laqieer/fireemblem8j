#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(banim) int gEkrMainBgmPlaying;
extern EWRAM_OVERLAY(banim) int gEfxSoundSeExist;

extern CONST_DATA struct ProcCmd ProcScr_efxSoundSE[];

/* prototypes for same-file helpers called by this run */
void EfxPlaySE(int songid, int volume);
void M4aPlayWithPostionCtrl(int songid, int x, int flag);
int GetProperAnimSoundLocation(struct Anim * anim);

void PlaySfxAutomatically(int songid, int volume, struct Anim * anim)
{
    EfxPlaySE(songid, volume);
    M4aPlayWithPostionCtrl(songid, GetProperAnimSoundLocation(anim), 1);
}
