#include "gbafe.h"

void EfxBgFlashingForDragon(struct Anim * anim)
{
    u16 * pal;
    switch (GetBanimDragonStatusType())
    {
        case EKRDRGON_TYPE_NORMAL:
        case EKRDRGON_TYPE_MYRRH:
            return;
        
        case EKRDRGON_TYPE_DRACO_ZOMBIE:
            pal = Pal_BanimUnitFlashing;
            break;
    
        case EKRDRGON_TYPE_DEMON_KING:
            pal = Pal_BanimUnitFlashing;
            break;
    }

    if (GetAnimPosition(anim) == EKR_POS_L)
        CpuFastCopy(pal, PAL_BG(6), 0x20);
    else
        CpuFastCopy(pal, PAL_BG(7), 0x20);

    EnablePaletteSync();
}

u16 * GetEkrDragonPalette(void)
{
    u32 type = GetBanimDragonStatusType();
    switch (type) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
        return Pal_EfxDracoZombie;

    case EKRDRGON_TYPE_DEMON_KING:
        return Pal_DemonKingBG;

    case EKRDRGON_TYPE_NORMAL:
    case EKRDRGON_TYPE_MYRRH:
        break;
    }

    /**
     * return NULL;
     */
}

void SetEkrDragonPaletteBack(int pos)
{
    if (pos == EKR_POS_L)
        CpuFastCopy(GetEkrDragonPalette(), PAL_OBJ(0x7), 0x20);
    else
        CpuFastCopy(GetEkrDragonPalette(), PAL_OBJ(0x9), 0x20);

    EnablePaletteSync();
}

void SetEkrDragonPaletteFront(int pos)
{
    if (pos == EKR_POS_L)
        CpuFastCopy(GetEkrDragonPalette(), PAL_BG(0x6), 0x20);
    else
        CpuFastCopy(GetEkrDragonPalette(), PAL_BG(0x7), 0x20);

    EnablePaletteSync();
}

void BanimSetFrontPaletteForDragon(struct Anim * anim)
{
    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL && GetBanimDragonStatusType() != EKRDRGON_TYPE_MYRRH)
        SetEkrDragonPaletteFront(GetAnimPosition(anim));
}

void NewEkrDragonQuakeTree3(struct EkrDragonQuakePriv *priv, int b, int c)
{
    NewEkrDragonQuake(priv, b, c, PROC_TREE_3);
}

void NewEkrDragonQuake(struct EkrDragonQuakePriv *priv, int b, int c, ProcPtr parent)
{
    struct ProcEkrDragonQuake * proc;
    
    proc = Proc_Start(ProcScr_ekrDragonQuake, parent);
    proc->priv = priv;
    proc->subproc = NewEfxQuakePure(c, 0);
    proc->unk2C = 0;
    proc->unk2E = b;
}
