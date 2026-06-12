#include "global.h"

#include "cp_common.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmusemind.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "hardware.h"
#include "bmtrap.h"
#include "playerphase.h"
#include "popup.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmbattle.h"
#include "eventinfo.h"

#include "cp_perform.h"

#include "constants/terrains.h"
#include "constants/songs.h"

struct UnkProcA {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 pad_2A;
    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    u8 _pad1[0x58-0x34];
    /* 58 */ int unk_58;
    u8 _pad2[0x64-0x5C];
    /* 64 */ s16 unk_64;
};

struct CpPerformProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ s8(*func)(struct CpPerformProc* proc);
    /* 30 */ u8 unk_30;
    /* 31 */ u8 isUnitVisible;
};

void AiTargetCursor_Main(struct UnkProcA* proc);

extern struct ProcCmd CONST_DATA gProcScr_AiTargetCursor[];

void CpPerform_UpdateMapMusic(void);
void CpPerform_MoveCameraOntoUnit(struct CpPerformProc* proc);
void CpPerform_BeginUnitMovement(struct CpPerformProc* proc);
void CpPerform_MoveCameraOntoTarget(struct CpPerformProc* proc);
void CpPerform_PerformAction(struct CpPerformProc* proc);
void CpPerform_WaitAction(struct CpPerformProc* proc);
void CpPerform_Cleanup(struct CpPerformProc* proc);
void CpPerform_EquipBest(struct CpPerformProc* proc);



s8 AiDummyAction(struct CpPerformProc*);
s8 AiEscapeAction(struct CpPerformProc*);
s8 AiWaitAndClearScreenAction(struct CpPerformProc*);

s8 AiRideBallistaAction(struct CpPerformProc* proc) {
    gActiveUnit->xPos = gAiDecision.xMove;
    gActiveUnit->yPos = gAiDecision.yMove;

    RideBallista(gActiveUnit);

    return 1;
}
