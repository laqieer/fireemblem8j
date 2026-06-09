#include "global.h"

#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"

#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

struct WeaponTriangleRule {
    s8 attackerWeaponType;
    s8 defenderWeaponType;
    s8 hitBonus;
    s8 atkBonus;
};





EWRAM_DATA struct BattleStats gBattleStats = {};







static EWRAM_DATA struct {
    u8 unk00;
    u8 unk01;
    u8 unk02;
} sBmbattle_0 = {};

/* prototypes for same-file helpers called by this run */
void BattleGenerateSimulationInternal(struct Unit* actor, struct Unit* target, int x, int y, int actorWpnSlot);
void BattleGenerateRealInternal(struct Unit* actor, struct Unit* target);

void BattleGenerateSimulation(struct Unit* actor, struct Unit* target, int x, int y, int actorWpnSlot) {
    if (x < 0 && y < 0) {
        x = actor->xPos;
        y = actor->yPos;
    }

    gBattleStats.config = BATTLE_CONFIG_SIMULATE;
    BattleGenerateSimulationInternal(actor, target, x, y, actorWpnSlot);
}

void BattleGenerateReal(struct Unit* actor, struct Unit* target) {
    gBattleStats.config = BATTLE_CONFIG_REAL;
    BattleGenerateRealInternal(actor, target);
}

void BattleGenerateBallistaSimulation(struct Unit* actor, struct Unit* target, int x, int y) {
    gBattleStats.config = BATTLE_CONFIG_SIMULATE | BATTLE_CONFIG_BALLISTA;
    BattleGenerateSimulationInternal(actor, target, x, y, 0);
}

void BattleGenerateBallistaReal(struct Unit* actor, struct Unit* target) {
    gBattleStats.config = BATTLE_CONFIG_REAL | BATTLE_CONFIG_BALLISTA;
    BattleGenerateRealInternal(actor, target);
}
