#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

extern struct ProcCmd sMusicProc2Script[];

int IsMusicProc2Running(void)
{
    if (Proc_Find(sMusicProc2Script) != NULL)
        return TRUE;
    else
        return FALSE;
}
