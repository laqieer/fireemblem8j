#include "global.h"

//! FE8U = 0x08030930
void WfxFlamesUpdateGradient(void);
void WfxFlamesUpdateParticles(void);

void WfxFlames_VSync(void)
{
    WfxFlamesUpdateGradient();
    WfxFlamesUpdateParticles();
}
