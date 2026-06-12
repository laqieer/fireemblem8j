#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "proc.h"
#include "hardware.h"
#include "ap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "bmmap.h"
#include "bm.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "constants/songs.h"


/**
 * Various Graphical Effects related to activating traps
 * port from fe6@StanHash
 */


/* struct definitions */

struct TrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x4A - 0x34];
    /* 4A */ s16 direction;
    /* 60 */
};

struct UnkTrapfxProc {
    PROC_HEADER;

    /* 2C */ int x, y;
    /* 34 */ u8 _pad_34[0x58 - 0x34];
    /* 58 */ int direction;
    /* 5C */ int timer;
    /* 60 */
};

struct ShowMapChangeProc{
    PROC_HEADER;

    /* 2C */ int mcId;
    /* 30 */ int altSong;
    /* 34 */ int sndx;
};

/* function declarations */
void GasTrapSpriteAnim_Init(struct TrapfxProc *proc);
void FireTrapSpriteAnim_Init(struct TrapfxProc *proc);
void ProcUnkTrapAnimFunc(struct UnkTrapfxProc *proc);
void ArrowTrapSpriteAnim_Init(struct TrapfxProc *proc);
void ProcShowMapChange_MoveCamera(struct ShowMapChangeProc *proc);
void ProcShowMapChange_UpdateGame(struct ShowMapChangeProc *proc);
void PikeTrapSpriteAnim_Init(struct TrapfxProc *proc);


/* section.data */
extern u16 CONST_DATA Img_GasTrapVertical[];
extern u16 CONST_DATA SpriteAnim_GasTrapVertical[];
extern u16 CONST_DATA Img_GasTrapHorizontal[];
extern u16 CONST_DATA SpriteAnim_GasTrapHorizontal[];
extern u16 CONST_DATA Pal_GasTrap[];
extern u16 CONST_DATA Img_FireTrap[];
extern u16 CONST_DATA SpriteAnim_FireTrap[];
extern u16 CONST_DATA Pal_FireTrap[];
extern u16 CONST_DATA Pal_FireTrap2[];
extern u16 CONST_DATA Obj_WallBreakAnim[];
extern u16 CONST_DATA Img_WallBreakAnim[];
extern u16 CONST_DATA Pal_WallBreakAnim[];
extern u16 CONST_DATA Img_ArrowTrap[];
extern u16 CONST_DATA Pal_ArrowTrap[];
extern u16 CONST_DATA SpriteAnim_ArrowTrap[];
extern u16 CONST_DATA Img_PikeTrap[];
extern u16 CONST_DATA Pal_PikeTrap[];
extern u16 CONST_DATA SpriteAnim_PikeTrap[];

extern struct ProcCmd CONST_DATA ProcScr_GasTrapAnim[];

extern struct ProcCmd CONST_DATA ProcScr_FireTrapAnim[];

extern struct ProcCmd CONST_DATA ProcScr_UnkTrapAnim[];

extern struct ProcCmd CONST_DATA ProcScr_ArrowTrapAnim[];





void PikeTrapSpriteAnim_Init(struct TrapfxProc *proc)
{
    int x, y, oam2;

    Decompress(Img_PikeTrap, OBJ_CHR_ADDR(OBJCHR_TRAPFX));
    ApplyPalette(Pal_PikeTrap, 0x10 + OBJPAL_TRAPFX);

    x = proc->x * 16 + 8 - gBmSt.camera.x;
    y = proc->y * 16 + 8 - gBmSt.camera.y;
    oam2 = OAM2_CHR(OBJCHR_TRAPFX) | OAM2_PAL(OBJPAL_TRAPFX) | OAM2_LAYER(1);

    APProc_Create(SpriteAnim_PikeTrap, x, y, oam2, proc->direction, 0);
    PlaySeSpacial(SONG_BB, x + 8);
}
