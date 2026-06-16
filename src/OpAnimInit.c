#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"


void OpAnimInit(struct ProcOpAnim * proc)
{
    Sound_FadeOutBGM(1);
    SetupBackgrounds(0);
    SetPrimaryHBlankHandler(NULL);

    proc->timer = 0;
    gOpAnimSt.pal = 0;
    gLCDControlBuffer.dispcnt.obj1dMap = 1;
    SetDispEnable(0, 0, 0, 0, 0);

    Decompress(Img_OpAnimSplitLine, OBJ_VRAM0 + 0x0000);
    Decompress(Img_opanim_unk1, OBJ_VRAM0 + 0x0100);
    Decompress(Img_OpAnimEphEirikaName, OBJ_VRAM0 + 0x08C0);
    Decompress(Img_OpAnimDivlEye, OBJ_VRAM0 + 0x19c0);

    CopyToPalOpAnim(Pal_OpAnimSplitLine, 0x200, 0x20);
    CopyToPalOpAnim(Pal_opanim_unk1, 0x220, 0x20);
    CopyToPalOpAnim(Pal_OpAnimEphEirikaName, 0x240, 0x20);
    CopyToPalOpAnim(Pal_OpAnimDivlEye, 0x260, 0x20);

    CpuFastFill16(-1, OBJ_VRAM0 + 0x7800, 0x800);
    SetNextGameActionId(GAME_ACTION_PLAYED_THROUGH);
    NewOpAnimfxTerminator(proc);
}
