#include "scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h"
#include "global.h"
#include "tools/m2c/m2c_macros.h"
#define PrepareBattleGraphicsMaybe impl_PrepareBattleGraphicsMaybe
#define subroutine_arg0 impl_subroutine_arg0
#include "src/nonmatching/sub_8057F80.c"
#undef subroutine_arg0
#undef PrepareBattleGraphicsMaybe
#define PrepareBattleGraphicsMaybe ref_PrepareBattleGraphicsMaybe
#define subroutine_arg0 ref_subroutine_arg0
#define CheckBanimHensei refcallee_CheckBanimHensei
#define CheckBattleScripted refcallee_CheckBattleScripted
#define FilterBattleAnimCharacterPalette refcallee_FilterBattleAnimCharacterPalette
#define GetBanimBackgroundIndex refcallee_GetBanimBackgroundIndex
#define GetBanimFactionPalette refcallee_GetBanimFactionPalette
#define GetBanimLinkArenaFlag refcallee_GetBanimLinkArenaFlag
#define GetBanimTerrainGround refcallee_GetBanimTerrainGround
#define GetBattleAnimArenaFlag refcallee_GetBattleAnimArenaFlag
#define GetBattleAnimPreconfType refcallee_GetBattleAnimPreconfType
#define GetBattleAnimationId refcallee_GetBattleAnimationId
#define GetItemAttributes refcallee_GetItemAttributes
#define GetItemIndex refcallee_GetItemIndex
#define GetROMChapterStruct refcallee_GetROMChapterStruct
#define GetSpellAnimId refcallee_GetSpellAnimId
#define GetSpellAssocCharCount refcallee_GetSpellAssocCharCount
#define IsItemDisplayedInBattle refcallee_IsItemDisplayedInBattle
#define IsItemEffectiveAgainst refcallee_IsItemEffectiveAgainst
#define IsUnitEffectiveAgainst refcallee_IsUnitEffectiveAgainst
#define ParseBattleHitToBanimCmd refcallee_ParseBattleHitToBanimCmd
#define ResetEkrDragonStatus refcallee_ResetEkrDragonStatus
#define SetBanimArenaFlag refcallee_SetBanimArenaFlag
#define SetBanimLinkArenaFlag refcallee_SetBanimLinkArenaFlag
#define SetBattleUnscripted refcallee_SetBattleUnscripted
#define SetEkrDragonStatusType refcallee_SetEkrDragonStatusType
#define UnsetMapStaffAnim refcallee_UnsetMapStaffAnim
s32 ref_subroutine_arg0;
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8057F80/sub_8057F80_ref_clean.c"
#undef UnsetMapStaffAnim
#undef SetEkrDragonStatusType
#undef SetBattleUnscripted
#undef SetBanimLinkArenaFlag
#undef SetBanimArenaFlag
#undef ResetEkrDragonStatus
#undef ParseBattleHitToBanimCmd
#undef IsUnitEffectiveAgainst
#undef IsItemEffectiveAgainst
#undef IsItemDisplayedInBattle
#undef GetSpellAssocCharCount
#undef GetSpellAnimId
#undef GetROMChapterStruct
#undef GetItemIndex
#undef GetItemAttributes
#undef GetBattleAnimationId
#undef GetBattleAnimPreconfType
#undef GetBattleAnimArenaFlag
#undef GetBanimTerrainGround
#undef GetBanimLinkArenaFlag
#undef GetBanimFactionPalette
#undef GetBanimBackgroundIndex
#undef FilterBattleAnimCharacterPalette
#undef CheckBattleScripted
#undef CheckBanimHensei
#undef subroutine_arg0
#undef PrepareBattleGraphicsMaybe

/* Stop-loss shared-oracle skeleton: enough to expose the next wall without
 * hand-writing 204 call sites.  Full anti-masking requires extending the generated
 * inventory in oracle_stubs.generated.h with per-callee argument records. */
#include "oracle_stubs.generated.h"

static int ret_i[512];
static unsigned ci;
static struct ROMChapterData g_oracle_chapter;
static u32 g_out_words[512];
static unsigned coi;

static int next_i(void) { unsigned k = ci++; ASSERT(k < 512, "oracle return bound"); return ret_i[k]; }
static void write_out32(void *p) { unsigned k = coi++; ASSERT(k < 512, "oracle out bound"); if (p) *(u32 *)p = g_out_words[k]; }
static void write_out16(void *p) { unsigned k = coi++; ASSERT(k < 512, "oracle out bound"); if (p) *(u16 *)p = (u16)g_out_words[k]; }

int CheckBanimHensei(void) { return next_i(); }
bool CheckBattleScripted(void) { return (bool)next_i(); }
u16 * FilterBattleAnimCharacterPalette(s16 a, u16 b) { (void)a; (void)b; return (u16 *)0; }
int GetBanimBackgroundIndex(u16 a, u16 b) { (void)a; (void)b; return next_i(); }
int GetBanimFactionPalette(u32 a) { (void)a; return next_i(); }
int GetBanimLinkArenaFlag(void) { return next_i(); }
int GetBanimTerrainGround(u16 a, u16 b) { (void)a; (void)b; return next_i(); }
int GetBattleAnimArenaFlag(void) { return next_i(); }
int GetBattleAnimPreconfType(void) { return next_i(); }
u16 GetBattleAnimationId(struct Unit *u, const struct BattleAnimDef *d, u16 w, u32 *out) { (void)u; (void)d; (void)w; write_out32(out); return (u16)next_i(); }
int GetItemAttributes(int item) { (void)item; return next_i(); }
int GetItemIndex(int item) { (void)item; return next_i(); }
const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex) { (void)chIndex; return &g_oracle_chapter; }
int GetSelectTargetCount(void) { return next_i(); }
s16 GetSpellAnimId(u16 jid, u16 weapon) { (void)jid; (void)weapon; return (s16)next_i(); }
u8 GetSpellAssocCharCount(u16 item) { (void)item; return (u8)next_i(); }
u16 IsItemDisplayedInBattle(u16 item) { (void)item; return (u16)next_i(); }
s8 IsItemEffectiveAgainst(u16 item, struct Unit* unit) { (void)item; (void)unit; return (s8)next_i(); }
s8 IsUnitEffectiveAgainst(struct Unit* a, struct Unit* b) { (void)a; (void)b; return (s8)next_i(); }
void ParseBattleHitToBanimCmd(void) { }
void ResetEkrDragonStatus(void) { }
void SetBanimArenaFlag(int flag) { (void)flag; }
void SetBanimLinkArenaFlag(int flag) { (void)flag; }
void SetBattleUnscripted(void) { }
void SetEkrDragonStatusType(struct Anim *anim, u8 type) { (void)anim; (void)type; }
void UnsetMapStaffAnim(s16 *out, u16 pos, u16 weapon) { (void)pos; (void)weapon; write_out16(out); }

s32 refcallee_CheckBanimHensei(void) { return next_i(); }
s8 refcallee_CheckBattleScripted(void) { return (s8)next_i(); }
s32 refcallee_FilterBattleAnimCharacterPalette(s16 a, u16 b) { (void)a; (void)b; return 0; }
s16 refcallee_GetBanimBackgroundIndex(u16 a, u8 b) { (void)a; (void)b; return (s16)next_i(); }
s16 refcallee_GetBanimFactionPalette(s32 a) { (void)a; return (s16)next_i(); }
s32 refcallee_GetBanimLinkArenaFlag(void) { return next_i(); }
u16 refcallee_GetBanimTerrainGround(u8 a, u8 b) { (void)a; (void)b; return (u16)next_i(); }
s32 refcallee_GetBattleAnimArenaFlag(void) { return next_i(); }
s32 refcallee_GetBattleAnimPreconfType(void) { return next_i(); }
s16 refcallee_GetBattleAnimationId(void *u, s32 d, u16 w, void *out) { (void)u; (void)d; (void)w; write_out32(out); return (s16)next_i(); }
s32 refcallee_GetItemAttributes(u16 item) { (void)item; return next_i(); }
u16 refcallee_GetItemIndex(u16 item) { (void)item; return (u16)next_i(); }
void *refcallee_GetROMChapterStruct(s8 chIndex) { (void)chIndex; return &g_oracle_chapter; }
s16 refcallee_GetSpellAnimId(u8 jid, u16 weapon) { (void)jid; (void)weapon; return (s16)next_i(); }
u8 refcallee_GetSpellAssocCharCount(u16 item) { (void)item; return (u8)next_i(); }
s32 refcallee_IsItemDisplayedInBattle(u16 item) { (void)item; return next_i(); }
s8 refcallee_IsItemEffectiveAgainst(u16 item, void *unit) { (void)item; (void)unit; return (s8)next_i(); }
s8 refcallee_IsUnitEffectiveAgainst(void *a, void *b) { (void)a; (void)b; return (s8)next_i(); }
M2C_UNK refcallee_ParseBattleHitToBanimCmd(void) { return 0; }
M2C_UNK refcallee_ResetEkrDragonStatus(void) { return 0; }
M2C_UNK refcallee_SetBanimArenaFlag(s32 flag) { (void)flag; return 0; }
M2C_UNK refcallee_SetBanimLinkArenaFlag(s32 flag) { (void)flag; return 0; }
M2C_UNK refcallee_SetBattleUnscripted(void) { return 0; }
M2C_UNK refcallee_SetEkrDragonStatusType(s32 anim, s32 type) { (void)anim; (void)type; return 0; }
M2C_UNK refcallee_UnsetMapStaffAnim(s32 out, s32 pos, u16 weapon) { (void)pos; (void)weapon; write_out16((void *)out); return 0; }

int main(void) {
    static struct CharacterData ch[2];
    static struct ClassData cl[2];
    int r_ref, r_impl;

    gBattleActor.unit.pCharacterData = &ch[0];
    gBattleActor.unit.pClassData = &cl[0];
    gBattleTarget.unit.pCharacterData = &ch[1];
    gBattleTarget.unit.pClassData = &cl[1];
    ch[0].number = 1;
    ch[1].number = 1;
    { int i; for (i = 0; i < 64; i++) { ret_i[i] = nondet_int(); g_out_words[i] = nondet_uint(); } }
    ci = 0;
    coi = 0;
    r_ref = ref_PrepareBattleGraphicsMaybe();
    ci = 0;
    coi = 0;
    r_impl = impl_PrepareBattleGraphicsMaybe();
    ASSERT(r_ref == r_impl, "return equal");
    return 0;
}
