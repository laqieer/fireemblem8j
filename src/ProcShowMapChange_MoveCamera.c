#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "proc.h"
#include "hardware.h"
#include "ap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "bmmap.h"
#include "bm.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "constants/songs.h"

struct ShowMapChangeProc{
    PROC_HEADER;

    /* 2C */ int mcId;
    /* 30 */ int altSong;
    /* 34 */ int sndx;
};

void ProcShowMapChange_MoveCamera(struct ShowMapChangeProc * proc)
{
    const struct MapChange *info = GetMapChange(proc->mcId);

    int x = info->xOrigin + info->xSize / 2;
    int y = info->yOrigin + info->ySize / 2;

    EnsureCameraOntoPosition(proc, x, y);

    proc->sndx = x;
}
