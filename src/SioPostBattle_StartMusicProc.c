#include "global.h"
#include "sio.h"

extern struct ProcCmd ProcScr_SioPostBattle_PlayMusic[];

ProcPtr SioPostBattle_StartMusicProc(struct SioPostBattleProc * parent)
{
    struct SioPostBattleMusicProc * proc = Proc_Start(ProcScr_SioPostBattle_PlayMusic, parent);

    if (parent->playerId == parent->unk_44[0].playerId)
    {
        proc->isPlayerWinner = 1;
    }
    else
    {
        proc->isPlayerWinner = 0;
    }

    return proc;
}
