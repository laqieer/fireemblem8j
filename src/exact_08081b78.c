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






/* prototypes for same-file helpers called by this run */
void StartStarRotationEffect(int xCenter, int yCenter, int lo, int hi, int start, int end, int terminator);

void StartStarExplosionEffect(int x, int y)
{
    StartStarRotationEffect(x, y, 1, 0xC8, 0, 0x50, 0x28);
}
