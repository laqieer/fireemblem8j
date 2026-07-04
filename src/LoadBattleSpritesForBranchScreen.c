#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "bmunit.h"
#include "bmitem.h"

void EndBanimTerrain(void *);
void EndEfxAnimeDrvProc(void);
void EndEkrUnitMainMini(struct AnimBuffer *);
void ClassChgSel_StartClassBattleSprite(int a, int b, int c, int d, int e);
void ClassChgSel_SetupBattleTerrain(u32 a, s16 b, s16 c);
void LoadClassNameInClassReelFont(struct ProcPromoSel *proc);
u16 GetBattleAnimationId(struct Unit *, const struct BattleAnimDef *, u16, u32 *);

void LoadBattleSpritesForBranchScreen(struct ProcPromoSel *proc)
{
    u32 a;
    u8 b;
    struct Anim *anim1;
    struct ProcPromoSel *p2;
    struct Anim *anim2;
    struct ProcPromoSel *c2;
    struct Unit copied_unit;
    void *tmp;
    u16 chara_pal;

    anim1 = gUnk_81.anim1;
    anim2 = gUnk_81.anim2;

    p2 = (void *)gEkrbattle_9.proc14;
    c2 = (void *)gEkrbattle_9.proc18;

    a = proc->stat;
    tmp = &gUnk_81;

    if (a == 1)
    {
        s16 i;
        struct Unit *unit;
        const struct BattleAnimDef *battle_anim_ptr;
        u32 battle_anim_id;
        int ret;

        if ((s16)p2->sprite[0] <= 0x117)
        {
            p2->sprite[0] += 12;
            c2->sprite[0] += 12;
            anim1->xPosition += 12;
            anim2->xPosition = anim1->xPosition;
        }
        else
        {
            proc->stat = 2;
        }

        if (proc->stat == 2)
        {
            int _pidr;
            int _jidr;
            register int chara_palr asm("sl");
            EndEfxAnimeDrvProc();
            EndEkrUnitMainMini(&gUnk_81);
            _pidr = (s16)(proc->pid - 1);
            _jidr = (s16)proc->jid[proc->main_select];
            chara_palr = -1;
            unit = GetUnitFromCharId(proc->pid);
            copied_unit = *unit;
            copied_unit.pClassData = GetClassData(proc->jid[proc->main_select]);
            battle_anim_ptr = copied_unit.pClassData->pBattleAnimDef;
            ret = (s16)GetBattleAnimationId(&copied_unit, battle_anim_ptr,
                (u16)GetUnitEquippedWeapon(&copied_unit), &battle_anim_id);
            for (i = 0; i <= 6; i++)
            {
                if (gAnimCharaPalConfig[_pidr][i] == _jidr)
                {
                    chara_palr = gAnimCharaPalIt[_pidr][i] - 1;
                    break;
                }
            }
            ClassChgSel_StartClassBattleSprite(ret, chara_palr,
                (s16)(p2->sprite[0] + 0x28), 0x58, 6);
            EndBanimTerrain(&gEkrbattle_9);
            ClassChgSel_SetupBattleTerrain(proc->u50, p2->sprite[0], p2->msg_desc[1]);
        }
        else
        {
            goto D1AC;
        }
    }

    b = proc->stat;
    tmp = &gUnk_81;
    if (b == 2)
    {
        if ((s16)p2->sprite[0] > 0x82)
        {
            register u16 off asm("r2") = 12;
            register struct ProcPromoSel *c2t asm("r3");
            struct Anim *a1t;
            p2->sprite[0] -= off;
            c2t = c2;
            c2t->sprite[0] -= off;
            a1t = anim1;
            a1t->xPosition -= off;
            anim2->xPosition = a1t->xPosition;
        }
        else
        {
            proc->stat = 0;
        }
    }

D1AC:
    if ((u8)IsMainMiniAnimRoundEnd(tmp))
    {
        ApplyMainMiniAnimHitEffect(tmp);
    }
    LoadClassNameInClassReelFont(proc);
    return;
}
