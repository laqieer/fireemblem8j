#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "bm.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "constants/faces.h"
#include "face.h"

void PutFace80x72(ProcPtr proc, u16 * bgOut, int fid, int tileId, int palId)
{
    Proc_EndEach(gProcScr_Face_0);
    PutFace80x72_Core(bgOut, fid, tileId, palId);
    GetPortraitData(fid);
    return;
}
