#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);



void EkrDispUpClear4C50(void)
{
    gpProcEkrDispUP->unk4C = 0;
    gpProcEkrDispUP->unk50 = 0;
}

void EkrDispUpSet4C50(void)
{
    gpProcEkrDispUP->unk4C = 1;
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUpSet4C(void)
{
    gpProcEkrDispUP->unk4C = 1;
}

void EkrDispUpSet50(void)
{
    gpProcEkrDispUP->unk50 = 1;
}

void EkrDispUP_SetPositionUnsync(u16 x, u16 y)
{
    gpProcEkrDispUP->x = x; /* unused actually */
    gpProcEkrDispUP->y = y; /* unused actually */
    gpProcEkrDispUP->sync = 0;
}

void EkrDispUP_SetPositionSync(u16 x, u16 y)
{
    gpProcEkrDispUP->x = x; /* unused actually */
    gpProcEkrDispUP->y = y; /* unused actually */
    gpProcEkrDispUP->sync = 1;
}

void SyncEkrDispUP(void)
{
    gpProcEkrDispUP->sync = true;
}

void UnsyncEkrDispUP(void)
{
    gpProcEkrDispUP->sync = false;
}

void AsyncEkrDispUP(void)
{
    gpProcEkrDispUP->asnyc = true;
}

void UnAsyncEkrDispUP(void)
{
    gpProcEkrDispUP->asnyc = false;
}
