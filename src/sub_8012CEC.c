#include "global.h"
#include "proc.h"
#include "bmfx.h"
#include "soundwrapper.h"
#include "constants/songs.h"

extern u8 data_085BA36C[];
void StartEventEarthQuake(u8 type, u8 direction, int play_sound) {
    int ps = (s8)play_sound;
    struct ProcBmFx * proc = Proc_Find((const struct ProcCmd *)data_085BA36C);
    if (!proc) {
        if (1 == ps)
            PlaySoundEffect(SONG_26A);
        proc = Proc_Start((const struct ProcCmd *)data_085BA36C, PROC_TREE_3);
    }
    proc->type = type;
    proc->position = direction;
}
