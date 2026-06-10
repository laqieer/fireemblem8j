#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

extern struct ProcCmd sMusicProc4Script[];

s8 MusicProc4Exists(void)
{
    if (Proc_Find(sMusicProc4Script) != NULL)
        return TRUE;
    else
        return FALSE;
}
