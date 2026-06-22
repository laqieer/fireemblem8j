#include "global.h"
#include "proc.h"
#include "worldmap.h"
#include "rng.h"
#include "ap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "soundwrapper.h"
#include "constants/worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

void GmapTimeMons_ExecMonsterMergeMu(struct ProcGmapTimeMons * proc)
{
    int i, wm_uid;
    if (proc->trigger != false)
    {
        PlaySoundEffect(SONG_312);
        for (i = 0; i < proc->monster_amt; i++)
        {
            int x, y;
            s16 x1, y1, x2, y2;

            *&x1 = proc->confs[i].node[gWMNodeData].x;
            *&y1 = proc->confs[i].node[gWMNodeData].y;

            *&x2 = GM_SCREEN->x;
            *&y2 = GM_SCREEN->y;

            x = (s16)(x1 - x2);
            y = (s16)(y1 - y2 + 8);

            if ((u16)y < 0xB0 && (u16)x < 0xF0)
                proc->ap_procs[i] = APProc_Create(Sprite_0, x, y, 0x3880, 0, 7);

            wm_uid = i + 4;
            SetGmClassUnit(wm_uid, proc->confs[i].jid, WM_FACTION_RED, proc->confs[i].node);
            gGMData.units[wm_uid].state |= GM_UNIT_STATE_B0;
            GmShowMuUnit(GM_MU, wm_uid);
        }
        Proc_Break(proc);
    }
}
