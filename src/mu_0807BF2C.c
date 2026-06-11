#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"


extern EWRAM_OVERLAY(0) u8 gMUGfxBuffer[MU_GFX_MAX_SIZE * MU_MAX_COUNT];

extern const u16 * CONST_DATA gMuFlashPalLut[];







extern u16 CONST_DATA MuSoundScr_Foot[];

extern u16 CONST_DATA MuSoundScr_FootHeavy[];

extern u16 CONST_DATA MuSoundScr_Mounted[];

extern u16 CONST_DATA MuSoundScr_Wyvern[];

extern u16 CONST_DATA MuSoundScr_Pegasus[];



extern u16 CONST_DATA MuSoundScr_Zombie[];

extern u16 CONST_DATA MuSoundScr_Skeleton[];

extern u16 CONST_DATA MuSoundScr_Mogall[];

extern u16 CONST_DATA MuSoundScr_Spider[];

extern u16 CONST_DATA MuSoundScr_Dog[];

extern u16 CONST_DATA MuSoundScr_Gorgon[];



extern u16 CONST_DATA MuSoundScr_Boat[];

extern u16 CONST_DATA MuSoundScr_Myrrh[];



extern struct ProcCmd CONST_DATA ProcScr_Mu[];









extern struct ProcCmd CONST_DATA ProcScr_MuDeathFade[];







extern struct ProcCmd CONST_DATA ProcScr_MuRestorePalInfo[];





/* prototypes for same-file helpers called by this run */
void* GetMuImgBufById(int slot);
const void * GetMuImg(struct MuProc * proc);
const void * GetMuAnimForJid(u16 jid);

void SetMuSpecialSprite(struct MuProc * proc, int jid, const u16 * pal)
{
    proc->sprite_anim->frameTimer = 0;
    proc->sprite_anim->frameInterval = 0;

    proc->jid = jid;

    AP_SetDefinition(
        proc->sprite_anim,
        GetMuAnimForJid(proc->jid)
    );

    Decompress(
        GetMuImg(proc),
        GetMuImgBufById(proc->config->slot)
    );

    ApplyPalette(pal, 0x10 + proc->config->pal);
}
