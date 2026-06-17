#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmsave.h"
#include "chapterdata.h"
#include "bm.h"
#include "rng.h"
#include "scene.h"
#include "gamecontrol.h"
#include "bmdebug.h"
#include "soundroom.h"
#include "menu_def.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sio.h"
#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/chapters.h"

//! FE8U = 0x0801C0FC
int DebugContinueMenuInit(struct MenuProc* menuProc) {
    struct SaveBlockInfo block;
    int fid;

    menuProc->menuItems[5]->itemNumber = 0;

    BG_EnableSyncByMask(1);

    if ((ReadSaveBlockInfo(&block, 3) != 1) || ((((block.checksum32 + (block.checksum32 >> 0x10)) & 0xf)) != 0)) {
        StartFace(0, FID_EPHRAIM, 32, 80, (FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(4)));
        StartFace(1, FID_EIRIKA, 208, 80, (FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(4)));
        return 0;
    }

    fid = ((block.checksum32 & 0xff) % 101) + 1;
    StartFace(0, fid, 32, 80, (FACE_DISP_KIND(FACE_96x80_FLIPPED) | FACE_DISP_HLAYER(4)));
    fid = (((block.checksum32 & 0xff00) >> 8) % 101) + 1;
    StartFace(1, fid, 208, 80, (FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(4)));

    return 0;
}
