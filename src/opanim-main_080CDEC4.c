#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

//! FE8U = 0x080C8ED4
void OpAnimFaceMontageEwanGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 0x12);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 0x12);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceEwan, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceEwan, 0x200, 0x20);
            Decompress(Img_OpAnimFaceEwanShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceTethys, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceTethys, 0x240, 0x20);
            Decompress(Img_OpAnimFaceTethysShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceGerik, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceGerik, 0x280, 0x20);
            Decompress(Img_OpAnimFaceGerikShadow, (void *)0x06014B00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceMarisa, (void *)0x06015A00);
            CopyToPalOpAnim(Pal_OpAnimFaceMarisa, 0x2c0, 0x20);
            Decompress(Img_OpAnimFaceMarisaShadow, (void *)0x06016900);

            break;
    }

    if (proc->timer == 7)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9024
void OpAnimFaceMontageGarciaGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 0xe);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 0xe);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceGarcia, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceGarcia, 0x200, 0x20);
            Decompress(Img_OpAnimFaceGarciaShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceRoss, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceRoss, 0x240, 0x20);
            Decompress(Img_OpAnimFaceRossShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9100
void OpAnimFaceMontageVanessaGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 0xc);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 0xc);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceVanessa, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceVanessa, 0x200, 0x20);
            Decompress(Img_OpAnimFaceVanessaShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceTana, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceTana, 0x240, 0x20);
            Decompress(Img_OpAnimFaceTanaShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceSyrene, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceSyrene, 0x280, 0x20);
            Decompress(Img_OpAnimFaceSyreneShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 9)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9218
void OpAnimFaceMontageGilliamGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 10);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 10);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceGilliam, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceGilliam, 0x200, 0x20);
            Decompress(Img_OpAnimFaceGilliamShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceInnes, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceInnes, 0x240, 0x20);
            Decompress(Img_OpAnimFaceInnesShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceMoulder, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceMoulder, 0x280, 0x20);
            Decompress(Img_OpAnimFaceMoulderShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 10)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9330
void OpAnimFaceMontageColmGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 9);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 9);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceColm, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceColm, 0x200, 0x20);
            Decompress(Img_OpAnimFaceColmShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceNeimi, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceNeimi, 0x240, 0x20);
            Decompress(Img_OpAnimFaceNeimiShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 11)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C940C
void OpAnimFaceMontageKnollGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 8);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 8);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceKnoll, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceKnoll, 0x200, 0x20);
            Decompress(Img_OpAnimFaceKnollShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceNatasha, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceNatasha, 0x240, 0x20);
            Decompress(Img_OpAnimFaceNatashaShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceCormag, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceCormag, 0x280, 0x20);
            Decompress(Img_OpAnimFaceCormagShadow, (void *)0x06014B00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceAmelia, (void *)0x06015A00);
            CopyToPalOpAnim(Pal_OpAnimFaceAmelia, 0x2c0, 0x20);
            Decompress(Img_OpAnimFaceAmeliaShadow, (void *)0x06016900);

            break;
    }

    if (proc->timer == 12)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C955C
void OpAnimFaceMontageLuteGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 7);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 7);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceLute, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceLute, 0x200, 0x20);
            Decompress(Img_OpAnimFaceLuteShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceArtur, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceArtur, 0x240, 0x20);
            Decompress(Img_OpAnimFaceArturShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 13)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9638
void OpAnimFaceMontageDuesselGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 6);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 6);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceDuessel, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceDuessel, 0x200, 0x20);
            Decompress(Img_OpAnimFaceDuesselShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceSelena, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceSelena, 0x240, 0x20);
            Decompress(Img_OpAnimFaceSelenaShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceGlen, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceGlen, 0x280, 0x20);
            Decompress(Img_OpAnimFaceGlenShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 14)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9750
void OpAnimFaceMontageKyleGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 5);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 5);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceKyle, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceKyle, 0x200, 0x20);
            Decompress(Img_OpAnimFaceKyleShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceFranz, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceFranz, 0x240, 0x20);
            Decompress(Img_OpAnimFaceFranzShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceForde, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceForde, 0x280, 0x20);
            Decompress(Img_OpAnimFaceFordeShadow, (void *)0x06014B00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceSeth, (void *)0x06015A00);
            CopyToPalOpAnim(Pal_OpAnimFaceSeth, 0x2c0, 0x20);
            Decompress(Img_OpAnimFaceSethShadow, (void *)0x06016900);

            break;
    }

    if (proc->timer == 15)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C98A0
void OpAnimFaceMontageValterGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 4);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 4);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceValter, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceValter, 0x200, 0x20);
            Decompress(Img_OpAnimFaceValterShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceRiev, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceRiev, 0x240, 0x20);
            Decompress(Img_OpAnimFaceRievShadow, (void *)0x06012D00);

            break;

        case 3:
            Decompress(Img_OpAnimFaceCaellach, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceCaellach, 0x280, 0x20);
            Decompress(Img_OpAnimFaceCaellachShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 16)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C99B8
void OpAnimFaceMontageLyonGroup(struct ProcOpAnim * proc)
{
    int ret;

    ret = DivRem(proc->unk3E, 3);
    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, ret, 3);

    if (ret < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, ret, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - ret, 0x10, 8);
    }

    proc->unk3E++;

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceLyon, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceLyon, 0x200, 0x20);
            Decompress(Img_OpAnimFaceLyonShadow, (void *)0x06010F00);

            break;

        case 2:
            Decompress(Img_OpAnimFaceVigarde, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceVigarde, 0x240, 0x20);
            Decompress(Img_OpAnimFaceVigardeShadow, (void *)0x06012D00);

            break;
    }

    if (proc->timer == 18)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
