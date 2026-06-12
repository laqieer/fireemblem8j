#include "global.h"
#include "hardware.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "icon.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrlevelup.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "constants/songs.h"

void NewEkrPopup(void)
{
    int i;
    struct ProcEkrPopup *proc;

    if (gEkrDistanceType == 4) {
        gpProcEkrPopup = proc = Proc_Start(ProcScr_ekrPopup2, PROC_TREE_3);
        gEkrPopupEnded = 0;

        proc->lbuff = -1;
        proc->ldebuf = -1;

        for (i = 0; i < 8; i++) {
            gpEkrBattleUnitRight = gpEkrBattleUnitRight;
            if (gpEkrBattleUnitRight->unit.ranks[i] == 0) {
                if (gpEkrBattleUnitLeft->unit.ranks[i] != 0) {
                    if (proc->lbuff == -1)
                        proc->lbuff = i;
                    else
                        proc->ldebuf = i;
                }
            }
            gpEkrBattleUnitLeft = gpEkrBattleUnitLeft;
        }

        if (proc->lbuff != -1) {
            Sound_SetSEVolume(0x80);
        } else {
            gEkrPopupEnded = true;
            DeleteAnimsOnPopup();
            return;
        }
    } else {
        gpProcEkrPopup = proc = Proc_Start(ProcScr_ekrPopup, PROC_TREE_3);
        gEkrPopupEnded = 0;
    
        proc->timer = 0;
        proc->ldebuf = 0;
        proc->lbuff = 0;
        proc->rdebuf = 0;
        proc->rbuf = 0;
    
        if (gBanimFactionPal[EKR_POS_L] == FACTION_ID_BLUE)
        {
            if (HasBattleUnitGainedWeaponLevel(gpEkrBattleUnitLeft) == true)
                proc->lbuff = gpEkrBattleUnitLeft->weaponBefore;
    
            if (DidBattleUnitBreakWeapon(gpEkrBattleUnitLeft) == true)
                proc->ldebuf = gpEkrBattleUnitLeft->weaponBefore;
        }
    
        if (gBanimFactionPal[EKR_POS_R] == FACTION_ID_BLUE)
        {
            if (HasBattleUnitGainedWeaponLevel(gpEkrBattleUnitRight) == true)
                proc->rbuf = gpEkrBattleUnitRight->weaponBefore;
    
            if (DidBattleUnitBreakWeapon(gpEkrBattleUnitRight) == true)
                proc->rdebuf = gpEkrBattleUnitRight->weaponBefore;
        }
    
        if (proc->lbuff + proc->ldebuf + proc->rbuf + proc->rdebuf == 0) {
            gEkrPopupEnded = true;
            DeleteAnimsOnPopup();
        } else {
            Sound_SetSEVolume(0x80);
        }
    }
}
