#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"

static struct MapAnimStarfxConf gMapAnimStarfxConfs[0x10];
static u16 sSpellAssocPalBackup[0xA0];



/* prototypes for same-file helpers called by this run */
void LoadSparkGfx(void);
void PutSparkGfx(int x, int y);

void PutSparkGfxRotation(int xCenter, int yCenter, int distance, int angle)
{
    PutSparkGfx(
        xCenter + ((SIN(angle) * distance) >> 12),
        yCenter + ((COS(angle) * distance) >> 12));
}

void MapAnimRotation_Init(struct MAStarProc * proc)
{
    int i;

    LoadSparkGfx();

    for (i = 0; i < 16; ++i)
    {
        gMapAnimStarfxConfs[i].distance = 0x10;
        gMapAnimStarfxConfs[i].angle = i << 8;
    }

    proc->distance = 0;
    proc->angle = 0;
    proc->timer = proc->start;
}
