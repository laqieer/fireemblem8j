#include "global.h"
#include "sio.h"

extern struct ProcCmd ProcScr_LinkArenaPostBattle_DrawSprites[];

ProcPtr StartDrawLinkArenaRankSprites(struct SioPostBattleProc * parent, int delayMaybe, u16 fid, u8 oam2, u8 ranking)
{
    struct SioPostBattleSpritesProc * proc = Proc_Start(ProcScr_LinkArenaPostBattle_DrawSprites, parent);

    proc->unk_2c = parent;
    proc->delayMaybe = delayMaybe;
    proc->fid = fid;
    proc->ranking = ranking;
    proc->oam2 = oam2;

    return proc;
}
