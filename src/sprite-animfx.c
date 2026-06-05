#include "global.h"
#include "proc.h"
#include "ap.h"
#include "ctc.h"
#include "sysutil.h"
#include "sprite-animfx.h"



void EventSpriteAnim_Init(struct ProcEventSpriteAnim * proc)
{
    int x = proc->x - gBmSt.camera.x + 8;
    int y = proc->y - gBmSt.camera.y + 8;
    const struct EventSpriteAnimConf * priv = proc->priv;

    proc->approc = StartSpriteAnimfx(
        priv->img,
        priv->pal,
        priv->ap_conf,
        OAM1_X(x),
        OAM0_Y(y) + priv->oam0,
        0,
        priv->pal_bank,
        priv->pal_size,
        priv->oam2,
        4
    );
}
