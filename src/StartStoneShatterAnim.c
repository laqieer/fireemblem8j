#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bm.h"
#include "sysutil.h"
#include "constants/songs.h"

extern struct ProcCmd CONST_DATA gProcScr_StoneShatterEvent[];
extern struct BmBgxConf CONST_DATA BmBgxConf_StoneShatter[];

//! FE8U = 0x08012DB4
void StartStoneShatterAnim(struct Unit * unit, ProcPtr proc)
{
    int x;
    int y;

    ProcPtr child = Proc_StartBlocking(gProcScr_StoneShatterEvent, proc);

    do
    {
        proc = child;
    } while (0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendAlpha(0x10, 0x10);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    x = (s16)(unit->xPos * 16 - gBmSt.camera.x - 16);
    y = (s16)(unit->yPos * 16 - gBmSt.camera.y - 24);
    StartBmBgfx(BmBgxConf_StoneShatter, BG_2, x, y, 0, 0x2000, 0xf, NULL, proc);

    PlaySoundEffect(SONG_SE_SHATTER_STONE);
}
