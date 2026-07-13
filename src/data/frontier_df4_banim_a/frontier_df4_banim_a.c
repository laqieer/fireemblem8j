#include "global.h"
#include "anime.h"

#include "proc.h"

extern u32 data_085E1740[];
extern u32 data_085E37E4[];
extern u32 data_085E380C[];
extern u32 data_085E386C[];
extern u32 data_085E3B74[];
extern u32 data_085E3BC4[];
extern u32 data_085E3BEC[];
extern u32 data_085E3C3C[];
extern u32 data_085FF1C0[];
extern u32 data_085FF238[];
extern u32 data_085FF270[];
extern u32 data_085FF308[];
extern u32 data_085FF508[];
extern u32 data_085FF520[];
extern u32 data_085FF538[];
extern u32 data_085FF558[];
extern u32 data_085FF5F0[];
extern u32 data_085FF628[];
extern u32 data_085FF8F0[];
extern u32 data_08600594[];
extern u32 data_08600DB8[];
extern u32 data_08601000[];
extern u32 data_08601108[];
extern u32 data_08601700[];
extern u32 data_08601748[];
extern u32 data_086017A8[];
extern u32 data_086017C0[];
extern u32 data_08601978[];
extern u32 data_086019C0[];
extern u32 data_086019E0[];
extern u32 data_086019F8[];
extern u32 data_08601A40[];
extern u32 data_08601B68[];
extern u32 data_08601B98[];
extern u32 data_08601C68[];
extern u32 data_08601CA0[];
extern u8 frontier_df4_banim_a_000_5E0E94[];
extern u32 frontier_df4_banim_a_001_5E37CC[];
extern u8 frontier_df4_banim_a_003_5E4570[];
extern u8 frontier_df4_banim_a_004_5E4E84[];
extern u8 frontier_df4_banim_a_005_5EA510[];
extern u8 frontier_df4_banim_a_006_5EBF04[];
extern u32 frontier_df4_banim_a_008_5FE7D8[];
extern u32 frontier_df4_banim_a_009_5FF000[];
extern u32 frontier_df4_banim_a_012_600754[];
extern u32 frontier_df4_banim_a_013_601630[];
extern u32 frontier_df4_banim_a_014_601CD8[];
extern u32 frontier_df4_banim_a_res0[];
extern u32 frontier_df4_banim_a_res1[];
extern u32 frontier_df4_banim_a_res10[];
extern u32 frontier_df4_banim_a_res11[];
extern u32 frontier_df4_banim_a_res12[];
extern u32 frontier_df4_banim_a_res13[];
extern u32 frontier_df4_banim_a_res14[];
extern u32 frontier_df4_banim_a_res15[];
extern u32 frontier_df4_banim_a_res16[];
extern u32 frontier_df4_banim_a_res17[];
extern u32 frontier_df4_banim_a_res18[];
extern u32 frontier_df4_banim_a_res19[];
extern u32 frontier_df4_banim_a_res2[];
extern u32 frontier_df4_banim_a_res20[];
extern u32 frontier_df4_banim_a_res21[];
extern u32 frontier_df4_banim_a_res22[];
extern u32 frontier_df4_banim_a_res23[];
extern u32 frontier_df4_banim_a_res3[];
extern u32 frontier_df4_banim_a_res4[];
extern u32 frontier_df4_banim_a_res5[];
extern u32 frontier_df4_banim_a_res6[];
extern u32 frontier_df4_banim_a_res7[];
extern u32 frontier_df4_banim_a_res8[];
extern u32 frontier_df4_banim_a_res9[];
extern const u8 AnimScr_DarkBreath_Far[];
extern const u8 AnimScr_EfxAlacaliburOBJ_LeftBack[];
extern const u8 AnimScr_EfxMistyRainObj3[];
extern const u8 AnimSprite_EkrBaseKaiten_49[];
extern const u8 AnimSprite_EkrBaseKaiten_50[];
extern const u8 AnimSprite_EkrBaseKaiten_51[];
extern const u8 AnimSprite_EkrBaseKaiten_52[];
extern const u8 AnimSprite_EkrBaseKaiten_53[];
extern const u8 AnimSprite_EkrBaseKaiten_54[];
extern const u8 AnimSprite_EkrBaseKaiten_55[];
extern const u8 AnimSprite_EkrBaseKaiten_56[];
extern const u8 AnimSprite_EkrBaseKaiten_57[];
extern const u8 AnimSprite_EkrBaseKaiten_59[];
extern const u8 AnimSprite_EkrBaseKaiten_60[];
extern const u8 AnimSprite_EkrBaseKaiten_61[];
extern const u8 AnimSprite_EkrBaseKaiten_62[];
extern const u8 AnimSprite_EkrBaseKaiten_63[];
extern const u8 AnimSprite_EkrBaseKaiten_64[];
extern const u8 AnimSprite_EkrBaseKaiten_65[];
extern const u8 AnimSprite_EkrBaseKaiten_66[];
extern const u8 AnimSprite_EkrBaseKaiten_67[];
extern const u8 AnimSprite_EkrBaseKaiten_68[];
extern const u8 AnimSprite_EkrBaseKaiten_69[];
extern const u8 AnimSprite_EkrBaseKaiten_71[];
extern const u8 AnimSprite_EkrBaseKaiten_73[];
extern const u8 AnimSprite_EkrBaseKaiten_74[];
extern const u8 AnimSprite_EkrBaseKaiten_75[];
extern const u8 AnimSprite_EkrBaseKaiten_76[];
extern const u8 AnimSprite_EkrBaseKaiten_81[];
extern const u8 AnimSprite_EkrBaseKaiten_82[];
extern const u8 AnimSprite_EkrBaseKaiten_83[];
extern const u8 AnimSprite_EkrBaseKaiten_86[];
extern const u8 AnimSprite_EkrBaseKaiten_88[];
extern const u8 AnimSprite_EkrBaseKaiten_89[];
extern const u8 AnimSprite_EkrBaseKaiten_90[];
extern const u8 BanimLeftDefaultPos[];
extern const u8 DummvRST_OnEnd[];
extern const u8 EfxCircleWINMain[];
extern const u8 EfxDeadAlphaMain[];
extern const u8 EfxDeadPikaMain[];
extern const u8 EfxFlashHPBarDelay[];
extern const u8 EfxFlashHPBarMain1[];
extern const u8 EfxFlashHPBarRestorePal[];
extern const u8 EfxFlashUnitEffectMain[];
extern const u8 EfxFlashUnitEffectRestorePal[];
extern const u8 EfxFlashUnitMain[];
extern const u8 EfxFlashUnitRestorePal[];
extern const u8 EfxHPBarLiveMain[];
extern const u8 EfxHpBarResire_DeclineToDeath[];
extern const u8 EfxHpBarResire_SetAnotherSide[];
extern const u8 EfxHpBarResire_WaitOnCurrentSide[];
extern const u8 EfxHpBar_DeclineToDeath[];
extern const u8 EfxRestWINHMain[];
extern const u8 EfxRestWINH_Wait[];
extern const u8 EfxSRankWeaponEffectSCR2Main[];
extern const u8 EfxStatusCHGMain[];
extern const u8 EfxTeonoSeCallBack[];
extern const u8 EfxTeonoSeMain[];
extern const u8 EkrChienCHRMain[];
extern const u8 EkrUnitMainMiniMain[];
extern const u8 ExecAllAIS[];
extern const u8 FrameConf_efxLuceBGCOL[];
extern const u8 Frames_efxFirebreathBGCOL[];
extern const u8 Frames_efxLightningBG[];
extern const u8 Frames_efxLunaBG[];
extern const u8 Frames_efxShineBG[];
extern const u8 Frames_efxShineBG2[];
extern const u8 Frames_efxShineBGCOL[];
extern const u8 Frames_efxThunderstormBG[];
extern const u8 Img_AnimaHitBG_0[];
extern const u8 Img_AnimaHitBG_1[];
extern const u8 Img_AnimaHitBG_2[];
extern const u8 Img_AnimaHitBG_3[];
extern const u8 Img_AnimaHitBG_4[];
extern const u8 Img_AnimaHitBG_5[];
extern const u8 Img_AnimaHitBG_6[];
extern const u8 Img_AnimaHitBG_7[];
extern const u8 Img_AnimaHitBG_8[];
extern const u8 Img_AnimaHitBG_9[];
extern const u8 Img_AuraBg3_0[];
extern const u8 Img_AuraBg3_1[];
extern const u8 Img_AuraBg3_2[];
extern const u8 Img_AuraBg3_3[];
extern const u8 Img_AuraBg3_4[];
extern const u8 Img_AuraBg3_5[];
extern const u8 Img_AuraBg3_6[];
extern const u8 Img_Banim_0[];
extern const u8 Img_Banim_1[];
extern const u8 Img_Banim_10[];
extern const u8 Img_Banim_11[];
extern const u8 Img_Banim_14[];
extern const u8 Img_Banim_2[];
extern const u8 Img_Banim_3[];
extern const u8 Img_Banim_4[];
extern const u8 Img_Banim_5[];
extern const u8 Img_Banim_7[];
extern const u8 Img_Banim_8[];
extern const u8 Img_Banim_9[];
extern const u8 Img_BoltingBg_A[];
extern const u8 Img_BoltingBg_B[];
extern const u8 Img_BoltingBg_C[];
extern const u8 Img_ConstDataDB034_0[];
extern const u8 Img_ConstDataDB034_1[];
extern const u8 Img_ConstDataDB034_2[];
extern const u8 Img_ConstDataDB034_3[];
extern const u8 Img_ConstDataDB034_4[];
extern const u8 Img_DemonLightBg3_Close_0[];
extern const u8 Img_DemonLightBg3_Close_1[];
extern const u8 Img_DemonLightBg3_Close_2[];
extern const u8 Img_DemonLightBg3_Close_3[];
extern const u8 Img_DemonLightBg3_Close_4[];
extern const u8 Img_DemonLightBg3_Far_0[];
extern const u8 Img_DemonLightBg3_Far_1[];
extern const u8 Img_DemonLightBg3_Far_2[];
extern const u8 Img_DemonLightBg3_Far_3[];
extern const u8 Img_DemonLightBg3_Far_4[];
extern const u8 Img_DemonLightBg4_Close_0[];
extern const u8 Img_DemonLightBg4_Close_1[];
extern const u8 Img_DemonLightBg4_Close_2[];
extern const u8 Img_DemonLightBg4_Close_3[];
extern const u8 Img_DemonLightBg4_Close_4[];
extern const u8 Img_DemonLightBg4_Close_5[];
extern const u8 Img_DemonLightBg4_Close_6[];
extern const u8 Img_DemonLightBg4_Far_0[];
extern const u8 Img_DemonLightBg4_Far_1[];
extern const u8 Img_DemonLightBg4_Far_2[];
extern const u8 Img_DemonLightBg4_Far_3[];
extern const u8 Img_DemonLightBg4_Far_4[];
extern const u8 Img_DemonLightBg4_Far_5[];
extern const u8 Img_DemonLightBg4_Far_6[];
extern const u8 Img_DemonLightBg_0[];
extern const u8 Img_DemonLightBg_1[];
extern const u8 Img_DemonLightBg_2[];
extern const u8 Img_DemonLightBg_3[];
extern const u8 Img_DemonLightBg_4[];
extern const u8 Img_DemonLightBg_Close_1[];
extern const u8 Img_DemonLightBg_Close_10[];
extern const u8 Img_DemonLightBg_Close_11[];
extern const u8 Img_DemonLightBg_Close_12[];
extern const u8 Img_DemonLightBg_Close_13[];
extern const u8 Img_DemonLightBg_Close_14[];
extern const u8 Img_DemonLightBg_Close_15[];
extern const u8 Img_DemonLightBg_Close_16[];
extern const u8 Img_DemonLightBg_Close_17[];
extern const u8 Img_DemonLightBg_Close_18[];
extern const u8 Img_DemonLightBg_Close_19[];
extern const u8 Img_DemonLightBg_Close_2[];
extern const u8 Img_DemonLightBg_Close_20[];
extern const u8 Img_DemonLightBg_Close_21[];
extern const u8 Img_DemonLightBg_Close_22[];
extern const u8 Img_DemonLightBg_Close_23[];
extern const u8 Img_DemonLightBg_Close_24[];
extern const u8 Img_DemonLightBg_Close_25[];
extern const u8 Img_DemonLightBg_Close_26[];
extern const u8 Img_DemonLightBg_Close_27[];
extern const u8 Img_DemonLightBg_Close_28[];
extern const u8 Img_DemonLightBg_Close_29[];
extern const u8 Img_DemonLightBg_Close_3[];
extern const u8 Img_DemonLightBg_Close_30[];
extern const u8 Img_DemonLightBg_Close_31[];
extern const u8 Img_DemonLightBg_Close_32[];
extern const u8 Img_DemonLightBg_Close_4[];
extern const u8 Img_DemonLightBg_Close_5[];
extern const u8 Img_DemonLightBg_Close_6[];
extern const u8 Img_DemonLightBg_Close_7[];
extern const u8 Img_DemonLightBg_Close_8[];
extern const u8 Img_DemonLightBg_Close_9[];
extern const u8 Img_DemonLightBg_Far_1[];
extern const u8 Img_DemonLightBg_Far_10[];
extern const u8 Img_DemonLightBg_Far_11[];
extern const u8 Img_DemonLightBg_Far_12[];
extern const u8 Img_DemonLightBg_Far_13[];
extern const u8 Img_DemonLightBg_Far_14[];
extern const u8 Img_DemonLightBg_Far_15[];
extern const u8 Img_DemonLightBg_Far_16[];
extern const u8 Img_DemonLightBg_Far_17[];
extern const u8 Img_DemonLightBg_Far_18[];
extern const u8 Img_DemonLightBg_Far_19[];
extern const u8 Img_DemonLightBg_Far_2[];
extern const u8 Img_DemonLightBg_Far_20[];
extern const u8 Img_DemonLightBg_Far_21[];
extern const u8 Img_DemonLightBg_Far_22[];
extern const u8 Img_DemonLightBg_Far_23[];
extern const u8 Img_DemonLightBg_Far_24[];
extern const u8 Img_DemonLightBg_Far_25[];
extern const u8 Img_DemonLightBg_Far_26[];
extern const u8 Img_DemonLightBg_Far_27[];
extern const u8 Img_DemonLightBg_Far_28[];
extern const u8 Img_DemonLightBg_Far_29[];
extern const u8 Img_DemonLightBg_Far_3[];
extern const u8 Img_DemonLightBg_Far_30[];
extern const u8 Img_DemonLightBg_Far_31[];
extern const u8 Img_DemonLightBg_Far_32[];
extern const u8 Img_DemonLightBg_Far_4[];
extern const u8 Img_DemonLightBg_Far_5[];
extern const u8 Img_DemonLightBg_Far_6[];
extern const u8 Img_DemonLightBg_Far_7[];
extern const u8 Img_DemonLightBg_Far_8[];
extern const u8 Img_DemonLightBg_Far_9[];
extern const u8 Img_DivineBg[];
extern const u8 Img_DivineBg3_0[];
extern const u8 Img_DivineBg3_1[];
extern const u8 Img_DivineBg3_10[];
extern const u8 Img_DivineBg3_11[];
extern const u8 Img_DivineBg3_12[];
extern const u8 Img_DivineBg3_13[];
extern const u8 Img_DivineBg3_14[];
extern const u8 Img_DivineBg3_15[];
extern const u8 Img_DivineBg3_16[];
extern const u8 Img_DivineBg3_17[];
extern const u8 Img_DivineBg3_2[];
extern const u8 Img_DivineBg3_3[];
extern const u8 Img_DivineBg3_4[];
extern const u8 Img_DivineBg3_5[];
extern const u8 Img_DivineBg3_6[];
extern const u8 Img_DivineBg3_7[];
extern const u8 Img_DivineBg3_8[];
extern const u8 Img_DivineBg3_9[];
extern const u8 Img_EclipseBg_A[];
extern const u8 Img_EclipseBg_B[];
extern const u8 Img_EclipseBg_C[];
extern const u8 Img_EclipseBg_D[];
extern const u8 Img_EclipseBg_E[];
extern const u8 Img_EclipseBg_F[];
extern const u8 Img_EclipseBg_G[];
extern const u8 Img_EclipseBg_H[];
extern const u8 Img_EclipseBg_I[];
extern const u8 Img_EclipseBg_J[];
extern const u8 Img_EclipseBg_K[];
extern const u8 Img_EclipseBg_L[];
extern const u8 Img_EclipseBg_M[];
extern const u8 Img_EreshkigalBg3_0[];
extern const u8 Img_EreshkigalBg3_1[];
extern const u8 Img_EreshkigalBg3_2[];
extern const u8 Img_EreshkigalBg3_3[];
extern const u8 Img_EreshkigalBg3_5[];
extern const u8 Img_EreshkigalBg3_6[];
extern const u8 Img_EreshkigalBg3_7[];
extern const u8 Img_EreshkigalBg3_8[];
extern const u8 Img_FenrirBg_1[];
extern const u8 Img_FenrirBg_2[];
extern const u8 Img_FenrirBg_3[];
extern const u8 Img_FimbulvetrBg_A[];
extern const u8 Img_FimbulvetrBg_B[];
extern const u8 Img_FimbulvetrBg_C[];
extern const u8 Img_FimbulvetrBg_D[];
extern const u8 Img_FimbulvetrBg_Tornado_A[];
extern const u8 Img_FimbulvetrBg_Tornado_B[];
extern const u8 Img_FimbulvetrBg_Tornado_C[];
extern const u8 Img_FimbulvetrBg_Tornado_D[];
extern const u8 Img_FimbulvetrBg_Tornado_E[];
extern const u8 Img_FimbulvetrBg_Tornado_F[];
extern const u8 Img_Flux_ClassReel_0[];
extern const u8 Img_Flux_ClassReel_2[];
extern const u8 Img_Flux_ClassReel_3[];
extern const u8 Img_Flux_ClassReel_4[];
extern const u8 Img_IvaldiBg3_0[];
extern const u8 Img_IvaldiBg3_1[];
extern const u8 Img_IvaldiBg3_10[];
extern const u8 Img_IvaldiBg3_2[];
extern const u8 Img_IvaldiBg3_3[];
extern const u8 Img_IvaldiBg3_4[];
extern const u8 Img_IvaldiBg3_5[];
extern const u8 Img_IvaldiBg3_6[];
extern const u8 Img_IvaldiBg3_7[];
extern const u8 Img_IvaldiBg3_8[];
extern const u8 Img_IvaldiBg3_9[];
extern const u8 Img_Light_0[];
extern const u8 Img_Light_1[];
extern const u8 Img_Light_2[];
extern const u8 Img_NosferatuBg_B[];
extern const u8 Img_NosferatuBg_C[];
extern const u8 Img_NosferatuBg_D[];
extern const u8 Img_NosferatuBg_E[];
extern const u8 Img_NosferatuBg_F[];
extern const u8 Img_NosferatuBg_G[];
extern const u8 Img_NosferatuBg_H[];
extern const u8 Img_NosferatuBg_I[];
extern const u8 Img_NosferatuBg_J[];
extern const u8 Img_NosferatuBg_K[];
extern const u8 Img_NosferatuBg_L[];
extern const u8 Img_NosferatuBg_M[];
extern const u8 Img_PurgeBg_0[];
extern const u8 Img_PurgeBg_1[];
extern const u8 Img_PurgeBg_10[];
extern const u8 Img_PurgeBg_11[];
extern const u8 Img_PurgeBg_12[];
extern const u8 Img_PurgeBg_13[];
extern const u8 Img_PurgeBg_14[];
extern const u8 Img_PurgeBg_15[];
extern const u8 Img_PurgeBg_16[];
extern const u8 Img_PurgeBg_2[];
extern const u8 Img_PurgeBg_3[];
extern const u8 Img_PurgeBg_4[];
extern const u8 Img_PurgeBg_5[];
extern const u8 Img_PurgeBg_6[];
extern const u8 Img_PurgeBg_7[];
extern const u8 Img_PurgeBg_8[];
extern const u8 Img_PurgeBg_9[];
extern const u8 Img_ShineBg1[];
extern const u8 Img_SongBg_0[];
extern const u8 Img_SongBg_1[];
extern const u8 Img_SongBg_2[];
extern const u8 Img_SongBg_3[];
extern const u8 Img_Stone_0[];
extern const u8 Img_Stone_1[];
extern const u8 Img_Stone_10[];
extern const u8 Img_Stone_11[];
extern const u8 Img_Stone_12[];
extern const u8 Img_Stone_13[];
extern const u8 Img_Stone_14[];
extern const u8 Img_Stone_15[];
extern const u8 Img_Stone_16[];
extern const u8 Img_Stone_17[];
extern const u8 Img_Stone_2[];
extern const u8 Img_Stone_3[];
extern const u8 Img_Stone_4[];
extern const u8 Img_Stone_5[];
extern const u8 Img_Stone_6[];
extern const u8 Img_Stone_7[];
extern const u8 Img_Stone_8[];
extern const u8 Img_Stone_9[];
extern const u8 Loop6C_efxMagicQUAKE[];
extern const u8 Loop6C_efxThunder[];
extern const u8 Pal_ArenaBattleBg_A[];
extern const u8 Pal_ArenaBattleBg_B[];
extern const u8 Pal_ArenaBattleBg_C[];
extern const u8 Pal_Banim_0[];
extern const u8 Pal_Banim_3[];
extern const u8 Pal_DemonLightBg3_Close_0[];
extern const u8 Pal_DemonLightBg3_Close_1[];
extern const u8 Pal_DemonLightBg3_Close_2[];
extern const u8 Pal_DemonLightBg3_Close_3[];
extern const u8 Pal_DemonLightBg3_Close_4[];
extern const u8 Pal_DemonLightBg3_Far_0[];
extern const u8 Pal_DemonLightBg3_Far_1[];
extern const u8 Pal_DemonLightBg3_Far_2[];
extern const u8 Pal_DemonLightBg3_Far_3[];
extern const u8 Pal_DemonLightBg3_Far_4[];
extern const u8 Pal_DemonLightBg4_Close_0[];
extern const u8 Pal_DemonLightBg4_Close_1[];
extern const u8 Pal_DemonLightBg4_Close_2[];
extern const u8 Pal_DemonLightBg4_Close_3[];
extern const u8 Pal_DemonLightBg4_Close_4[];
extern const u8 Pal_DemonLightBg4_Close_5[];
extern const u8 Pal_DemonLightBg4_Close_6[];
extern const u8 Pal_DemonLightBg4_Close_7[];
extern const u8 Pal_DemonLightBg4_Far_0[];
extern const u8 Pal_DemonLightBg4_Far_1[];
extern const u8 Pal_DemonLightBg4_Far_2[];
extern const u8 Pal_DemonLightBg4_Far_3[];
extern const u8 Pal_DemonLightBg4_Far_4[];
extern const u8 Pal_DemonLightBg4_Far_5[];
extern const u8 Pal_DemonLightBg4_Far_6[];
extern const u8 Pal_DemonLightBg4_Far_7[];
extern const u8 Pal_DemonLightBg_0[];
extern const u8 Pal_DemonLightBg_1[];
extern const u8 Pal_DemonLightBg_Close_1[];
extern const u8 Pal_DemonLightBg_Close_10[];
extern const u8 Pal_DemonLightBg_Close_11[];
extern const u8 Pal_DemonLightBg_Close_12[];
extern const u8 Pal_DemonLightBg_Close_13[];
extern const u8 Pal_DemonLightBg_Close_14[];
extern const u8 Pal_DemonLightBg_Close_15[];
extern const u8 Pal_DemonLightBg_Close_16[];
extern const u8 Pal_DemonLightBg_Close_17[];
extern const u8 Pal_DemonLightBg_Close_18[];
extern const u8 Pal_DemonLightBg_Close_19[];
extern const u8 Pal_DemonLightBg_Close_2[];
extern const u8 Pal_DemonLightBg_Close_20[];
extern const u8 Pal_DemonLightBg_Close_21[];
extern const u8 Pal_DemonLightBg_Close_22[];
extern const u8 Pal_DemonLightBg_Close_23[];
extern const u8 Pal_DemonLightBg_Close_24[];
extern const u8 Pal_DemonLightBg_Close_25[];
extern const u8 Pal_DemonLightBg_Close_26[];
extern const u8 Pal_DemonLightBg_Close_27[];
extern const u8 Pal_DemonLightBg_Close_28[];
extern const u8 Pal_DemonLightBg_Close_29[];
extern const u8 Pal_DemonLightBg_Close_3[];
extern const u8 Pal_DemonLightBg_Close_30[];
extern const u8 Pal_DemonLightBg_Close_31[];
extern const u8 Pal_DemonLightBg_Close_32[];
extern const u8 Pal_DemonLightBg_Close_4[];
extern const u8 Pal_DemonLightBg_Close_5[];
extern const u8 Pal_DemonLightBg_Close_6[];
extern const u8 Pal_DemonLightBg_Close_7[];
extern const u8 Pal_DemonLightBg_Close_8[];
extern const u8 Pal_DemonLightBg_Close_9[];
extern const u8 Pal_DemonLightBg_Far_1[];
extern const u8 Pal_DemonLightBg_Far_10[];
extern const u8 Pal_DemonLightBg_Far_11[];
extern const u8 Pal_DemonLightBg_Far_12[];
extern const u8 Pal_DemonLightBg_Far_13[];
extern const u8 Pal_DemonLightBg_Far_14[];
extern const u8 Pal_DemonLightBg_Far_15[];
extern const u8 Pal_DemonLightBg_Far_16[];
extern const u8 Pal_DemonLightBg_Far_17[];
extern const u8 Pal_DemonLightBg_Far_18[];
extern const u8 Pal_DemonLightBg_Far_19[];
extern const u8 Pal_DemonLightBg_Far_2[];
extern const u8 Pal_DemonLightBg_Far_20[];
extern const u8 Pal_DemonLightBg_Far_21[];
extern const u8 Pal_DemonLightBg_Far_22[];
extern const u8 Pal_DemonLightBg_Far_23[];
extern const u8 Pal_DemonLightBg_Far_24[];
extern const u8 Pal_DemonLightBg_Far_25[];
extern const u8 Pal_DemonLightBg_Far_26[];
extern const u8 Pal_DemonLightBg_Far_27[];
extern const u8 Pal_DemonLightBg_Far_28[];
extern const u8 Pal_DemonLightBg_Far_29[];
extern const u8 Pal_DemonLightBg_Far_3[];
extern const u8 Pal_DemonLightBg_Far_30[];
extern const u8 Pal_DemonLightBg_Far_31[];
extern const u8 Pal_DemonLightBg_Far_32[];
extern const u8 Pal_DemonLightBg_Far_4[];
extern const u8 Pal_DemonLightBg_Far_5[];
extern const u8 Pal_DemonLightBg_Far_6[];
extern const u8 Pal_DemonLightBg_Far_7[];
extern const u8 Pal_DemonLightBg_Far_8[];
extern const u8 Pal_DemonLightBg_Far_9[];
extern const u8 Pal_Ekrdragonfx_2[];
extern const u8 Pal_HammerneBg[];
extern const u8 Pal_IvaldiBg3_0[];
extern const u8 Pal_IvaldiBg3_1[];
extern const u8 Pal_IvaldiBg3_10[];
extern const u8 Pal_IvaldiBg3_2[];
extern const u8 Pal_IvaldiBg3_3[];
extern const u8 Pal_IvaldiBg3_4[];
extern const u8 Pal_IvaldiBg3_5[];
extern const u8 Pal_IvaldiBg3_6[];
extern const u8 Pal_IvaldiBg3_7[];
extern const u8 Pal_IvaldiBg3_8[];
extern const u8 Pal_IvaldiBg3_9[];
extern const u8 Pal_Light[];
extern const u8 Pal_PurgeBg[];
extern const u8 Pal_efxExcaliburBG0[];
extern const u8 StartSpellAnimAircalibur[];
extern const u8 StartSpellAnimArrow[];
extern const u8 StartSpellAnimAura[];
extern const u8 StartSpellAnimBallista[];
extern const u8 StartSpellAnimBarrier[];
extern const u8 StartSpellAnimBerserk[];
extern const u8 StartSpellAnimBindingBlade[];
extern const u8 StartSpellAnimBolting[];
extern const u8 StartSpellAnimCrimsonEye[];
extern const u8 StartSpellAnimDance[];
extern const u8 StartSpellAnimDarkBreath[];
extern const u8 StartSpellAnimDemonLight[];
extern const u8 StartSpellAnimDemonSurge[];
extern const u8 StartSpellAnimDummy[];
extern const u8 StartSpellAnimEclipse[];
extern const u8 StartSpellAnimElfire[];
extern const u8 StartSpellAnimEvilEye[];
extern const u8 StartSpellAnimExcalibur[];
extern const u8 StartSpellAnimFenrir[];
extern const u8 StartSpellAnimFillasMight[];
extern const u8 StartSpellAnimFimbulvetr[];
extern const u8 StartSpellAnimFire[];
extern const u8 StartSpellAnimFireBreath[];
extern const u8 StartSpellAnimFlux[];
extern const u8 StartSpellAnimFortify[];
extern const u8 StartSpellAnimHammerne[];
extern const u8 StartSpellAnimHandAxe[];
extern const u8 StartSpellAnimHeal[];
extern const u8 StartSpellAnimIvaldi[];
extern const u8 StartSpellAnimJavelin[];
extern const u8 StartSpellAnimJavelinCavalier[];
extern const u8 StartSpellAnimJavelinFalcon[];
extern const u8 StartSpellAnimJavelinGenerial[];
extern const u8 StartSpellAnimJavelinPaladin[];
extern const u8 StartSpellAnimJavelinPaladinF[];
extern const u8 StartSpellAnimJavelinPegasusKnight[];
extern const u8 StartSpellAnimJavelinSoldier[];
extern const u8 StartSpellAnimJavelinUnk[];
extern const u8 StartSpellAnimJavelinWyvernLord[];
extern const u8 StartSpellAnimJavelinWyvernRider[];
extern const u8 StartSpellAnimLatona[];
extern const u8 StartSpellAnimLightning[];
extern const u8 StartSpellAnimLuna[];
extern const u8 StartSpellAnimMend[];
extern const u8 StartSpellAnimNaglfar[];
extern const u8 StartSpellAnimNinisGrace[];
extern const u8 StartSpellAnimNosferatu[];
extern const u8 StartSpellAnimPhysic[];
extern const u8 StartSpellAnimPurge[];
extern const u8 StartSpellAnimRecover[];
extern const u8 StartSpellAnimRestore[];
extern const u8 StartSpellAnimSetsLitany[];
extern const u8 StartSpellAnimShadowshot[];
extern const u8 StartSpellAnimShine[];
extern const u8 StartSpellAnimSilence[];
extern const u8 StartSpellAnimSleep[];
extern const u8 StartSpellAnimSong[];
extern const u8 StartSpellAnimStone[];
extern const u8 StartSpellAnimThorsIre[];
extern const u8 StartSpellAnimThunder[];
extern const u8 TsaConf_BanimTmA1[];
extern const u8 TsaConf_BanimTmA2[];
extern const u8 TsaConf_BanimTmA3[];
extern const u8 TsaConf_BanimTmA4[];
extern const u8 Tsa_AnimaHitBG_10[];
extern const u8 Tsa_AnimaHitBG_11[];
extern const u8 Tsa_AnimaHitBG_12[];
extern const u8 Tsa_AnimaHitBG_13[];
extern const u8 Tsa_AnimaHitBG_19[];
extern const u8 Tsa_AnimaHitBG_3[];
extern const u8 Tsa_AnimaHitBG_4[];
extern const u8 Tsa_AnimaHitBG_5[];
extern const u8 Tsa_AnimaHitBG_6[];
extern const u8 Tsa_AnimaHitBG_7[];
extern const u8 Tsa_AnimaHitBG_8[];
extern const u8 Tsa_AnimaHitBG_9[];
extern const u8 Tsa_AuraBg1_0[];
extern const u8 Tsa_AuraBg1_1[];
extern const u8 Tsa_AuraBg1_10[];
extern const u8 Tsa_AuraBg1_12[];
extern const u8 Tsa_AuraBg1_13[];
extern const u8 Tsa_AuraBg1_14[];
extern const u8 Tsa_AuraBg1_15[];
extern const u8 Tsa_AuraBg1_16[];
extern const u8 Tsa_AuraBg1_17[];
extern const u8 Tsa_AuraBg1_18[];
extern const u8 Tsa_AuraBg1_19[];
extern const u8 Tsa_AuraBg1_2[];
extern const u8 Tsa_AuraBg1_20[];
extern const u8 Tsa_AuraBg1_21[];
extern const u8 Tsa_AuraBg1_22[];
extern const u8 Tsa_AuraBg1_23[];
extern const u8 Tsa_AuraBg1_24[];
extern const u8 Tsa_AuraBg1_3[];
extern const u8 Tsa_AuraBg1_4[];
extern const u8 Tsa_AuraBg1_5[];
extern const u8 Tsa_AuraBg1_6[];
extern const u8 Tsa_AuraBg1_7[];
extern const u8 Tsa_AuraBg1_8[];
extern const u8 Tsa_AuraBg1_9[];
extern const u8 Tsa_Banim_13[];
extern const u8 Tsa_Banim_14[];
extern const u8 Tsa_BarrierBg_2[];
extern const u8 Tsa_BarrierBg_3[];
extern const u8 Tsa_BarrierBg_4[];
extern const u8 Tsa_BoltingBg_A[];
extern const u8 Tsa_BoltingBg_B[];
extern const u8 Tsa_BoltingBg_C[];
extern const u8 Tsa_BoltingBg_D[];
extern const u8 Tsa_BoltingBg_E[];
extern const u8 Tsa_BoltingBg_F[];
extern const u8 Tsa_BoltingBg_G[];
extern const u8 Tsa_BoltingBg_H[];
extern const u8 Tsa_BoltingBg_I[];
extern const u8 Tsa_BoltingBg_K[];
extern const u8 Tsa_DarkBreathBg_0[];
extern const u8 Tsa_DarkBreathBg_1[];
extern const u8 Tsa_DarkBreathBg_2[];
extern const u8 Tsa_DarkBreathBg_3[];
extern const u8 Tsa_DarkBreathBg_4[];
extern const u8 Tsa_DarkBreathBg_5[];
extern const u8 Tsa_DarkBreathBg_6[];
extern const u8 Tsa_DarkBreathBg_7[];
extern const u8 Tsa_DarkBreathBg_8[];
extern const u8 Tsa_DarkBreathBg_9[];
extern const u8 Tsa_DemonLightBg3_Close_0[];
extern const u8 Tsa_DemonLightBg3_Close_1[];
extern const u8 Tsa_DemonLightBg3_Close_2[];
extern const u8 Tsa_DemonLightBg3_Close_3[];
extern const u8 Tsa_DemonLightBg3_Close_4[];
extern const u8 Tsa_DemonLightBg3_Far_0[];
extern const u8 Tsa_DemonLightBg3_Far_1[];
extern const u8 Tsa_DemonLightBg3_Far_2[];
extern const u8 Tsa_DemonLightBg3_Far_3[];
extern const u8 Tsa_DemonLightBg3_Far_4[];
extern const u8 Tsa_DemonLightBg4_Close_0[];
extern const u8 Tsa_DemonLightBg4_Close_1[];
extern const u8 Tsa_DemonLightBg4_Close_2[];
extern const u8 Tsa_DemonLightBg4_Close_3[];
extern const u8 Tsa_DemonLightBg4_Close_4[];
extern const u8 Tsa_DemonLightBg4_Close_5[];
extern const u8 Tsa_DemonLightBg4_Close_6[];
extern const u8 Tsa_DemonLightBg4_Close_7[];
extern const u8 Tsa_DemonLightBg4_Far_0[];
extern const u8 Tsa_DemonLightBg4_Far_1[];
extern const u8 Tsa_DemonLightBg4_Far_2[];
extern const u8 Tsa_DemonLightBg4_Far_3[];
extern const u8 Tsa_DemonLightBg4_Far_4[];
extern const u8 Tsa_DemonLightBg4_Far_5[];
extern const u8 Tsa_DemonLightBg4_Far_6[];
extern const u8 Tsa_DemonLightBg4_Far_7[];
extern const u8 Tsa_DemonLightBg_0[];
extern const u8 Tsa_DemonLightBg_1[];
extern const u8 Tsa_DemonLightBg_2[];
extern const u8 Tsa_DemonLightBg_Close_1[];
extern const u8 Tsa_DemonLightBg_Close_10[];
extern const u8 Tsa_DemonLightBg_Close_11[];
extern const u8 Tsa_DemonLightBg_Close_12[];
extern const u8 Tsa_DemonLightBg_Close_13[];
extern const u8 Tsa_DemonLightBg_Close_14[];
extern const u8 Tsa_DemonLightBg_Close_15[];
extern const u8 Tsa_DemonLightBg_Close_16[];
extern const u8 Tsa_DemonLightBg_Close_17[];
extern const u8 Tsa_DemonLightBg_Close_18[];
extern const u8 Tsa_DemonLightBg_Close_19[];
extern const u8 Tsa_DemonLightBg_Close_2[];
extern const u8 Tsa_DemonLightBg_Close_20[];
extern const u8 Tsa_DemonLightBg_Close_21[];
extern const u8 Tsa_DemonLightBg_Close_22[];
extern const u8 Tsa_DemonLightBg_Close_23[];
extern const u8 Tsa_DemonLightBg_Close_24[];
extern const u8 Tsa_DemonLightBg_Close_25[];
extern const u8 Tsa_DemonLightBg_Close_26[];
extern const u8 Tsa_DemonLightBg_Close_27[];
extern const u8 Tsa_DemonLightBg_Close_28[];
extern const u8 Tsa_DemonLightBg_Close_29[];
extern const u8 Tsa_DemonLightBg_Close_3[];
extern const u8 Tsa_DemonLightBg_Close_30[];
extern const u8 Tsa_DemonLightBg_Close_31[];
extern const u8 Tsa_DemonLightBg_Close_32[];
extern const u8 Tsa_DemonLightBg_Close_4[];
extern const u8 Tsa_DemonLightBg_Close_5[];
extern const u8 Tsa_DemonLightBg_Close_6[];
extern const u8 Tsa_DemonLightBg_Close_7[];
extern const u8 Tsa_DemonLightBg_Close_8[];
extern const u8 Tsa_DemonLightBg_Close_9[];
extern const u8 Tsa_DemonLightBg_Far_1[];
extern const u8 Tsa_DemonLightBg_Far_10[];
extern const u8 Tsa_DemonLightBg_Far_11[];
extern const u8 Tsa_DemonLightBg_Far_12[];
extern const u8 Tsa_DemonLightBg_Far_13[];
extern const u8 Tsa_DemonLightBg_Far_14[];
extern const u8 Tsa_DemonLightBg_Far_15[];
extern const u8 Tsa_DemonLightBg_Far_16[];
extern const u8 Tsa_DemonLightBg_Far_17[];
extern const u8 Tsa_DemonLightBg_Far_18[];
extern const u8 Tsa_DemonLightBg_Far_19[];
extern const u8 Tsa_DemonLightBg_Far_2[];
extern const u8 Tsa_DemonLightBg_Far_20[];
extern const u8 Tsa_DemonLightBg_Far_21[];
extern const u8 Tsa_DemonLightBg_Far_22[];
extern const u8 Tsa_DemonLightBg_Far_23[];
extern const u8 Tsa_DemonLightBg_Far_24[];
extern const u8 Tsa_DemonLightBg_Far_25[];
extern const u8 Tsa_DemonLightBg_Far_26[];
extern const u8 Tsa_DemonLightBg_Far_27[];
extern const u8 Tsa_DemonLightBg_Far_28[];
extern const u8 Tsa_DemonLightBg_Far_29[];
extern const u8 Tsa_DemonLightBg_Far_3[];
extern const u8 Tsa_DemonLightBg_Far_30[];
extern const u8 Tsa_DemonLightBg_Far_31[];
extern const u8 Tsa_DemonLightBg_Far_32[];
extern const u8 Tsa_DemonLightBg_Far_4[];
extern const u8 Tsa_DemonLightBg_Far_5[];
extern const u8 Tsa_DemonLightBg_Far_6[];
extern const u8 Tsa_DemonLightBg_Far_7[];
extern const u8 Tsa_DemonLightBg_Far_8[];
extern const u8 Tsa_DemonLightBg_Far_9[];
extern const u8 Tsa_DivineBg2_0[];
extern const u8 Tsa_DivineBg2_1[];
extern const u8 Tsa_DivineBg2_2[];
extern const u8 Tsa_DivineBg3_0[];
extern const u8 Tsa_DivineBg3_1[];
extern const u8 Tsa_DivineBg3_10[];
extern const u8 Tsa_DivineBg3_11[];
extern const u8 Tsa_DivineBg3_12[];
extern const u8 Tsa_DivineBg3_13[];
extern const u8 Tsa_DivineBg3_14[];
extern const u8 Tsa_DivineBg3_15[];
extern const u8 Tsa_DivineBg3_16[];
extern const u8 Tsa_DivineBg3_17[];
extern const u8 Tsa_DivineBg3_18[];
extern const u8 Tsa_DivineBg3_19[];
extern const u8 Tsa_DivineBg3_2[];
extern const u8 Tsa_DivineBg3_3[];
extern const u8 Tsa_DivineBg3_4[];
extern const u8 Tsa_DivineBg3_5[];
extern const u8 Tsa_DivineBg3_6[];
extern const u8 Tsa_DivineBg3_7[];
extern const u8 Tsa_DivineBg3_8[];
extern const u8 Tsa_DivineBg3_9[];
extern const u8 Tsa_DivineBg_0[];
extern const u8 Tsa_DivineBg_12[];
extern const u8 Tsa_DivineBg_13[];
extern const u8 Tsa_DivineBg_14[];
extern const u8 Tsa_DivineBg_15[];
extern const u8 Tsa_DivineBg_19[];
extern const u8 Tsa_DivineBg_20[];
extern const u8 Tsa_EclipseBg_A[];
extern const u8 Tsa_EclipseBg_AA[];
extern const u8 Tsa_EclipseBg_D[];
extern const u8 Tsa_EclipseBg_E[];
extern const u8 Tsa_EclipseBg_F[];
extern const u8 Tsa_EclipseBg_G[];
extern const u8 Tsa_EclipseBg_H[];
extern const u8 Tsa_EclipseBg_I[];
extern const u8 Tsa_EclipseBg_J[];
extern const u8 Tsa_EclipseBg_K[];
extern const u8 Tsa_EclipseBg_L[];
extern const u8 Tsa_EclipseBg_M[];
extern const u8 Tsa_EclipseBg_N[];
extern const u8 Tsa_EclipseBg_O[];
extern const u8 Tsa_EclipseBg_P[];
extern const u8 Tsa_EclipseBg_Q[];
extern const u8 Tsa_EclipseBg_R[];
extern const u8 Tsa_EclipseBg_S[];
extern const u8 Tsa_EclipseBg_T[];
extern const u8 Tsa_EclipseBg_U[];
extern const u8 Tsa_EclipseBg_V[];
extern const u8 Tsa_EclipseBg_W[];
extern const u8 Tsa_EclipseBg_X[];
extern const u8 Tsa_EclipseBg_Y[];
extern const u8 Tsa_EclipseBg_Z[];
extern const u8 Tsa_EfxThuderBg1[];
extern const u8 Tsa_EfxThuderBg2[];
extern const u8 Tsa_EreshkigalBg3_0[];
extern const u8 Tsa_EreshkigalBg3_1[];
extern const u8 Tsa_EreshkigalBg3_3[];
extern const u8 Tsa_FenrirBg_0[];
extern const u8 Tsa_FenrirBg_1[];
extern const u8 Tsa_FenrirBg_2[];
extern const u8 Tsa_FenrirBg_3[];
extern const u8 Tsa_FenrirBg_4[];
extern const u8 Tsa_FenrirBg_41[];
extern const u8 Tsa_FenrirBg_42[];
extern const u8 Tsa_FenrirBg_43[];
extern const u8 Tsa_FenrirBg_47[];
extern const u8 Tsa_FenrirBg_48[];
extern const u8 Tsa_FenrirBg_49[];
extern const u8 Tsa_FenrirBg_5[];
extern const u8 Tsa_FenrirBg_6[];
extern const u8 Tsa_FenrirBg_7[];
extern const u8 Tsa_FimbulvetrBg_D[];
extern const u8 Tsa_FimbulvetrBg_E[];
extern const u8 Tsa_FimbulvetrBg_F[];
extern const u8 Tsa_FimbulvetrBg_G[];
extern const u8 Tsa_FimbulvetrBg_H[];
extern const u8 Tsa_FimbulvetrBg_I[];
extern const u8 Tsa_FimbulvetrBg_Tornado_A[];
extern const u8 Tsa_FimbulvetrBg_Tornado_B[];
extern const u8 Tsa_FimbulvetrBg_Tornado_C[];
extern const u8 Tsa_FimbulvetrBg_Tornado_D[];
extern const u8 Tsa_FimbulvetrBg_Tornado_E[];
extern const u8 Tsa_FimbulvetrBg_Tornado_F[];
extern const u8 Tsa_Flux_ClassReel_0[];
extern const u8 Tsa_Flux_ClassReel_1[];
extern const u8 Tsa_Flux_ClassReel_10[];
extern const u8 Tsa_Flux_ClassReel_11[];
extern const u8 Tsa_Flux_ClassReel_17[];
extern const u8 Tsa_Flux_ClassReel_18[];
extern const u8 Tsa_Flux_ClassReel_19[];
extern const u8 Tsa_Flux_ClassReel_2[];
extern const u8 Tsa_Flux_ClassReel_20[];
extern const u8 Tsa_Flux_ClassReel_21[];
extern const u8 Tsa_Flux_ClassReel_22[];
extern const u8 Tsa_Flux_ClassReel_23[];
extern const u8 Tsa_Flux_ClassReel_24[];
extern const u8 Tsa_Flux_ClassReel_25[];
extern const u8 Tsa_Flux_ClassReel_26[];
extern const u8 Tsa_Flux_ClassReel_27[];
extern const u8 Tsa_Flux_ClassReel_3[];
extern const u8 Tsa_Flux_ClassReel_4[];
extern const u8 Tsa_Flux_ClassReel_5[];
extern const u8 Tsa_Flux_ClassReel_6[];
extern const u8 Tsa_Flux_ClassReel_7[];
extern const u8 Tsa_Flux_ClassReel_8[];
extern const u8 Tsa_Flux_ClassReel_9[];
extern const u8 Tsa_FortifyBg2[];
extern const u8 Tsa_Fortify_0[];
extern const u8 Tsa_Fortify_1[];
extern const u8 Tsa_Fortify_2[];
extern const u8 Tsa_HammerneBg_10[];
extern const u8 Tsa_HammerneBg_11[];
extern const u8 Tsa_HammerneBg_12[];
extern const u8 Tsa_HammerneBg_6[];
extern const u8 Tsa_HammerneBg_7[];
extern const u8 Tsa_HammerneBg_8[];
extern const u8 Tsa_HammerneBg_9[];
extern const u8 Tsa_IvaldiBg1_0[];
extern const u8 Tsa_IvaldiBg1_1[];
extern const u8 Tsa_IvaldiBg1_10[];
extern const u8 Tsa_IvaldiBg1_11[];
extern const u8 Tsa_IvaldiBg1_2[];
extern const u8 Tsa_IvaldiBg1_3[];
extern const u8 Tsa_IvaldiBg1_4[];
extern const u8 Tsa_IvaldiBg1_5[];
extern const u8 Tsa_IvaldiBg1_6[];
extern const u8 Tsa_IvaldiBg1_7[];
extern const u8 Tsa_IvaldiBg1_8[];
extern const u8 Tsa_IvaldiBg1_9[];
extern const u8 Tsa_IvaldiBg2_0[];
extern const u8 Tsa_IvaldiBg2_1[];
extern const u8 Tsa_IvaldiBg2_2[];
extern const u8 Tsa_IvaldiBg2_3[];
extern const u8 Tsa_IvaldiBg2_4[];
extern const u8 Tsa_IvaldiBg3_0[];
extern const u8 Tsa_IvaldiBg3_1[];
extern const u8 Tsa_IvaldiBg3_10[];
extern const u8 Tsa_IvaldiBg3_2[];
extern const u8 Tsa_IvaldiBg3_3[];
extern const u8 Tsa_IvaldiBg3_4[];
extern const u8 Tsa_IvaldiBg3_5[];
extern const u8 Tsa_IvaldiBg3_6[];
extern const u8 Tsa_IvaldiBg3_7[];
extern const u8 Tsa_IvaldiBg3_8[];
extern const u8 Tsa_IvaldiBg3_9[];
extern const u8 Tsa_IvaldiBg4[];
extern const u8 Tsa_Light_0[];
extern const u8 Tsa_Light_1[];
extern const u8 Tsa_Light_10[];
extern const u8 Tsa_Light_11[];
extern const u8 Tsa_Light_12[];
extern const u8 Tsa_Light_13[];
extern const u8 Tsa_Light_14[];
extern const u8 Tsa_Light_25[];
extern const u8 Tsa_Light_26[];
extern const u8 Tsa_Light_27[];
extern const u8 Tsa_Light_28[];
extern const u8 Tsa_Light_29[];
extern const u8 Tsa_Light_30[];
extern const u8 Tsa_Light_31[];
extern const u8 Tsa_Light_32[];
extern const u8 Tsa_Light_4[];
extern const u8 Tsa_Light_5[];
extern const u8 Tsa_Light_6[];
extern const u8 Tsa_Light_7[];
extern const u8 Tsa_Light_8[];
extern const u8 Tsa_Light_9[];
extern const u8 Tsa_LunaBg1_A[];
extern const u8 Tsa_NosferatuBg_0[];
extern const u8 Tsa_NosferatuBg_10[];
extern const u8 Tsa_NosferatuBg_11[];
extern const u8 Tsa_NosferatuBg_12[];
extern const u8 Tsa_NosferatuBg_13[];
extern const u8 Tsa_NosferatuBg_14[];
extern const u8 Tsa_NosferatuBg_15[];
extern const u8 Tsa_NosferatuBg_16[];
extern const u8 Tsa_NosferatuBg_17[];
extern const u8 Tsa_NosferatuBg_18[];
extern const u8 Tsa_NosferatuBg_19[];
extern const u8 Tsa_NosferatuBg_20[];
extern const u8 Tsa_NosferatuBg_21[];
extern const u8 Tsa_NosferatuBg_22[];
extern const u8 Tsa_NosferatuBg_23[];
extern const u8 Tsa_NosferatuBg_24[];
extern const u8 Tsa_NosferatuBg_25[];
extern const u8 Tsa_NosferatuBg_26[];
extern const u8 Tsa_NosferatuBg_27[];
extern const u8 Tsa_NosferatuBg_28[];
extern const u8 Tsa_NosferatuBg_29[];
extern const u8 Tsa_NosferatuBg_30[];
extern const u8 Tsa_NosferatuBg_31[];
extern const u8 Tsa_NosferatuBg_32[];
extern const u8 Tsa_NosferatuBg_33[];
extern const u8 Tsa_NosferatuBg_34[];
extern const u8 Tsa_NosferatuBg_35[];
extern const u8 Tsa_NosferatuBg_36[];
extern const u8 Tsa_NosferatuBg_37[];
extern const u8 Tsa_NosferatuBg_38[];
extern const u8 Tsa_NosferatuBg_39[];
extern const u8 Tsa_NosferatuBg_40[];
extern const u8 Tsa_NosferatuBg_41[];
extern const u8 Tsa_NosferatuBg_42[];
extern const u8 Tsa_NosferatuBg_43[];
extern const u8 Tsa_NosferatuBg_44[];
extern const u8 Tsa_NosferatuBg_45[];
extern const u8 Tsa_NosferatuBg_46[];
extern const u8 Tsa_NosferatuBg_8[];
extern const u8 Tsa_NosferatuBg_9[];
extern const u8 Tsa_PurgeBg_0[];
extern const u8 Tsa_PurgeBg_1[];
extern const u8 Tsa_PurgeBg_10[];
extern const u8 Tsa_PurgeBg_11[];
extern const u8 Tsa_PurgeBg_12[];
extern const u8 Tsa_PurgeBg_13[];
extern const u8 Tsa_PurgeBg_14[];
extern const u8 Tsa_PurgeBg_15[];
extern const u8 Tsa_PurgeBg_16[];
extern const u8 Tsa_PurgeBg_17[];
extern const u8 Tsa_PurgeBg_18[];
extern const u8 Tsa_PurgeBg_19[];
extern const u8 Tsa_PurgeBg_2[];
extern const u8 Tsa_PurgeBg_20[];
extern const u8 Tsa_PurgeBg_21[];
extern const u8 Tsa_PurgeBg_22[];
extern const u8 Tsa_PurgeBg_23[];
extern const u8 Tsa_PurgeBg_24[];
extern const u8 Tsa_PurgeBg_25[];
extern const u8 Tsa_PurgeBg_26[];
extern const u8 Tsa_PurgeBg_27[];
extern const u8 Tsa_PurgeBg_28[];
extern const u8 Tsa_PurgeBg_29[];
extern const u8 Tsa_PurgeBg_3[];
extern const u8 Tsa_PurgeBg_30[];
extern const u8 Tsa_PurgeBg_31[];
extern const u8 Tsa_PurgeBg_4[];
extern const u8 Tsa_PurgeBg_48[];
extern const u8 Tsa_PurgeBg_49[];
extern const u8 Tsa_PurgeBg_5[];
extern const u8 Tsa_PurgeBg_50[];
extern const u8 Tsa_PurgeBg_51[];
extern const u8 Tsa_PurgeBg_52[];
extern const u8 Tsa_PurgeBg_53[];
extern const u8 Tsa_PurgeBg_54[];
extern const u8 Tsa_PurgeBg_55[];
extern const u8 Tsa_PurgeBg_56[];
extern const u8 Tsa_PurgeBg_57[];
extern const u8 Tsa_PurgeBg_58[];
extern const u8 Tsa_PurgeBg_59[];
extern const u8 Tsa_PurgeBg_6[];
extern const u8 Tsa_PurgeBg_60[];
extern const u8 Tsa_PurgeBg_61[];
extern const u8 Tsa_PurgeBg_62[];
extern const u8 Tsa_PurgeBg_63[];
extern const u8 Tsa_PurgeBg_64[];
extern const u8 Tsa_PurgeBg_65[];
extern const u8 Tsa_PurgeBg_66[];
extern const u8 Tsa_PurgeBg_67[];
extern const u8 Tsa_PurgeBg_68[];
extern const u8 Tsa_PurgeBg_69[];
extern const u8 Tsa_PurgeBg_7[];
extern const u8 Tsa_PurgeBg_70[];
extern const u8 Tsa_PurgeBg_71[];
extern const u8 Tsa_PurgeBg_72[];
extern const u8 Tsa_PurgeBg_8[];
extern const u8 Tsa_PurgeBg_9[];
extern const u8 Tsa_RestoreBg_10[];
extern const u8 Tsa_RestoreBg_11[];
extern const u8 Tsa_RestoreBg_5[];
extern const u8 Tsa_RestoreBg_6[];
extern const u8 Tsa_RestoreBg_7[];
extern const u8 Tsa_RestoreBg_8[];
extern const u8 Tsa_RestoreBg_9[];
extern const u8 Tsa_ShineBg1_Left[];
extern const u8 Tsa_ShineBg1_Right[];
extern const u8 Tsa_SilenceBg_16[];
extern const u8 Tsa_SilenceBg_17[];
extern const u8 Tsa_SilenceBg_2[];
extern const u8 Tsa_SleepBg_0[];
extern const u8 Tsa_SleepBg_1[];
extern const u8 Tsa_SleepBg_10[];
extern const u8 Tsa_SleepBg_11[];
extern const u8 Tsa_SleepBg_12[];
extern const u8 Tsa_SleepBg_13[];
extern const u8 Tsa_SleepBg_14[];
extern const u8 Tsa_SleepBg_15[];
extern const u8 Tsa_SleepBg_2[];
extern const u8 Tsa_SleepBg_3[];
extern const u8 Tsa_SleepBg_4[];
extern const u8 Tsa_SleepBg_5[];
extern const u8 Tsa_SleepBg_6[];
extern const u8 Tsa_SleepBg_7[];
extern const u8 Tsa_SleepBg_8[];
extern const u8 Tsa_SleepBg_9[];
extern const u8 Tsa_Song[];
extern const u8 Tsa_SongBg_0[];
extern const u8 Tsa_SongBg_1[];
extern const u8 Tsa_SongBg_10[];
extern const u8 Tsa_SongBg_11[];
extern const u8 Tsa_SongBg_12[];
extern const u8 Tsa_SongBg_13[];
extern const u8 Tsa_SongBg_14[];
extern const u8 Tsa_SongBg_15[];
extern const u8 Tsa_SongBg_16[];
extern const u8 Tsa_SongBg_17[];
extern const u8 Tsa_SongBg_18[];
extern const u8 Tsa_SongBg_19[];
extern const u8 Tsa_SongBg_2[];
extern const u8 Tsa_SongBg_20[];
extern const u8 Tsa_SongBg_21[];
extern const u8 Tsa_SongBg_22[];
extern const u8 Tsa_SongBg_23[];
extern const u8 Tsa_SongBg_24[];
extern const u8 Tsa_SongBg_25[];
extern const u8 Tsa_SongBg_3[];
extern const u8 Tsa_SongBg_4[];
extern const u8 Tsa_SongBg_5[];
extern const u8 Tsa_SongBg_6[];
extern const u8 Tsa_SongBg_7[];
extern const u8 Tsa_SongBg_8[];
extern const u8 Tsa_SongBg_9[];
extern const u8 Tsa_Stone_0[];
extern const u8 Tsa_Stone_1[];
extern const u8 Tsa_Stone_10[];
extern const u8 Tsa_Stone_11[];
extern const u8 Tsa_Stone_12[];
extern const u8 Tsa_Stone_13[];
extern const u8 Tsa_Stone_14[];
extern const u8 Tsa_Stone_15[];
extern const u8 Tsa_Stone_16[];
extern const u8 Tsa_Stone_17[];
extern const u8 Tsa_Stone_18[];
extern const u8 Tsa_Stone_2[];
extern const u8 Tsa_Stone_3[];
extern const u8 Tsa_Stone_4[];
extern const u8 Tsa_Stone_5[];
extern const u8 Tsa_Stone_6[];
extern const u8 Tsa_Stone_7[];
extern const u8 Tsa_Stone_8[];
extern const u8 Tsa_Stone_9[];
extern const u8 BanimEkrTogiProcNames[];
extern const u8 AnimScr_EkrBaseKaiten1[];
extern const u8 AnimScr_EkrBaseKaiten2[];
extern const u8 AnimScr_EkrBaseKaiten3[];
extern const u8 AnimScr_EkrBaseKaiten4[];
extern const u8 AnimScr_EkrBaseKaiten5[];
extern const u8 AnimScr_EkrBaseKaiten6[];
extern const u8 AnimScr_EkrBaseKaiten7[];
extern const u8 AnimScr_EkrBaseKaiten8[];
extern const u8 AnimScr_EkrBaseKaiten9[];
extern const u8 AnimScr_EkrBaseKaiten10[];
extern const u8 AnimScr_EkrBaseKaiten11[];
extern const u8 AnimScr_EkrBaseKaiten12[];
extern const u8 AnimSprite_EkrBaseKaiten_48[];
extern const u8 AnimSprite_EkrBaseKaiten_58[];
extern const u8 AnimSprite_EkrBaseKaiten_70[];
extern const u8 AnimSprite_EkrBaseKaiten_72[];
extern const u8 AnimSprite_EkrBaseKaiten_84[];
extern const u8 AnimSprite_EkrBaseKaiten_85[];
extern const u8 AnimSprite_EkrBaseKaiten_87[];
extern const u8 Tsa_DarkBreathBg_10[];
extern const u8 Tsa_DarkBreathBg_11[];
extern const u8 Lz77Tsa_BoltingBg_08636008[];
extern const u8 Tsa_DivineBg_16[];
extern const u8 Tsa_DivineBg_17[];
extern const u8 Tsa_DivineBg_18[];
extern const u8 Tsa_EclipseBg_B[];
extern const u8 Tsa_EclipseBg_C[];
extern const u8 Tsa_SilenceBg_0[];
extern const u8 Tsa_SilenceBg_1[];
extern const u8 Tsa_BarrierBg_0[];
extern const u8 Tsa_BarrierBg_1[];
extern const u8 data_087548F0[];
extern const u8 data_087549F8[];
extern const u8 data_08754B34[];
extern const u8 data_08754CA8[];
extern const u8 data_08754E40[];
extern const u8 data_08754FB4[];
extern const u8 data_087550C0[];
extern const u8 data_08755194[];
extern const u8 data_0875F138[];
extern const u8 Tsa_AuraBg1_11[];
extern const u8 data_0879FF00[];
extern const u8 data_087A0174[];
extern const u8 data_087A03A0[];
extern const u8 data_087A05E4[];
extern const u8 data_087A083C[];
extern const u8 data_087A0EF4[];
extern const u8 data_087A1C24[];
extern const u8 efxBerserkBG_Loop[];
extern const u8 efxBerserkCLONE_Loop[];
extern const u8 efxBerserkOBJ_Loop_A[];
extern const u8 efxBerserkOBJ_Loop_B[];
extern const u8 efxBerserkOBJ_Loop_C[];
extern const u8 efxBerserkOBJ_Loop_D[];
extern const u8 efxBerserkOBJ_Loop_E[];
extern const u8 efxBerserkOBJ_Loop_F[];
extern const u8 efxBerserkOBJ_Loop_G[];
extern const u8 efxBerserkOBJ_Loop_H[];
extern const u8 efxBerserkOBJ_Loop_I[];
extern const u8 efxBerserkOBJ_Loop_J[];
extern const u8 efxBerserkOBJ_OnEnd[];
extern const u8 efxBerserk_Loop_Main[];
extern const u8 efxDance_Loop_Main[];
extern const u8 efxDarkbreathBGCOL_Loop[];
extern const u8 efxDarkbreathBG_Loop[];
extern const u8 efxDarkbreath_Loop_Main[];
extern const u8 efxDeadEvent_Loop_A[];
extern const u8 efxDeadEvent_Loop_B[];
extern const u8 efxDeadEvent_Loop_C[];
extern const u8 efxDeadEvent_Loop_D[];
extern const u8 efxDeadEvent_Loop_E[];
extern const u8 efxDead_Loop_A[];
extern const u8 efxDead_Loop_B[];
extern const u8 efxDivineBG_Loop[];
extern const u8 efxDivineOBJ_Loop[];
extern const u8 efxDivine_Loop_Main[];
extern const u8 efxEreshkigal_Loop_Main[];
extern const u8 efxExcaliburBG0_Loop[];
extern const u8 efxExcaliburBG2_OnEnd[];
extern const u8 efxExcaliburBG3_OnEnd[];
extern const u8 efxExcaliburBGCOL2_Loop[];
extern const u8 efxExcaliburBGCOL_OnEnd[];
extern const u8 efxExcaliburOBJ_Loop[];
extern const u8 efxFarAttack_Init[];
extern const u8 efxFarAttack_ScrollIn[];
extern const u8 efxFarAttack_ScrollOut[];
extern const u8 efxFenrirBG2_Loop[];
extern const u8 efxFenrirBGCOL_OnEnd[];
extern const u8 efxFenrirBG_Loop[];
extern const u8 efxFenrirBG_OnEnd[];
extern const u8 efxFenrirOBJ2Chiri_Loop[];
extern const u8 efxFenrirOBJ2_Loop[];
extern const u8 efxFenrirOBJ_Loop[];
extern const u8 efxFimbulvetrBGTR_Loop[];
extern const u8 efxFimbulvetrBG_Loop[];
extern const u8 efxFimbulvetrOBJ2Fall_Loop[];
extern const u8 efxFimbulvetrOBJ2_Loop[];
extern const u8 efxFimbulvetrOBJ_Loop[];
extern const u8 efxFimbulvetr_Loop_Main[];
extern const u8 efxFirebreathBGCOL_Loop[];
extern const u8 efxFirebreathBG_Loop[];
extern const u8 efxFirebreathOBJ_Loop[];
extern const u8 efxGespenstBG4_Loop[];
extern const u8 efxGespenstBG4_OnEnd[];
extern const u8 efxGespenstBGCOL2_Loop[];
extern const u8 efxGespenstBG_Loop[];
extern const u8 efxGorgonOBJ_OnEnd[];
extern const u8 efxHammarneOBJ_OnEnd[];
extern const u8 efxHazymoonBG_Loop[];
extern const u8 efxHazymoonOBJ2_Loop_A[];
extern const u8 efxHazymoonOBJ2_Loop_B[];
extern const u8 efxHazymoonOBJ2_Loop_C[];
extern const u8 efxHazymoonOBJ2_OnEnd[];
extern const u8 efxHazymoonOBJ3_Loop[];
extern const u8 efxHurtmut_Loop_Main[];
extern const u8 efxIcebreathOBJ_OnEnd[];
extern const u8 efxIcebreath_Loop_Main[];
extern const u8 efxIvaldiBG2_Loop[];
extern const u8 efxIvaldiBG3_Loop[];
extern const u8 efxIvaldiBG4_Loop[];
extern const u8 efxIvaldiOBJ1_Loop[];
extern const u8 efxIvaldiOBJ2_Loop[];
extern const u8 efxIvaldiOBJFall_Loop[];
extern const u8 efxIvaldiOBJSideWash_Loop[];
extern const u8 efxIvaldiOBJUprise_Loop[];
extern const u8 efxIvaldiWOUT_Loop[];
extern const u8 efxIvaldi_Loop_Main[];
extern const u8 efxLightningBG_Loop[];
extern const u8 efxLiveALPHA_Loop_A[];
extern const u8 efxLiveALPHA_Loop_B[];
extern const u8 efxLiveBGCOL_Loop[];
extern const u8 efxLiveBG_Loop[];
extern const u8 efxLiveOBJ_Loop[];
extern const u8 efxLunaBGCOL_Loop[];
extern const u8 efxLunaBG_Loop[];
extern const u8 efxLunaSCR_Loop[];
extern const u8 efxLuna_Loop_Main[];
extern const u8 efxMaohFlashBG2_Loop[];
extern const u8 efxMaohFlashBG3_Loop[];
extern const u8 efxMaohFlashBGCOL_Loop[];
extern const u8 efxMaohFlashEyeFire1OBJ1_Loop[];
extern const u8 efxMaohFlashEyeFire2OBJ1_Loop[];
extern const u8 efxMaohFlashEyeLOBJ2_Loop[];
extern const u8 efxMaohFlashEyeOBJ1_Loop[];
extern const u8 efxMaohFlashEyeROBJ2_Loop[];
extern const u8 efxMaohFlashThunderOBJ2_Loop[];
extern const u8 efxMaohFlashWOUT_Loop_A[];
extern const u8 efxMaohFlashWOUT_Loop_B[];
extern const u8 efxMaohFlash_Loop_Main[];
extern const u8 efxMshieldBGOBJ_OnEnd[];
extern const u8 efxMshieldBG_Loop[];
extern const u8 efxMshield_Loop_Main[];
extern const u8 efxOuraBG2_Loop[];
extern const u8 efxOuraBG2_OnEnd[];
extern const u8 efxOuraBG3_Loop[];
extern const u8 efxOuraBGCOL_Loop[];
extern const u8 efxOuraBG_Loop[];
extern const u8 efxPurgeBG_Loop[];
extern const u8 efxPurgeOBJRND_Loop[];
extern const u8 efxPurge_Loop_Main[];
extern const u8 efxReblowOBJ_Loop_A[];
extern const u8 efxReblowOBJ_Loop_B[];
extern const u8 efxReblow_Loop_Main[];
extern const u8 efxRecover_Loop_Main[];
extern const u8 efxRelive_Loop_Main[];
extern const u8 efxReserveBG2_Loop[];
extern const u8 efxReserveBGCOL2_Loop[];
extern const u8 efxReserveBGCOL_Loop[];
extern const u8 efxReserveBG_Loop[];
extern const u8 efxReserveOBJ_Loop_A[];
extern const u8 efxReserveOBJ_Loop_B[];
extern const u8 efxReserve_Loop_Main[];
extern const u8 efxResireBG2_Loop[];
extern const u8 efxResireBG_Loop_A[];
extern const u8 efxResireBG_Loop_B[];
extern const u8 efxResireBG_Loop_C[];
extern const u8 efxResireBG_Loop_D[];
extern const u8 efxResireRST_Loop[];
extern const u8 efxRestBG_Loop[];
extern const u8 efxRestOBJ_Loop[];
extern const u8 efxRest_Loop_Main[];
extern const u8 efxShineBG2_Loop[];
extern const u8 efxShineBG_Loop[];
extern const u8 efxShineOBJRND_Loop[];
extern const u8 efxShineOBJ_Loop[];
extern const u8 efxShine_Loop_Main[];
extern const u8 efxShooterOBJ_Loop[];
extern const u8 efxSilenceBG_Loop[];
extern const u8 efxSilenceOBJ_OnEnd[];
extern const u8 efxSilence_Loop_Main[];
extern const u8 efxSleepBG_Loop[];
extern const u8 efxSleepOBJ_OnEnd[];
extern const u8 efxSleepSE_OnEnd[];
extern const u8 efxSleepSE_PlaySE[];
extern const u8 efxSongOBJ_Loop[];
extern const u8 efxStoneBG_Loop[];
extern const u8 efxStoneOBJ_Loop[];
extern const u8 efxStone_Loop_Main[];
extern const u8 efxSuperdruidBG3_Loop[];
extern const u8 efxSuperdruidOBJ2_OnEnd[];
extern const u8 efxThunderstormBG_Loop[];
extern const u8 efxThunderstormColor_Loop_A[];
extern const u8 efxThunderstormColor_Loop_B[];
extern const u8 efxThunderstormColor_Loop_C[];
extern const u8 efxThunderstormDark_Loop_A[];
extern const u8 efxThunderstormDark_Loop_B[];
extern const u8 efxThunderstormOBJ_End[];
extern const u8 efxThunderstormOBJ_Loop[];
extern const u8 efxWeaponIcon_Loop[];
extern const u8 efxWeaponIcon_OnEnd[];
extern const u8 ekrBaStart_0[];
extern const u8 ekrBaStart_1[];
extern const u8 ekrBaStart_2[];
extern const u8 ekrBaStart_ExecEkrBattle6C[];
extern const u8 ekrBaStart_InitBattleScreen[];
extern const u8 ekrBaStart_InitScreen[];
extern const u8 ekrBaStart_SreenFailIn[];
extern const u8 ekrDispUPMain[];
extern const u8 ekrTogiColor_Loop[];
extern const u8 ekrTogiEnd_End[];
extern const u8 ekrTogiEnd_Init[];
extern const u8 ekrTogiEnd_Loop[];
extern const u8 ekrTogiInit_End[];
extern const u8 ekrTogiInit_Init[];
extern const u8 ekrTogiInit_LoadGfx[];
extern const u8 ekrTogiInit_Loop[];
extern const u8 frontier_banim_aurabg3_000_76E98C[];
extern const u8 frontier_banim_aurabg3_001_76FE78[];
extern const u8 frontier_banim_aurabg3_002_771224[];
extern const u8 frontier_banim_aurabg3_003_7725D4[];
extern const u8 frontier_banim_aurabg3_004_7738F0[];
extern const u8 frontier_banim_aurabg3_005_774CB8[];
extern const u8 frontier_banim_aurabg3_006_774F30[];
extern const u8 frontier_banim_aurabg3_007_7751A8[];
extern const u8 frontier_banim_aurabg3_008_775420[];
extern const u8 frontier_banim_aurabg3_009_775698[];
extern const u8 frontier_banim_aurabg3_010_775908[];
extern const u8 frontier_banim_aurabg3_011_775B64[];
extern const u8 frontier_banim_aurabg3_012_775DDC[];
extern const u8 frontier_banim_aurabg3_013_776054[];
extern const u8 frontier_banim_aurabg3_014_7762CC[];
extern const u8 frontier_banim_aurabg3_015_776544[];
extern const u8 frontier_banim_aurabg3_016_7767BC[];
extern const u8 frontier_banim_aurabg3_017_777118[];
extern const u8 frontier_banim_aurabg3_018_7771B8[];
extern const u8 frontier_banim_aurabg3_019_777264[];
extern const u8 frontier_banim_aurabg3_020_777308[];
extern const u8 frontier_banim_aurabg3_021_7773B4[];
extern const u8 frontier_banim_aurabg3_022_777468[];
extern const u8 frontier_banim_aurabg3_023_777520[];
extern const u8 frontier_banim_aurabg3_024_7775CC[];
extern const u8 frontier_banim_aurabg3_025_777674[];
extern const u8 frontier_banim_aurabg3_026_77771C[];
extern const u8 frontier_banim_aurabg3_027_7777BC[];
extern const u8 frontier_banim_aurabg3_028_777858[];
extern const u8 frontier_banim_dracozombie_018_781CBC[];
extern const u8 frontier_banim_dracozombie_019_7832B4[];
extern const u8 frontier_banim_dracozombie_020_7844F0[];
extern const u8 frontier_banim_dracozombie_021_785C08[];
extern const u8 frontier_banim_dracozombie_022_7875A0[];
extern const u8 frontier_banim_dracozombie_023_788CC4[];
extern const u8 frontier_banim_dracozombie_024_78A0D0[];
extern const u8 frontier_banim_dracozombie_025_78AF74[];
extern const u8 frontier_banim_dracozombie_026_78BE1C[];
extern const u8 frontier_banim_dracozombie_027_78CEA8[];
extern const u8 frontier_banim_dracozombie_028_78D004[];
extern const u8 frontier_banim_dracozombie_029_78D354[];
extern const u8 frontier_banim_dracozombie_030_78D6A4[];
extern const u8 frontier_banim_dracozombie_031_78DAB4[];
extern const u8 frontier_banim_dracozombie_032_78DF08[];
extern const u8 frontier_banim_dracozombie_033_78E33C[];
extern const u8 frontier_banim_dracozombie_034_78E750[];
extern const u8 frontier_banim_dracozombie_035_78EAE0[];
extern const u8 frontier_banim_dracozombie_036_78EE00[];
extern const u8 frontier_banim_dracozombie_037_794964[];
extern const u8 frontier_banim_dracozombie_038_794D78[];
extern const u8 frontier_banim_dracozombie_039_795198[];
extern const u8 frontier_banim_dracozombie_040_7955B8[];
extern const u8 frontier_banim_dracozombie_040b_7959D8[];
extern const u8 frontier_df3_banim_aura_003_754840[];
extern const u8 frontier_df3_banim_mid_000_64D2B4[];
extern const u8 frontier_df3_banim_mid_000b_64D3C8[];
extern const u8 frontier_df3_banim_mid_000c_64D478[];
extern const u8 frontier_df3_banim_mid_000d_64D580[];
extern const u8 frontier_df3_banim_mid_000e_64D6BC[];
extern const u8 frontier_df3_banim_mid_000f_64D830[];
extern const u8 frontier_df3_banim_mid_000g_64D9C8[];
extern const u8 frontier_df3_banim_mid_000h_64DB3C[];
extern const u8 frontier_df3_banim_mid_000i_64DC48[];
extern const u8 frontier_df3_banim_mid_000j_64DD1C[];
extern const u8 frontier_df3_banim_mid_006_654DFC[];
extern const u8 frontier_df3_banim_mid_008_657A78[];
extern const u8 frontier_df3_banim_mid_008b_657B20[];
extern const u8 frontier_df3_banim_mid_008c_657BDC[];
extern const u8 frontier_df3_banim_mid_008d_657CB4[];
extern const u8 frontier_df3_banim_mid_008e_657D94[];
extern const u8 frontier_df3_banim_mid_009_6587E0[];
extern const u8 frontier_df3_banim_mid_009b_658880[];
extern const u8 frontier_df3_banim_mid_009c_658934[];
extern const u8 frontier_df3_banim_mid_009d_6589F0[];
extern const u8 frontier_df3_banim_mid_009e_658ACC[];
extern const u8 frontier_df3_banim_mid_009f_658BB4[];
extern const u8 frontier_df3_banim_mid_009g_658CD8[];
extern const u8 frontier_df3_banim_mid_009h_658DF8[];
extern const u8 frontier_df3_banim_mid_009i_658F04[];
extern const u8 frontier_df3_banim_mid_009j_659010[];
extern const u8 frontier_df3_banim_mid_009k_65910C[];
extern const u8 frontier_df3_banim_mid_009l_65920C[];
extern const u8 frontier_df3_banim_mid_009m_659308[];
extern const u8 frontier_df4_banim_b_015_62DC84[];
extern const u8 frontier_df4_banim_b_015b_62DD30[];
extern const u8 frontier_df4_banim_b_015c_62DDE8[];
extern const u8 frontier_df4_banim_b_015d_62DEB4[];
extern const u8 frontier_df4_banim_b_016_62EDD8[];
extern const u8 frontier_df4_banim_b_016b_62EF78[];
extern const u8 frontier_df4_banim_b_016c_62F118[];
extern const u8 frontier_df4_banim_b_016d_62F2B8[];
extern const u8 frontier_df4_banim_b_016e_62F458[];
extern const u8 frontier_df4_banim_b_017_63CDD4[];
extern const u8 frontier_df4_banim_b_017b_63CE78[];
extern const u8 frontier_df4_banim_b_017c_63CF20[];
extern const u8 frontier_df4_banim_b_018_63D868[];
extern const u8 frontier_df4_banim_b_018b_63DA88[];
extern const u8 frontier_df4_banim_b_019_64C610[];
extern const u8 frontier_df4_banim_b_019b_64C71C[];
extern const u8 frontier_df4_banim_b_021_663368[];
extern const u8 frontier_df4_banim_b_021b_663414[];
extern const u8 frontier_df4_banim_b_021c_6634C4[];
extern const u8 frontier_df4_banim_b_021d_66357C[];
extern const u8 frontier_df4_banim_b_021e_66363C[];
extern const u8 frontier_df4_banim_b_021f_663708[];
extern const u8 frontier_df4_banim_b_021g_6637E8[];
extern const u8 frontier_df4_banim_b_022_665FB0[];
extern const u8 frontier_df4_banim_b_022b_66608C[];
extern const u8 frontier_df4_banim_b_022c_666158[];
extern const u8 frontier_df4_banim_b_022d_666210[];
extern const u8 frontier_df4_banim_b_023_6719A8[];
extern const u8 frontier_df4_banim_b_023b_671A48[];
extern const u8 frontier_df4_banim_b_023c_671AF0[];
extern const u8 frontier_df4_banim_b_023d_671B98[];
extern const u8 frontier_df4_banim_b_023e_671C48[];
extern const u8 frontier_df4_banim_b_023f_671D00[];
extern const u8 frontier_df4_banim_b_023g_671DCC[];
extern const u8 frontier_df4_banim_b_023h_671E98[];
extern const u8 frontier_df4_banim_b_023i_671F6C[];
extern const u8 frontier_df4_banim_b_023j_672044[];
extern const u8 frontier_df4_banim_b_023k_672120[];
extern const u8 frontier_df4_banim_b_025_67F520[];
extern const u8 frontier_df4_banim_b_026_683C80[];
extern const u8 frontier_df4_banim_b_026aa_6860D8[];
extern const u8 frontier_df4_banim_b_026ab_68624C[];
extern const u8 frontier_df4_banim_b_026ac_6863FC[];
extern const u8 frontier_df4_banim_b_026ad_6865AC[];
extern const u8 frontier_df4_banim_b_026ae_68675C[];
extern const u8 frontier_df4_banim_b_026af_6868D0[];
extern const u8 frontier_df4_banim_b_026ag_686A44[];
extern const u8 frontier_df4_banim_b_026b_683D84[];
extern const u8 frontier_df4_banim_b_026c_683E88[];
extern const u8 frontier_df4_banim_b_026d_683F8C[];
extern const u8 frontier_df4_banim_b_026e_6840CC[];
extern const u8 frontier_df4_banim_b_026f_684210[];
extern const u8 frontier_df4_banim_b_026g_684354[];
extern const u8 frontier_df4_banim_b_026h_684498[];
extern const u8 frontier_df4_banim_b_026i_6845DC[];
extern const u8 frontier_df4_banim_b_026j_684720[];
extern const u8 frontier_df4_banim_b_026k_6848A0[];
extern const u8 frontier_df4_banim_b_026l_684A24[];
extern const u8 frontier_df4_banim_b_026m_684BA8[];
extern const u8 frontier_df4_banim_b_026n_684D08[];
extern const u8 frontier_df4_banim_b_026o_684E68[];
extern const u8 frontier_df4_banim_b_026p_684FC8[];
extern const u8 frontier_df4_banim_b_026q_68516C[];
extern const u8 frontier_df4_banim_b_026r_685310[];
extern const u8 frontier_df4_banim_b_026s_6854B4[];
extern const u8 frontier_df4_banim_b_026t_685624[];
extern const u8 frontier_df4_banim_b_026u_685794[];
extern const u8 frontier_df4_banim_b_026v_685904[];
extern const u8 frontier_df4_banim_b_026w_685AA8[];
extern const u8 frontier_df4_banim_b_026x_685C4C[];
extern const u8 frontier_df4_banim_b_026y_685DF0[];
extern const u8 frontier_df4_banim_b_026z_685F64[];
extern const u8 frontier_df4_banim_b_027_6870D4[];
extern const u8 frontier_df4_banim_b_027b_68724C[];
extern const u8 frontier_df4_banim_b_027c_6873C4[];
extern const u8 frontier_df4_banim_b_028_69697C[];
extern const u8 frontier_df4_banim_b_028b_696AA0[];
extern const u8 frontier_df4_banim_b_028c_696BC0[];
extern const u8 frontier_df4_banim_b_028d_696CCC[];
extern const u8 frontier_df4_banim_b_028e_696DC8[];
extern const u8 frontier_df4_banim_b_028f_696EB0[];
extern const u8 frontier_df4_banim_b_028g_696F98[];
extern const u8 frontier_df4_banim_b_028h_697078[];
extern const u8 frontier_df4_banim_b_028i_697154[];
extern const u8 frontier_df4_banim_b_028j_697234[];
extern const u8 frontier_df4_banim_b_028k_697328[];
extern const u8 frontier_df4_banim_b_028l_69741C[];
extern const u8 frontier_df4_banim_b_028m_697520[];
extern const u8 frontier_df4_banim_b_028n_697628[];
extern const u8 frontier_df4_banim_b_028o_697740[];
extern const u8 frontier_df4_banim_b_028p_697864[];
extern const u8 frontier_df4_banim_b_033_6A819C[];
extern const u8 frontier_df4_banim_b_033b_6A8248[];
extern const u8 frontier_df4_banim_b_033c_6A82FC[];
extern const u8 frontier_df4_banim_b_033d_6A83BC[];
extern const u8 frontier_df4_banim_b_033e_6A8484[];
extern const u8 frontier_df4_banim_b_033f_6A8560[];
extern const u8 frontier_df4_banim_b_037_6AC820[];
extern const u8 frontier_df4_banim_b_037b_6AC908[];
extern const u8 frontier_df4_banim_b_037c_6ACA04[];
extern const u8 frontier_df4_banim_b_037d_6ACAEC[];
extern const u8 frontier_df4_banim_b_037e_6ACB84[];
extern const u8 frontier_df4_banim_b_037f_6ACC6C[];
extern const u8 frontier_df4_banim_b_037g_6ACD04[];
extern const u8 frontier_df4_banim_b_037h_6ACDEC[];
extern const u8 frontier_df4_banim_b_037i_6ACEE8[];
extern const u8 frontier_df4_banim_b_037j_6ACF80[];
extern const u8 frontier_df4_banim_b_037k_6AD068[];
extern const u8 frontier_df4_banim_b_037l_6AD100[];
extern const u8 frontier_df4_banim_b_037m_6AD1FC[];
extern const u8 frontier_df4_banim_b_056_7657CC[];
extern const u8 frontier_df4_banim_b_056b_7658D0[];
extern const u8 frontier_df4_banim_b_056c_7659D4[];
extern const u8 frontier_df4_banim_b_057_79A108[];
extern const u8 frontier_df4_banim_b_058_79F83C[];
extern const u8 frontier_df4_banim_b_059_79FCB0[];
extern const u8 frontier_df4_misc_lo_009_0E37C5[];
extern const u8 frontier_df4_misc_lo_009aa_0E3910[];
extern const u8 frontier_df4_misc_lo_009ab_0E3928[];
extern const u8 frontier_df4_misc_lo_009b_0E3BA4[];
extern const u8 frontier_df4_misc_lo_009c_0E3BC4[];
extern const u8 frontier_df4_misc_lo_009d_0E3BE0[];
extern const u8 frontier_df4_misc_lo_009e_0E3C04[];
extern const u8 frontier_df4_misc_lo_009f_0E3C28[];
extern const u8 gEfxQuakeVecs[];
extern const u8 gEfxQuakeVecs2[];
extern const u8 gEfxbattle_0[];
extern const u8 gEfxbattle_1[];
extern const u8 gEfxbattle_2[];
extern const u8 gEfxbattle_3[];
extern const u8 gEfxbattle_4[];
extern const u8 gEfxmagicHealstaves_3[];
extern const u8 gEfxmagicHealstaves_7[];
extern const u8 gEkrSpellAnimLut[];
extern const u8 gap_000695C4[];
extern const u8 nullsub_55[];
extern const u8 nullsub_56[];
extern const u8 nullsub_57[];
extern const u8 pad_BC3A00[];
extern const u8 sub_8055EB8[];
extern const u8 sub_8055F40[];
extern const u8 sub_8055F90[];
extern const u8 sub_805601C[];
extern const u8 sub_8056078[];
extern const u8 sub_805DC9C[];
extern const u8 sub_805DDF8[];
extern const u8 sub_805DE74[];
extern const u8 sub_805DFC8[];
extern const u8 sub_805E004[];
extern const u8 sub_805E130[];
extern const u8 sub_805E488[];
extern const u8 sub_805E5D0[];
extern const u8 sub_805E780[];
extern const u8 sub_805F1E4[];
extern const u8 sub_8060F84[];
extern const u8 sub_806166C[];
extern const u8 sub_8062CE4[];
extern const u8 sub_80634E0[];
extern const u8 sub_8063940[];
extern const u8 sub_8063D14[];
extern const u8 sub_8064314[];
extern const u8 sub_8064568[];
extern const u8 sub_8065A44[];
extern const u8 sub_8065AA8[];
extern const u8 sub_8065BF0[];
extern const u8 sub_8065C54[];
extern const u8 sub_8065E44[];
extern const u8 sub_80661D0[];
extern const u8 sub_80661EC[];
extern const u8 sub_8066410[];
extern const u8 sub_80664B8[];
extern const u8 sub_80664D0[];
extern const u8 sub_80664EC[];
extern const u8 sub_8066508[];
extern const u8 sub_8066E24[];
extern const u8 sub_8066E40[];
extern const u8 sub_806749C[];
extern const u8 sub_8067600[];
extern const u8 sub_8067618[];
extern const u8 sub_8067884[];
extern const u8 sub_8067EA4[];
extern const u8 sub_8067F68[];
extern const u8 sub_8068850[];
extern const u8 sub_8068E34[];

/* externs for #148 carved proc-script pointer targets (relocatable refs) */
extern void DummvRSTMain();
extern void EfxALPHAMain();
extern void EfxArrowObjMain();
extern void EfxAvoidMain();
extern void EfxBlackInMain1();
extern void EfxBlackInMain2();
extern void EfxBlackInRestorePalSync();
extern void EfxBlackOutMain1();
extern void EfxBlackOutMain2();
extern void EfxBlackOutRestorePalSync();
extern void EfxDeadDragonAlphaMain();
extern void EfxDummymagicMain();
extern void EfxElfireBGCOL_Loop();
extern void EfxElfireBG_Loop();
extern void EfxElfireObj_Loop();
extern void EfxFireHitBG_Loop();
extern void EfxFireOBJ_Loop();
extern void EfxHPBarColorChangeMain();
extern void EfxHpBar_MoveCameraOnEnd();
extern void EfxHpBar_WaitCameraMove();
extern void EfxNoDamageMain();
extern void EfxNoDamageYureMain();
extern void EfxRestWINMain();
extern void EfxStatusUnitEnd();
extern void EfxStatusUnitMain();
extern void EfxTeonoMain();
extern void EfxTeonoObj2Main();
extern void EfxTeonoObjEnd();
extern void EfxTeonoObjMain();
extern void EfxTeyariMain();
extern void EfxTeyariObjMain();
extern void EfxThunderBGCOL_Loop();
extern void EfxThunderBGMain();
extern void EfxThunderOBJMain();
extern void EfxTwobaiRSTMain();
extern void EfxWhiteInMain1();
extern void EfxWhiteInMain2();
extern void EfxWhiteInRestorePalSync();
extern void EfxWhiteOutMain1();
extern void EfxWhiteOutMain2();
extern void EfxWhiteOutRestorePalSync();
extern void EkrBaseAppearMain();
extern void EkrBaseKaitenMain();
extern void EkrNamewinAppearDelay();
extern void EkrNamewinAppearMain();
extern void EkrWindowAppearMain();
extern u8 FrameConfig_AnimaHitBG[];
extern u8 Frames_efxHazymoonBG_C[];
extern u8 Frames_efxSleepBG[];
extern void Loop6C_efxFire();
extern void Loop6C_efxFireBG();
extern void UnitKakudaiEndNop();
extern void UnitKakudaiMain();
extern void UnitKakudaiPrepareAnimScript();
extern void efxBerserkCLONE_OnEnd();
extern void efxDarkbreathOBJ_Loop();
extern void efxFenrir_Loop_Main();
extern void efxFirebreath_Loop_Main();
extern void efxHammarneBG_Loop();
extern void efxHammarne_Loop_Main();
extern void efxHazymoonOBJ3RND_OnEnd();
extern void efxHitQuake_Loop();
extern void efxLightning_Loop_Main();
extern void efxLive_Loop_Main();
extern void efxLuceBGCOL_Loop();
extern void efxMistyRainBg_Loop();
extern void efxMistyRainObj2_0();
extern void efxMistyRainObj2_1();
extern void efxMistyRainObj_0();
extern void efxMistyRainObj_1();
extern void efxMistyRainObj_2();
extern void efxMistyRainObj_OnEnd();
extern void efxOura_Loop_Main();
extern void efxQuakePure_Loop();
extern void efxQuake_Loop();
extern void efxResire_Loop_Main();
extern void efxRestRSTMain();
extern void efxRestRST_OnEnd();
extern void efxSPDQuake_Loop();
extern void efxSPDQuake_Loop2();
extern void efxShooter_Loop_Main();
extern void efxSleep_Loop_Main();
extern void efxSongBG_Loop();
extern void efxSong_Loop_Main();
extern void efxSpellCast_Loop_A();
extern void efxSpellCast_Loop_B();
extern void efxSpellCast_Loop_C();
extern void efxThunderstorm_Loop_Main();
extern void ekrBattleEnding_0();
extern void ekrBattleEnding_1();
extern void ekrBattleEnding_2();
extern void ekrBattleEnding_3();
extern void ekrBattleEnding_4();
extern void ekrBattleEnding_5();
extern void ekrBattleEnding_6();
extern void ekrBattleEnding_7();
extern u8 frontier_df4_misc_lo_005_0DF388[];
extern u8 frontier_df4_misc_lo_006_0DFBEF[];
extern u8 frontier_df4_misc_lo_007_0E1870[];
extern u8 frontier_df4_misc_lo_008_0E2638[];
extern u8 gEfxNoDmgBgShakeOff[];
extern u8 gEfxbattle_6[];
extern u8 gFrameLut_EfxHPBarColorChange2[];
extern u8 gFrameLut_EfxStatusUnit[];
extern u8 gUnk_080DFD46[];
extern void nullsub_53();
extern void sub_8066B7C();
extern u8 x080E1D0C[];
extern u8 x080E1D24[];
extern u8 x080E1DCC[];

/* Migrated from asm/frontier_df4_banim_a.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df4_banim_a_000_5E0E94[] __attribute__((section(".data.frontier_df4_banim_a.gap0"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_000a_5E0E94.4bpp.lz");
/* data_085E1740: raw non-LZ trailing carve (was part of hybrid JP-LZ blob), byte-exact. */
u32 data_085E1740[] __attribute__((section(".data.frontier_df4_banim_a.gap0"))) = {
    0x1D6C0000, 0x616B614A, 0x79CF698C, 0x77DF658F, 0x3A535D29, 0x4B3A3ED6,
    0x5BDE537C, 0x67FF5FFF, 0x7FDD6753, 0x4E306F37, 0x3BBE212A, 0x19B11A77,
    0x7DE211FF, 0x623876F5, 0x4BEF0AE3, 0x0000594A, 0x00100010, 0xF0000038,
    0x9001F001, 0x00111101, 0xAFB10000, 0x5BF10000, 0xA1001000, 0x111DF0B5,
    0x00FFFF11, 0x5555FFFF, 0x33335555, 0xF0333320, 0xFA00001F, 0x0000011B,
    0x00011FB5, 0x9401193B, 0x88F11100, 0xD0380380, 0x0442330F, 0x33233423,
    0x33060042, 0x10347423, 0x300F1006, 0x11003311, 0x00F52333, 0x7003F04B,
    0xB3AB0003, 0x303B4700, 0x7D10B8B3, 0x70030010, 0x23A31001, 0x22072222,
    0xBBBBBBBB, 0x0110BB10, 0x39541F90, 0x00F3A300, 0xAF00B947, 0x10F21111,
    0xB011F103, 0x915F1001, 0xBB7300FF, 0xDB0300B8, 0x1F31FFF0, 0xDDDD6F10,
    0xE0DD60DD, 0xFFB2001F, 0xEB00001A, 0xED7300BC, 0x4310BF20, 0x035003F0,
    0xDE01DCDD, 0xDDEDDDCD, 0x4B00DCEC, 0xCDDDED01, 0xECDCDECE, 0xDC000810,
    0xCEDCDECD, 0x7BEDCDED, 0xF04310DD, 0x40037003, 0xCB01EE47, 0x21B0AF00,
    0x8F90101B, 0xEEEE4710, 0xF1E9EEEE, 0x1001301F, 0x0300DE43, 0x1FF11ABB,
    0x600110C1, 0xFFFFFD9F, 0x9F00DFED, 0x9F00DF54, 0xDF9F00EF, 0xEDCF9F00,
    0x1F50DD7A, 0xBFF01311, 0x00DF1F90, 0x00AABD06, 0x1F00BC1F, 0xBC1F00BD,
    0x15BD1F00, 0x00DFDDDD, 0x5F00EF1F, 0xD51600DF, 0x3F005FF0, 0xBD3F00BE,
    0xF0BD1F01, 0x3FF0C73F, 0xBBBD3F30, 0x917FD0BB, 0xC70B115F, 0x5FF01F70,
    0x60DBBBBB, 0x201FF2BF, 0x00F06701, 0xF08F0203, 0x011AF0DA, 0x0D0B01FF,
    0x99999999, 0x01301FF2, 0x4B03000A, 0xFD03009F, 0xD94A2009, 0x037003F0,
    0xF04310FC, 0x10017001, 0x7003F043, 0x2B000003, 0x0400DFA0, 0x900300F9,
    0xDF0189F0, 0x504300FE, 0x301DF0AF, 0x20AB1043, 0x0001F04A, 0xBBCCBC02,
    0x01CBCBBC, 0xBC00CC4F, 0xCCCCCCBB, 0x02BCDDCB, 0xBCDCCCCB, 0x0B00CBCC,
    0xDCBC30BC, 0x1F200400, 0xDCCDBBCB, 0xDC1F1080, 0xCCBCCDCB, 0xDC02BBCC,
    0xBDCCDBCB, 0xBBA501CC, 0xD3E2BB41, 0xCD11119B, 0xF45F33FE, 0x71F0B311,
    0x0310DF22, 0xD90600A1, 0x9F9F10B1, 0xFF03009F, 0x00DBDDF1, 0x9BCCF1CD,
    0xACACFAAA, 0xDDFEBD00, 0xBCFEACDB, 0xFAFC04B9, 0x14AFAA9C, 0xC0DCCD1F,
    0x2A02E000, 0xAA999AD9, 0xCB00AADA, 0xAA9ADADD, 0x03FFFFBA, 0xAAFABBAC,
    0x1F10DA9F, 0xEE00BB22, 0xDEC9CCDC, 0x00ADCDCC, 0xACCCCCCD, 0xCDCCCCBE,
    0xBBCCCD02, 0x00CCBDEC, 0x01D6107F, 0xC90320E3, 0x53007330, 0xF1832063,
    0xAFF9AC00, 0xAFFFFCF1, 0xCFCC00F9, 0x999CFAB9, 0xEC00D9BB, 0xABC1BCBB,
    0x00DACCAE, 0xCEADCCCE, 0xCDABDEAA, 0xA9FFAD00, 0xFFFC9FDF, 0xC99F00DF,
    0xAA9FDFCF, 0x9F01DF99, 0x9FDFBBBA, 0x0700ADDC, 0x9FDFDC02, 0x00BACAA9,
    0xBF00A96B, 0xBDC9CBCB, 0x60EABCBC, 0x002901CD, 0xDCCECA0F, 0xCE01AEDC,
    0xCABDCCCC, 0x6600BCCC, 0x0300E95A, 0x100340EC, 0xE3939183, 0xDBEA00BC,
    0xCAECAABA, 0xEE00CAAA, 0xEEAABEEC, 0x009BBBBA, 0x111919EC, 0x1019AACA,
    0x119B9110, 0xFF010E04, 0xAB00BA9F, 0xAAAA9DFD, 0x00EE9DFD, 0xBB9CFCEE,
    0x111ADABB, 0x19C91103, 0x03911111, 0x002D14EB, 0xBCCABBEC, 0xFCCEBECA,
    0xEEBECE16, 0xD4CC7311, 0xCD1B1123, 0xDCDCCD1C, 0xC911D111, 0xCBCCD021,
    0xBCCCBC05, 0x0400DBCD, 0xCE3F11CC, 0x018001F0, 0x03F03003, 0x63100380,
    0x00003F03, 0x6C160810, 0x03D023F0, 0x33102740, 0x00FF25D5, 0x034013AB,
    0x33030093, 0x90FDC702, 0x50CF507E, 0xC0E71201, 0x3103101F, 0x39400340,
    0x88331EC0, 0x8872711B, 0x77211B1D, 0x03100700, 0x10610B00, 0x00285507,
    0x17107603, 0xDD1300DD, 0x40AA0730, 0x0710610B, 0x76030028, 0x00481710,
    0x4488811B, 0xBB44411B, 0xF5B11B38, 0x3601F07F, 0xFFFB1A5F, 0x211BDB08,
    0x68531022, 0x8220F177, 0x87030072, 0x7882F127, 0x82F17609, 0x770F4067,
    0x00130078, 0x3382F172, 0x23DBF132, 0xDBF1330B, 0x34030042, 0x03100B10,
    0x0F303450, 0x23031033, 0x032235F1, 0xBB24F122, 0x7F50A1BB, 0xF0D21FA6,
    0x91DF167F, 0xBBF1FF07, 0xAAEF3F10, 0x05EF3F05, 0x8B03EF3F, 0xEF3F05EF,
    0x003F05CA, 0x05EFDC0F, 0x5F35EF1F, 0x3805ABAD, 0xADAB03AC, 0x05AE5F05,
    0xAF0F205F, 0x05AE3F05, 0x5FF0AD3F, 0xFC133F37, 0x30FD5330, 0xF10F1003,
    0x4001F01F, 0xAB2E103F, 0x50E23610, 0xF00F1003, 0xDC00003F, 0x00CDBF00,
    0xDCECDBCD, 0xCDCCBDBC, 0xBCBBCB00, 0xBBCBBDCE, 0xBBCB24DD, 0xBCBB8704,
    0xDDBB6E03, 0xCDCCDC11, 0xCBECA804, 0xBEC114CB, 0x24BCC804, 0x001D00AE,
    0x80060024, 0xBC1EDD1F, 0xFC02CBDB, 0x9A040500, 0x03CC1F00, 0xDCBDBBCB,
    0x0708BCBD, 0xDC050C00, 0xCDBDBBCC, 0x00BE3100, 0x00CD4208, 0xDBCCDC24,
    0xCD7800CB, 0x704630F7, 0x00061004, 0x2505DC21, 0x53006304, 0xBC6D2096,
    0xDB1500EC, 0x5F007C00, 0x20DB7AEC, 0x1051001F, 0xFDDB071F, 0x59F1DF37,
    0xAC03009C, 0x13040300, 0x0300CCF1, 0x1310AB68, 0x07CC5707, 0x9ADAEF9C,
    0xCC9DA900, 0xADFFFFCA, 0xAFAA00FC, 0xFDFACF9A, 0xFA049AA9, 0xF9ABCBFD,
    0xFFFFB507, 0xDDDDEB00, 0xBAAAAADE, 0xA9CF00CE, 0x9CFABDCB, 0xC900CEBA,
    0x99CECB9F, 0x0EBEBAA9, 0xBECBBCB9, 0x6B105780, 0xD09B5B10, 0x17200F40,
    0xCD4710AA, 0x00DAFDFB, 0xBDFDFAAB, 0xDBDFDB9A, 0xCFCBBA00, 0xAFAACBD9,
    0xA9AD00BA, 0xBA9DBA9C, 0xDC00A99A, 0x99A9BEBD, 0x00B9CEDB, 0xA9CEC9AC,
    0xB9BECBAA, 0xBECAAA00, 0xCEDBABC9, 0x4B0782BB, 0xCEAAAAAA, 0xEE7F00DF,
    0xDDCECE00, 0x99ADA9BD, 0xACCA00BD, 0xCADBBDFC, 0xAC00BDAF, 0x9ABDACF9,
    0x04BDA9AA, 0xCD9ABCB9, 0xBE2000FC, 0xDADD10DE, 0x9C9315A9, 0x20AAFACA,
    0x2F05B9CF, 0x999FDFC9, 0x9FDF0CBA, 0xF3F8CBCB, 0xA9BD03B0, 0xBA470080,
    0xADCDBCDC, 0xBD00AABD, 0xBDB9ABDB, 0x00BBADB9, 0xACBD9ABD, 0x9ADBA9BD,
    0xDBAABD10, 0xDDCA7B05, 0x9A489FDF, 0x9ACB5300, 0xFCCB0705, 0xBAAB009C,
    0xCABC9AFA, 0xDB1FB9CA, 0x7300ABDD, 0x03B053F0, 0xBFBABFFA, 0xF01FF0FC,
    0xF01FF01F, 0x301FF01F, 0x7110001F, 0xF0ED051B, 0x00036003, 0x03F032F1,
    0xFB0370FF, 0x1403B053, 0x12EB1BE3, 0xF31C2427, 0x7FF3E07F, 0x0F101F8C,
    0xFFFFAFB1, 0x555B04F1, 0x04B4A155, 0x10244481, 0x0424F133, 0x23323481,
    0x332412F1, 0x342F9032, 0x32140032, 0x23332200, 0x32342323, 0x23321C32,
    0xF01FF033, 0xFA1F201F, 0x5555001B, 0x22341FB5, 0x0BA01B2B, 0x1F001BEB,
    0x2232321B, 0x2433011B, 0x35F11B23, 0x0CE10424, 0x25F14232, 0x7F00E914,
    0x33142235, 0x7F0025F1, 0x257F0035, 0x51008033, 0x33231B24, 0xF0321B22,
    0x0B203300, 0x3F903700, 0x45454233, 0x54542309, 0x45060054, 0x71070034,
    0x810F1023, 0x540D107F, 0x07004454, 0x26003559, 0x801D3034, 0x0034F11F,
    0x0034507F, 0x7F00247F, 0xA1323444, 0xFF00B47C, 0x13110B01, 0x7300BB10,
    0x331F2323, 0xCD004232, 0xDF30D400, 0x1FF06F91, 0x701FE0FF, 0x01FB10BF,
    0x110B1103, 0x22EB2413, 0x019B2007, 0x0001AE0C, 0x00001FB1, 0x0019F910,
    0x001B9F10, 0x00F9F124, 0x201BB903, 0x80F1000B, 0x9FB91300, 0xFB9F1001,
    0xFB101601, 0x9F2700B9, 0x0B002700, 0x30B97F9F, 0x200B0003, 0x201B003B,
    0x202B0023, 0x4710FF33, 0x4B104300, 0x5B100B10, 0x6B202710, 0x00C07310,
    0x11BFB27B, 0x22122311, 0x34230922, 0xDFF25555, 0xAF102333, 0x22AA0DBA,
    0x1F50DF10, 0x01547201, 0x90F8457A, 0x5B5F9107, 0x30C3FCAB, 0xEBBBBB01,
    0xDCED1B00, 0xDDDE1BEC, 0x001B7CDD, 0x20DD081E, 0x20181D01, 0x00E9E901,
    0xFFFF1BE9, 0xCDCD1BEF, 0xCC1BEC00, 0xBB1BECCB, 0x1BEB00BC, 0x1BECBCCC,
    0x10B0CCBC, 0x0700ED07, 0xCBCB0B30, 0xCD541BEB, 0x00CC4700, 0x1F00CD0F,
    0x0090DCBB, 0x21ECBD1F, 0x77F9EC63, 0xBFAF041B, 0x07FA1BF9, 0x05F9F995,
    0xFFF919BF, 0xC90700EA, 0xBB400B30, 0x1BF90710, 0x1BFBB9F9, 0x00C9F92D,
    0x0700C907, 0x10BB0F10, 0x1BF9000B, 0x11FF9F92, 0x9F019F93, 0xAFFF931C,
    0x0B00931E, 0xBFFFF900, 0x9BFA9F1C, 0x1EC10F1F, 0x5B101FFD, 0x0110BFF0,
    0x5AE0437F, 0x3983F99F, 0x00000083, 0x194C0000, 0x05DB01B9, 0x1A5D0DFD,
    0x77DF05DC, 0x3A530198, 0x4B3A3ED6, 0x5BDE537C, 0x67FF5FFF, 0x77FE200F,
    0x4DD86F37, 0x33DF212B, 0x19B11A77, 0x7DE211FF, 0x623876F5, 0x53F00B63,
    0x00004914, 0x00100010, 0xF0000038, 0x9001F001, 0x00111101, 0xAFB10000,
    0x5BF10000, 0xA1001000, 0x111DF0B5, 0x00FFFF11, 0x5555FFFF, 0x33335555,
    0xF0333320, 0xFA00001F, 0x0000011B, 0x00011FB5, 0x9401193B, 0x88F11100,
    0xD0380380, 0x0442330F, 0x33233423, 0x33060042, 0x10347423, 0x300F1006,
    0x11003311, 0x00F52333, 0x7003F04B, 0xB3AB0003, 0x303B4700, 0x7D10B8B3,
    0x70030010, 0x23A31001, 0x22072222, 0xBBBBBBBB, 0x0110BB10, 0x39541F90,
    0x00F3A300, 0xAF00B947, 0x10F21111, 0xB011F103, 0x915F1001, 0xBB7300FF,
    0xDB0300B8, 0x1F31FFF0, 0xDDDD6F10, 0xE0DD60DD, 0xFFB2001F, 0xEB00001A,
    0xED7300BC, 0x4310BF20, 0x035003F0, 0xDE01DCDD, 0xDDEDDDCD, 0x4B00DCEC,
    0xCDDDED01, 0xECDCDECE, 0xDC000810, 0xCEDCDECD, 0x7BEDCDED, 0xF04310DD,
    0x40037003, 0xCB01EE47, 0x21B0AF00, 0x8F90101B, 0xEEEE4710, 0xF1E9EEEE,
    0x1001301F, 0x0300DE43, 0x1FF11ABB, 0x600110C1, 0xFFFFFD9F, 0x9F00DFED,
    0x9F00DF54, 0xDF9F00EF, 0xEDCF9F00, 0x1F50DD7A, 0xBFF01311, 0x00DF1F90,
    0x00AABD06, 0x1F00BC1F, 0xBC1F00BD, 0x15BD1F00, 0x00DFDDDD, 0x5F00EF1F,
    0xD51600DF, 0x3F005FF0, 0xBD3F00BE, 0xF0BD1F01, 0x3FF0C73F, 0xBBBD3F30,
    0x917FD0BB, 0xC70B115F, 0x5FF01F70, 0x60DBBBBB, 0x201FF2BF, 0x00F06701,
    0xF08F0203, 0x011AF0DA, 0x0D0B01FF, 0x99999999, 0x01301FF2, 0x4B03000A,
    0xFD03009F, 0xD94A2009, 0x037003F0, 0xF04310FC, 0x10017001, 0x7003F043,
    0x2B000003, 0x0400DFA0, 0x900300F9, 0xDF0189F0, 0x504300FE, 0x301DF0AF,
    0x20AB1043, 0x0001F04A, 0xBBCCBC02, 0x01CBCBBC, 0xBC00CC4F, 0xCCCCCCBB,
    0x02BCDDCB, 0xBCDCCCCB, 0x0B00CBCC, 0xDCBC30BC, 0x1F200400, 0xDCCDBBCB,
    0xDC1F1080, 0xCCBCCDCB, 0xDC02BBCC, 0xBDCCDBCB, 0xBBA501CC, 0xD3E2BB41,
    0xCD11119B, 0xE15F33FE, 0x71F0B311, 0x9FB101B0, 0x03009F9F, 0xDCF1FF00,
    0x9AF1CDDA, 0xF1D900AA, 0xF1AA99AF, 0xFF00FFFC, 0xADCBCFF1, 0x68FFFBF1,
    0x101F14BF, 0x4B00CBDF, 0x00AAAACD, 0xAA9CDCAA, 0x99CDBAAA, 0xACCBAA00,
    0xCBAAA9BA, 0x509B40FF, 0xDCEDDD1F, 0x00DDAACC, 0xCD9DCDCC, 0xBDA9CCCC,
    0xAACCCC00, 0xAABBCCCD, 0xF0CC60BD, 0xF101C07F, 0xF1FDBA9C, 0xBAA9AC00,
    0xACB9ACF1, 0xC9AC10F1, 0xBB0B00CC, 0x80DA9CF1, 0xCCBB0300, 0xEEDB9AF1,
    0x99AF00FF, 0xDDFFFD99, 0xFB00AABD, 0xBABCFFFF, 0x00AAFFFF, 0xBDDBFFAA,
    0xCBBDFFAB, 0xBCDFAC01, 0xAABBCDDD, 0x00806300, 0x9DCBCB6F, 0xDFBCBCBD,
    0x2801CA40, 0x9BCCCCBA, 0xDC26DCCD, 0xBA872099, 0xC071F0BC, 0xED00C97F,
    0xFFE9F1EE, 0x00FC91DF, 0xAA91BBCF, 0xFC91FFBB, 0x139AFF2C, 0xCC1310E3,
    0xDDDE1F00, 0xBB870189, 0x7E00FFFD, 0x9401CFFF, 0xAA03D480, 0xFFBCBCBF,
    0x10BBCBCF, 0x1E00FF1E, 0x17101FE0, 0x118F00CD, 0xC911C0D1, 0xCBCCD021,
    0xCDBCCCBC, 0x0400DB46, 0xF08888CC, 0x0801A001, 0x03F08071, 0x63100380,
    0x10000008, 0x20887E08, 0xB023F003, 0x10274003, 0x883B1033, 0x18AB00AB,
    0x00980340, 0xC7028803, 0x50FA7E90, 0x120150CF, 0x101FC0E7, 0x03408103,
    0x1EC08089, 0x711B4388, 0x3A1B4372, 0x07007721, 0x0B000310, 0x23071061,
    0x760300AB, 0x00DD1710, 0x0730DD13, 0x61540B40, 0x00230710, 0x17107603,
    0x31001B43, 0x411B4433, 0x701BBB44, 0xF07FF5B1, 0x1A5F3601, 0x10DBFFFB,
    0x1022211B, 0xF1776353, 0x00724032, 0xF1273703, 0x12767332, 0x406732F1,
    0x0073770F, 0xF1007213, 0xF1323332, 0x163323DB, 0x0042DBF1, 0x0B103403,
    0xA0340310, 0x10330F30, 0x35F12303, 0xF1072222, 0xA1BBBB24, 0x1FA67F50,
    0x16A57FF0, 0xFF0791DF, 0x3F10BBF1, 0x553F05EF, 0xEF3F05EF, 0x05EF3F03,
    0x3F05EF3F, 0xDC0F0095, 0xEF1F05EF, 0x05AD5F35, 0x03AC5738, 0x5F05ADAB,
    0x205F05AE, 0x5F3F050F, 0xAD3F05AE, 0x3F375FF0, 0x5330FC13, 0x10FB0330,
    0xF01FF10F, 0x103F4001, 0x3610AB2E, 0x10C40350, 0x003FF00F, 0xBF00DC00,
    0xDB00CDCD, 0xBDBCDCEC, 0x00CBCDCC, 0xBDCEBCBB, 0xCBDDBBCB, 0x8704BB44,
    0x03CDBCBB, 0x23DCDD6E, 0xA804CDCC, 0x14CBCBEC, 0x7CC804C1, 0x00AE24BC,
    0x0024001D, 0xDD1F8006, 0xCBDB3CBC, 0x0500FC02, 0x1F009A04, 0xBB06CBCC,
    0xBCBDDCBD, 0x0C000708, 0xBBCC0ADC, 0x3100CDBD, 0xCD0800BE, 0xDC240085,
    0x00CBDBCC, 0x4630CD78, 0x100470EB, 0xDC210006, 0x00CC2505, 0x962E051E,
    0xECBC6D10, 0x00DB1500, 0xEC5F007C, 0x1F20DB7D, 0x1F105100, 0x8B18E103,
    0x6A0300DC, 0x1903009A, 0x0300FCB7, 0xFB0300CF, 0x247D14C0, 0xDCBCDDBB,
    0x00DDB9AA, 0xCAAA99AC, 0xAFFFFFCD, 0xFDCBDB00, 0xFFFFCCBA, 0xBABA3CAB,
    0x1F30B307, 0xF004FA24, 0x9C00B9DA, 0xAABA9AA9, 0x00BAAA9B, 0xBAA9BFFC,
    0xBAA9999A, 0xAC4300AC, 0x409C03C0, 0xCC0B1003, 0xDBAA00A9, 0xAABCB9FF,
    0xDC00C9BA, 0xBBA9ABCC, 0x40DAAAAB, 0xBCA610FB, 0xDEEEDBCC, 0xEEED01DD,
    0xDDDFDDEE, 0x20D5049B, 0x4004B9DF, 0xBDBFFAAD, 0xDFFA00AB, 0xCDFAB9BB,
    0xBC00B99B, 0xCDBA9AAB, 0xE0B9ABCC, 0x00057F40, 0xAA9DEA04, 0x00A9BD9A,
    0xAABDC99A, 0x9ABDAAB9, 0xBDCFFC18, 0x1F208000, 0x00DDCBCB, 0xA99CCDCA,
    0x99AAACDC, 0x04FABD21, 0xBCDFAB87, 0xAD5500AB, 0x16AB5700, 0xBF19CC13,
    0x00DA0300, 0x00CD5503, 0x0300DC03, 0xC90300BD, 0xC9080710, 0x00ADFDDD,
    0xFFFFDCE7, 0xFBCABF00, 0xBC9CADFB, 0xBDAC00FF, 0xBDACCDC9, 0xCA00AAA9,
    0xEDCCBA9D, 0x00AABDFF, 0xBBAAAB9A, 0xBCDCBA9B, 0xBBF50080, 0xBDBFCB9A,
    0x0184CCAD, 0xDDDEED72, 0xCDBE00BC, 0x4300BDE9, 0x100340EA, 0x1003500B,
    0x0300EC0F, 0xBABFFAFF, 0xF01FF0BF, 0xF01FF01F, 0x301FF01F, 0x10001C1F,
    0xF0D1091B, 0x00036003, 0xF0327FF1, 0xFB037003, 0x1603B053, 0x11EB1BFF,
    0x3746F96D, 0x7FF37FF3, 0x0F101F6C, 0x6F07AFB1, 0x55555B04, 0x8104B4A1,
    0x33102444, 0x810424F1, 0xF1233234, 0x32332412, 0x32342F90, 0x00321400,
    0x23233322, 0x32323423, 0x3323321C, 0x1FF01FF0, 0x1BFA1F20, 0xB5555500,
    0x2B22341F, 0xEB0BA01B, 0x1B1F001B, 0x1B223232, 0x23243301, 0x2435F11B,
    0x320CE104, 0x1425F142, 0x357F00E9, 0xF1331422, 0x357F0025, 0x33257F00,
    0x24510080, 0x2233231B, 0x00F0321B, 0x000B2033, 0x333F9037, 0x09454542,
    0x54545423, 0x34450600, 0x23710700, 0x7F810F10, 0x54540D10, 0x59070044,
    0x34260035, 0x1F801D30, 0x7F0034F1, 0x7F003450, 0x447F0024, 0x7CA13234,
    0x01FF00B4, 0x1013110B, 0x237300BB, 0x32331F23, 0x00CD0042, 0x91DF30D4,
    0xFF1FF06F, 0xBF701FE0, 0x0301FB10, 0x13110B11, 0x0722EB24, 0x0C019B20,
    0xB10001AE, 0x1000001F, 0x100019F9, 0x24001B9F, 0x0300F9F1, 0x0B201BB9,
    0x0080F100, 0x019FB913, 0x01FB9F10, 0xB9FB1016, 0x009F2700, 0x9F0B0027,
    0x0330B97F, 0x3B200B00, 0x23201B00, 0x33202B00, 0x004710FF, 0x104B1043,
    0x105B100B, 0x106B2027, 0x7B00C073, 0x1111BFB2, 0x22221223, 0x55342309,
    0x33DFF255, 0xBAAF1023, 0x1022AA0D, 0x011F50DF, 0x7A015472, 0x0790F845,
    0xAB5B5F91, 0x0130C3FC, 0x00EBBBBB, 0xECDCED1B, 0xDDDDDE1B, 0x1E001B5C,
    0x281E401A, 0xE90110FB, 0x1BE900E9, 0x1BEFFFFF, 0xEC00CDCD, 0xECCBCC1B,
    0x00BCBB1B, 0xBCCC1BEB, 0xCCBC1BEC, 0xED0710B0, 0x0B300700, 0x1BEBCBCB,
    0x4700CD54, 0xCD0F00CC, 0xDCBB1F00, 0xBD1F0090, 0xEC6321EC, 0x041B77F9,
    0x1BF9BFAF, 0xF99507FA, 0x19BF05F9, 0x00EAFFF9, 0x0B30C907, 0x0710BB40,
    0xB9F91BF9, 0xF92D1BFB, 0xC90700C9, 0x0F100700, 0x000B10BB, 0x9F921BF9,
    0x9F9311FF, 0x931C9F01, 0x931EAFFF, 0xF9000B00, 0x9F1CBFFF, 0x0F1F9BFA,
    0x1FFD1EC1, 0xBFF05B10, 0x437F0110, 0xF99F5AE0, 0x00833983, 0x1D6C0000,
    0x55AE4D8D, 0x6A5459F0, 0x77DF55CF, 0x3A53496C, 0x4B3A3ED6, 0x5BDE537C,
    0x67FF5FFF, 0x73FF200F, 0x4ED16F37, 0x2FBF212B, 0x19B11A77, 0x7DE211FF,
    0x623876F5, 0x4BEF1303, 0x000055AE, 0x00100010, 0xF0000038, 0x9001F001,
    0x00111101, 0xAFB10000, 0x5BF10000, 0xA1001000, 0x111DF0B5, 0x00FFFF11,
    0x5555FFFF, 0x33335555, 0xF0333320, 0xFA00001F, 0x0000011B, 0x00011FB5,
    0x9401193B, 0x88F11100, 0xD0380380, 0x0442330F, 0x33233423, 0x33060042,
    0x10347423, 0x300F1006, 0x11003311, 0x00F52333, 0x7003F04B, 0xB3AB0003,
    0x303B4700, 0x7D10B8B3, 0x70030010, 0x23A31001, 0x22072222, 0xBBBBBBBB,
    0x0110BB10, 0x39541F90, 0x00F3A300, 0xAF00B947, 0x10F21111, 0xB011F103,
    0x915F1001, 0xBB7300FF, 0xDB0300B8, 0x1F31FFF0, 0xDDDD6F10, 0xE0DD60DD,
    0xFFB2001F, 0xEB00001A, 0xED7300BC, 0x4310BF20, 0x035003F0, 0xDE01DCDD,
    0xDDEDDDCD, 0x4B00DCEC, 0xCDDDED01, 0xECDCDECE, 0xDC000810, 0xCEDCDECD,
    0x7BEDCDED, 0xF04310DD, 0x40037003, 0xCB01EE47, 0x21B0AF00, 0x8F90101B,
    0xEEEE4710, 0xF1E9EEEE, 0x1001301F, 0x0300DE43, 0x1FF11ABB, 0x600110C1,
    0xFFFFFD9F, 0x9F00DFED, 0x9F00DF54, 0xDF9F00EF, 0xEDCF9F00, 0x1F50DD7A,
    0xBFF01311, 0x00DF1F90, 0x00AABD06, 0x1F00BC1F, 0xBC1F00BD, 0x15BD1F00,
    0x00DFDDDD, 0x5F00EF1F, 0xD51600DF, 0x3F005FF0, 0xBD3F00BE, 0xF0BD1F01,
    0x3FF0C73F, 0xBBBD3F30, 0x917FD0BB, 0xC70B115F, 0x5FF01F70, 0x60DBBBBB,
    0x201FF2BF, 0x00F06701, 0xF08F0203, 0x011AF0DA, 0x0D0B01FF, 0x99999999,
    0x01301FF2, 0x4B03000A, 0xFD03009F, 0xD94A2009, 0x037003F0, 0xF04310FC,
    0x10017001, 0x7003F043, 0x2B000003, 0x0400DFA0, 0x900300F9, 0xDF0189F0,
    0x504300FE, 0x301DF0AF, 0x20AB1043, 0x0001F04A, 0xBBCCBC02, 0x01CBCBBC,
    0xBC00CC4F, 0xCCCCCCBB, 0x02BCDDCB, 0xBCDCCCCB, 0x0B00CBCC, 0xDCBC30BC,
    0x1F200400, 0xDCCDBBCB, 0xDC1F1080, 0xCCBCCDCB, 0xDC02BBCC, 0xBDCCDBCB,
    0xBBA501CC, 0xD3E2BB41, 0xCD11119B, 0xE05F33FE, 0x9893B311, 0x110003F0,
    0x049D9FB1, 0x9F9FB19D, 0xDB2811FF, 0xA9AA00AA, 0x9B9ABABA, 0x9B00D9FB,
    0xB9BDFB9E, 0x39CFDBBE, 0x1F14CFCC, 0xE710DF10, 0x0100AAAA, 0xAAAAA900,
    0xA9AA9B9A, 0x9A9F01B9, 0xB99DEB9E, 0x001F60BF, 0xAACCDCED, 0xAACDCCDD,
    0xCCCCCD00, 0xCCCCBDAA, 0xCCCD029A, 0xCCBDC9BB, 0xB0B17F10, 0x10A10300,
    0x007FF06B, 0x00DFBF10, 0xDBFCDFDC, 0xBFDADFDC, 0xC1CFCB00, 0xABAFACFD,
    0x9F990099, 0x9FBBBBBF, 0xAA10AACF, 0x0700DF9F, 0xCFCA9BDC, 0xDADCBB00,
    0xDACFDBEF, 0xABFC00DF, 0xC999CECB, 0xBB00BCBE, 0xAAEBEC9B, 0x929E99AA,
    0xE99FE200, 0xBDEB6B00, 0x01BD2001, 0xCDEBBCBC, 0x00CECBCB, 0xCD9C000F,
    0xCDA9DCDC, 0x10FDCCCB, 0x6073F013, 0x10012003, 0x9FB00267, 0x01B7DF10,
    0xE3D3CC73, 0x109FF100, 0x401FF067, 0xCBCD171F, 0xFC6700BC, 0x1FF04A12,
    0xCD78CB32, 0xD1118F00, 0xD021C911, (u32)&pad_BC3A00 + 0x91cc, 0xDBCDBCCC, 0x88CC0400,
    0x01F0CE88, 0x800801A0, 0x038003F0, 0x2F086310, 0x08100000, 0xF0032088,
    0x4003B023, 0x3310D527, 0x00883B10, 0x034018AB, 0x7F030098, 0x90C70288,
    0x50CF507E, 0xC0E71201, 0x5003101F, 0x89034081, 0x63881EC0, 0x3541511B,
    0x63630300, 0x0066311B, 0x40555003, 0x0B00530F, 0x611B6356, 0x1BDD3605,
    0x03003331, 0x0E030063, 0x611BDD66, 0x13600B00, 0x40610700, 0x33270036,
    0x66611B66, 0xB11B38BB, 0x01F07FF5, 0xFB1A5F36, 0x1BDB08FF, 0x47107771,
    0x01F13353, 0xF1635337, 0x00663337, 0x0B00AA03, 0x36030063, 0x10330300,
    0x00803613, 0xDBF13203, 0xDBF13323, 0x0300425B, 0x100B1034, 0x0F303403,
    0xDB002F00, 0x35F12333, 0x0FF12222, 0xA1BBBB24, 0x1FA67F50, 0xDF167FF0,
    0xFF07914A, 0x3F10BBF1, 0xEF3F05EF, 0xEF3F05AB, 0x05EF2002, 0x3F05EF3F,
    0xDC2A0F00, 0xEF1F05EF, 0x05AD5F35, 0x03AEAC38, 0x5F05ADAB, 0x205F05AE,
    0xAE3F050F, 0xAD3F05BF, 0x3F375FF0, 0x5330FC13, 0x0F100330, 0xF01FF1F7,
    0x103F4001, 0x3610AB2E, 0x0F100350, 0x003FF088, 0xBF00DC00, 0x00DBCDCD,
    0xBDBCDCEC, 0xBBCBCDCC, 0xBDCEBC00, 0xCBDDBBCB, 0x870490BB, 0x6E03BCBB,
    0xCCDCDDBB, 0xA804CD46, 0x14CBCBEC, 0xBCC804C1, 0x00AE24F8, 0x0024001D,
    0xDD1F8006, 0x03BADBBC, 0x0500BC93, 0x1F009A04, 0xDCB403CC, (u32)&pad_BC3A00 + 0x8335,
    0xDC0C0007, 0x00CDAD03, 0x00BE5031, 0x2400CD08, 0xCBDBCCDC, 0xCD7800BD,
    0x04704630, 0x21000610, 0x722505DC, 0x051E00CC, 0xBC6D102E, 0xDB1500EC,
    0x007C00CF, 0x20DBEC5F, 0x1051001F, 0xD5DB071F, 0x07108B18, 0x9B0300AB,
    0x00FC9748, 0x00BD5403, 0xDB64DF03, 0xB9E9039A, 0xA99A00A9, 0x9BB9A9E9,
    0xFB009BEB, 0xDEBCFCCF, 0x54CDFDCB, 0xCD1F40BD, 0x10BA1D00, 0xC09AA903,
    0x23000300, 0xBC9BFB99, 0x9C2AFCA9, 0xFD4740BE, 0x00BA0300, 0x40A09C03,
    0x0750AC0F, 0xCBBDFDCB, 0xBCFC00BC, 0xCAFACDFD, 0xF90099BF, 0xFBBB9999,
    0x10AABBB9, 0x50AAA9FA, 0xBEFDAD07, 0xFDAC00BE, 0xECBABBBD, 0xEC00BEBC,
    0xC9BCEBCB, 0x0AB9CEBE, 0xBA99E99A, 0x10BA1F40, 0x11D5DE7F, 0xADA000A0,
    0x00BDA000, 0xA000FD7C, 0xA000BD5C, 0x95A000DD, 0xAAC2409B, 0x2300A9FB,
    0xBDA000DE, 0x1CEDA000, 0x00AA1306, 0x0380EA03, 0xEC0300E9, 0xAAEE0300,
    0x00BD0300, 0xA000FDA0, 0xADA000BD, 0xCDA000AD, 0x00BD7800, 0xCB075078,
    0xFD55A000, 0x00BFA000, 0xA00099A0, 0x56A000BB, 0xBBA000AA, 0x00AA1F00,
    0xEB43101F, 0x104B40FF, 0x105B1053, 0x10131063, 0xBABFFA07, 0x1FF0FCBF,
    0x1FF01FF0, 0x1FF01FF0, 0x10001F30, 0xED051B71, 0x036003F0, 0xF032F100,
    0x0370FF03, 0x03B053FB, 0xEB1BFF16, 0x1C248711, 0xF3E07FF3, 0x101F8C7F,
    0xFFAFB10F, 0x5B04F1FF, 0xB4A15555, 0x24448104, 0x24F13310, 0x32348104,
    0x2412F123, 0x2F903233, 0x14003234, 0x33220032, 0x34232323, 0x321C3232,
    0x1FF03323, 0x1F201FF0, 0x55001BFA, 0x341FB555, 0xA01B2B22, 0x001BEB0B,
    0x32321B1F, 0x33011B22, 0xF11B2324, 0xE1042435, 0xF142320C, 0x00E91425,
    0x1422357F, 0x0025F133, 0x7F00357F, 0x00803325, 0x231B2451, 0x321B2233,
    0x203300F0, 0x9037000B, 0x4542333F, 0x54230945, 0x06005454, 0x07003445,
    0x0F102371, 0x0D107F81, 0x00445454, 0x00355907, 0x1D303426, 0x34F11F80,
    0x34507F00, 0x00247F00, 0x3234447F, 0x00B47CA1, 0x110B01FF, 0x00BB1013,
    0x1F232373, 0x00423233, 0x30D400CD, 0xF06F91DF, 0x1FE0FF1F, 0xFB10BF70,
    0x0B110301, 0xEB241311, 0x9B200722, 0x01160401, 0x001FB100, 0x19F91000,
    0x1B9F1000, 0xF9F12400, 0x1BB90300, 0xF1000B20, 0xB9130080, 0x9F10019F,
    0x101601FB, 0x2700B9FB, 0x0027009F, 0xB97F9F0B, 0x0B000330, 0x1B003B20,
    0x2B002320, 0x10FF3320, 0x10430047, 0x100B104B, 0x2027105B, 0xC073106B,
    0xBFB27B00, 0x12231111, 0x23092222, 0xF2555534, 0x102333DF, 0xAA0DBAAF,
    0x50DF1022, 0x5472011F, 0xF8457A01, 0x5F910790, 0xC3FCAB5B, 0xBBBB0130,
    0xED1B05EB, 0x041BECDC, 0x1E001B63, 0x1E401A70, 0x0120181D, 0x1BE9E9E9,
    0xEFFFFF00, 0xECCDCD1B, 0xCBCC001B, 0xBCBB1BEC, 0xCC021BEB, 0xBC1BECBC,
    0xED0710CC, 0x300700C1, 0xEBCBCB0B, 0x4700CD1B, 0x0F00CC52, 0xBB1F00CD,
    0xBD1F00DC, 0x6321EC40, 0x1B77F9EC, 0xF910BFAF, 0x9507FA1B, 0x19BFF9F9,
    0xEAFFF915, 0x30C90700, 0x0710BB0B, 0xF91BF900, 0xF91BFBB9, 0x0700B4C9,
    0x100700C9, 0x0B10BB0F, 0x92001BF9, 0x9311FF9F, 0x041C9F9F, 0x1EAFFF93,
    0xF90B0093, 0x1CBF00FF, 0x1F9BFA9F, 0xFD3F1EC1, 0xF05B101F, 0x7F0110BF,
    0xF99F5A43, 0x83398083,
};
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_banim_a_001_5E37CC[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_005_0DF388 + 0x3C, 0x00000003, (u32)&ekrDispUPMain, 0x00000000, 0x00000000,
};
u32 data_085E37E4[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_005_0DF388 + 0x48, 0x00000003, (u32)&EfxHpBar_DeclineToDeath, 0x00000003, (u32)&EfxHpBar_MoveCameraOnEnd,
    0x00000003, (u32)&EfxHpBar_WaitCameraMove, 0x00000000, 0x00000000,
};
u32 data_085E380C[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_005_0DF388 + 0x54, 0x00000003, (u32)&EfxHpBarResire_WaitOnCurrentSide, 0x00000003, (u32)&EfxHpBarResire_SetAnotherSide,
    0x00000003, (u32)&EfxHpBarResire_DeclineToDeath, 0x00000003, (u32)&EfxHpBar_MoveCameraOnEnd, 0x00000003, (u32)&EfxHpBar_WaitCameraMove,
    0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_EfxAvoid[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_005_0DF388 + 0x64)), PROC_REPEAT(EfxAvoidMain), PROC_REPEAT(EfxHpBar_MoveCameraOnEnd), PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};
u32 data_085E386C[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_005_0DF388 + 0x70, 0x00000003, (u32)&EfxHPBarLiveMain, 0x00000003, (u32)&EfxHpBar_MoveCameraOnEnd,
    0x00000003, (u32)&EfxHpBar_WaitCameraMove, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxNoDamage[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_005_0DF388 + 0x80)), PROC_REPEAT(EfxNoDamageMain), PROC_REPEAT(EfxHpBar_MoveCameraOnEnd), PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};
struct ProcCmd ProcScr_efxNoDamageYure[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_005_0DF388 + 0x8C)), PROC_REPEAT(EfxNoDamageYureMain), PROC_END,
};
u32 frontier_df4_banim_a_res0[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    0x00000001, (u32)&gEfxNoDmgBgShakeOff + 0x1C, 0x000A000F, 0x00000000, 0x00000003, (u32)&EfxStatusCHGMain,
    0x00000003, (u32)&EfxHpBar_MoveCameraOnEnd, 0x00000003, (u32)&EfxHpBar_WaitCameraMove, 0x00000000, 0x00000000,
    0x00000001, (u32)&gEfxNoDmgBgShakeOff + 0x2C, 0x00000003, (u32)&efxDeadEvent_Loop_A, 0x00000003, (u32)&efxDeadEvent_Loop_B,
    0x00000003, (u32)&efxDeadEvent_Loop_C, 0x00000003, (u32)&efxDeadEvent_Loop_D, 0x00000003, (u32)&efxDeadEvent_Loop_E,
    0x00000000, 0x00000000, 0x00000001, (u32)&gEfxNoDmgBgShakeOff + 0x3C, 0x00000003, (u32)&efxDead_Loop_A,
    0x00000003, (u32)&efxDead_Loop_B, 0x00000000, 0x00000000, 0x00000001, (u32)&gEfxNoDmgBgShakeOff + 0x44,
    0x00000003, (u32)&EfxDeadPikaMain, 0x00000000, 0x00000000, 0x00000001, (u32)&gEfxNoDmgBgShakeOff + 0x50,
    0x00000003, (u32)&EfxDeadAlphaMain, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxDeadDragonAlpha[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)gEfxNoDmgBgShakeOff + 0x60)), PROC_REPEAT(EfxDeadDragonAlphaMain), PROC_END,
};
u32 frontier_df4_banim_a_res1[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    0x00000001, (u32)&gEfxNoDmgBgShakeOff + 0x74, 0x00000003, (u32)&efxFarAttack_Init, 0x00000003, (u32)&efxFarAttack_ScrollIn,
    0x00000003, (u32)&efxFarAttack_ScrollOut, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxQuakePure[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)gEfxbattle_6 + 0x132)), PROC_REPEAT(efxQuakePure_Loop), PROC_END,
};
u32 frontier_df4_banim_a_res2[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    (u32)&gEfxbattle_0, 0x00000000, (u32)&gEfxQuakeVecs, 0x00000000, (u32)&gEfxbattle_1, 0x00000000,
    (u32)&gEfxQuakeVecs2, 0x00000000, (u32)&gEfxbattle_2, 0x00000000, (u32)&gEfxbattle_3, 0x00000000,
    (u32)&gEfxbattle_4 + 0xB2, 0x00000000, (u32)&gEfxbattle_4 + 0xC4, 0x00000000, (u32)&gEfxbattle_4 + 0xE6, 0x00000000,
    (u32)&gEfxbattle_4 + 0xF8, 0x00000000, (u32)&gEfxbattle_4 + 0x10A, 0x00000000, (u32)&gEfxbattle_4 + 0x11C, 0x00000000,
    (u32)&gEfxbattle_4 + 0x1D2, 0x00000000, (u32)&gEfxbattle_4 + 0x1E4, 0x00000000, (u32)&gEfxbattle_4 + 0x1F6, 0x00000000,
    (u32)&gEfxbattle_4 + 0x208, 0x00000000,
};
struct ProcCmd ProcScr_EfxHitQuakePure[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)gEfxbattle_6 + 0x142)), PROC_REPEAT(nullsub_53), PROC_END,
};
struct ProcCmd ProcScr_efxQuake[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)gEfxbattle_6 + 0x152)), PROC_REPEAT(efxQuake_Loop), PROC_END,
};
struct ProcCmd ProcScr_EfxHitQuake[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)gEfxbattle_6 + 0x15E)), PROC_REPEAT(efxHitQuake_Loop), PROC_END,
};
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
extern const u32 frontier_df4_banim_a_002_5E3AD4 __attribute__((alias("ProcScr_efxWhiteOUT")));
struct ProcCmd ProcScr_efxWhiteOUT[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_006_0DFBEF + 0x1)), PROC_REPEAT(EfxWhiteOutMain1), PROC_REPEAT(EfxWhiteOutMain2), PROC_REPEAT(EfxWhiteOutRestorePalSync),
    PROC_END,
};
struct ProcCmd ProcScr_efxWhiteIN[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_006_0DFBEF + 0xD)), PROC_REPEAT(EfxWhiteInMain1), PROC_REPEAT(EfxWhiteInMain2), PROC_REPEAT(EfxWhiteInRestorePalSync),
    PROC_END,
};
struct ProcCmd ProcScr_efxBlackOUT[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_006_0DFBEF + 0x19)), PROC_REPEAT(EfxBlackOutMain1), PROC_REPEAT(EfxBlackOutMain2), PROC_REPEAT(EfxBlackOutRestorePalSync),
    PROC_END,
};
struct ProcCmd ProcScr_efxBlackIN[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_006_0DFBEF + 0x25)), PROC_REPEAT(EfxBlackInMain1), PROC_REPEAT(EfxBlackInMain2), PROC_REPEAT(EfxBlackInRestorePalSync),
    PROC_END,
};
u32 data_085E3B74[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_006_0DFBEF + 0x31, 0x000A000F, 0x00000000, 0x00000003, (u32)&EfxFlashHPBarDelay,
    0x00000003, (u32)&EfxFlashHPBarMain1, 0x00000003, (u32)&EfxFlashHPBarRestorePal, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxHPBarColorChange[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_006_0DFBEF + 0x41)), PROC_MARK(0xA), PROC_REPEAT(EfxHPBarColorChangeMain), PROC_END,
};
u32 data_085E3BC4[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    0x00000001, (u32)&gFrameLut_EfxHPBarColorChange2 + 0x22, 0x000A000F, 0x00000000, 0x00000003, (u32)&EfxFlashUnitMain,
    0x00000003, (u32)&EfxFlashUnitRestorePal, 0x00000000, 0x00000000,
};
u32 data_085E3BEC[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    0x00000001, (u32)&gFrameLut_EfxHPBarColorChange2 + 0x32, 0x000A000F, 0x00000000, 0x00000003, (u32)&EfxFlashUnitEffectMain,
    0x00000003, (u32)&EfxFlashUnitEffectRestorePal, 0x00000000, 0x00000000,
};
extern const u32 data_085E3C14 __attribute__((alias("ProcScr_efxStatusUnit")));
struct ProcCmd ProcScr_efxStatusUnit[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gFrameLut_EfxHPBarColorChange2 + 0x4A)), PROC_MARK(0xA), PROC_SET_END_CB(EfxStatusUnitEnd), PROC_REPEAT(EfxStatusUnitMain),
    PROC_END,
};
u32 data_085E3C3C[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    0x00000001, (u32)&gFrameLut_EfxStatusUnit + 0x22, 0x000A000F, 0x00000000, 0x00000004, (u32)&efxWeaponIcon_OnEnd,
    0x00000003, (u32)&efxWeaponIcon_Loop, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxSpellCast[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gFrameLut_EfxStatusUnit + 0x5E)), PROC_MARK(0xA), PROC_REPEAT(efxSpellCast_Loop_A), PROC_REPEAT(efxSpellCast_Loop_B),
    PROC_REPEAT(efxSpellCast_Loop_C), PROC_END,
};
u32 frontier_df4_banim_a_res3[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    0x00000001, (u32)&gFrameLut_EfxStatusUnit + 0x6E, 0x000A000F, 0x00000000, 0x00000003, (u32)&sub_8055EB8,
    0x00000003, (u32)&sub_8055F40, 0x00000003, (u32)&sub_8055F90, 0x00000003, (u32)&sub_805601C,
    0x00000003, (u32)&sub_8056078, 0x00000000, 0x00000000, (u32)&frontier_banim_dracozombie_037_794964, (u32)&frontier_banim_dracozombie_038_794D78,
    (u32)&frontier_banim_dracozombie_039_795198, (u32)&frontier_banim_dracozombie_040_7955B8,
};
struct ProcCmd ProcScr_efxSPDQuake[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x12)), PROC_REPEAT(efxSPDQuake_Loop), PROC_REPEAT(efxSPDQuake_Loop2), PROC_END,
};
u32 frontier_df4_banim_a_res4[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    0x00000001, (u32)&gUnk_080DFD46 + 0x1E, 0x00000003, (u32)&ekrBaStart_InitScreen, 0x00000003, (u32)&ekrBaStart_SreenFailIn,
    0x00000003, (u32)&ekrBaStart_InitBattleScreen, 0x00000003, (u32)&ekrBaStart_ExecEkrBattle6C, 0x00000003, (u32)&ekrBaStart_0,
    0x00000003, (u32)&ekrBaStart_1, 0x00000003, (u32)&ekrBaStart_2, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_ekrBattleEnding[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x32)), PROC_REPEAT(ekrBattleEnding_0), PROC_REPEAT(ekrBattleEnding_1), PROC_REPEAT(ekrBattleEnding_2),
    PROC_REPEAT(ekrBattleEnding_3), PROC_REPEAT(ekrBattleEnding_4), PROC_REPEAT(ekrBattleEnding_5), PROC_REPEAT(ekrBattleEnding_6),
    PROC_REPEAT(ekrBattleEnding_7), PROC_END,
};
struct ProcCmd ProcScr_EkrBaseKaiten[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x42)), PROC_REPEAT(EkrBaseKaitenMain), PROC_END,
};
u32 frontier_df4_banim_a_res5[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    (u32)&Img_ConstDataDB034_1, 0x00000000, (u32)&Img_ConstDataDB034_1, 0x00000000, (u32)&Img_ConstDataDB034_0, 0x00000000,
    (u32)&Img_ConstDataDB034_1, 0x00000000, (u32)&Img_ConstDataDB034_2, (u32)&Img_ConstDataDB034_3, (u32)&Img_ConstDataDB034_3, (u32)&Img_ConstDataDB034_3,
    (u32)&Img_ConstDataDB034_4, (u32)&Img_ConstDataDB034_3, (u32)&Img_ConstDataDB034_3, (u32)&Img_ConstDataDB034_3, (u32)&AnimScr_EkrBaseKaiten3, 0x00000000,
    (u32)&AnimScr_EkrBaseKaiten4, 0x00000000, (u32)&AnimScr_EkrBaseKaiten1, 0x00000000, (u32)&AnimScr_EkrBaseKaiten5, 0x00000000,
    (u32)&AnimScr_EkrBaseKaiten10, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x48, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x48, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x48, (u32)&frontier_df4_banim_a_009_5FF000 + 0x24, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x6C,
    (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x6C, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x6C, (u32)&AnimScr_EkrBaseKaiten9, (u32)&frontier_df4_banim_a_008_5FE7D8, (u32)&frontier_df4_banim_a_008_5FE7D8, (u32)&frontier_df4_banim_a_008_5FE7D8,
    (u32)&frontier_df4_banim_a_009_5FF000, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x24, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x24, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x24, (u32)&AnimScr_EkrBaseKaiten6, 0x00000000,
    (u32)&AnimScr_EkrBaseKaiten7, 0x00000000, (u32)&AnimScr_EkrBaseKaiten2, 0x00000000, (u32)&AnimScr_EkrBaseKaiten8, 0x00000000,
    (u32)&AnimScr_EkrBaseKaiten12, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xD8, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xD8, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xD8, (u32)&frontier_df4_banim_a_009_5FF000 + 0x6C, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xFC,
    (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xFC, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xFC, (u32)&AnimScr_EkrBaseKaiten11, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x90, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x90, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x90,
    (u32)&frontier_df4_banim_a_009_5FF000 + 0x48, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xB4, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xB4, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0xB4, (u32)&gUnk_080DFD46 + 0x60, 0x00000000,
    (u32)&gUnk_080DFD46 + 0x70, 0x00000000, (u32)&gUnk_080DFD46 + 0x50, 0x00000000, (u32)&gUnk_080DFD46 + 0x80, 0x00000000,
    (u32)&gUnk_080DFD46 + 0xA0, (u32)&gUnk_080DFD46 + 0xD0, (u32)&gUnk_080DFD46 + 0xD0, (u32)&gUnk_080DFD46 + 0xD0, (u32)&gUnk_080DFD46 + 0x100, (u32)&gUnk_080DFD46 + 0xE0,
    (u32)&gUnk_080DFD46 + 0xE0, (u32)&gUnk_080DFD46 + 0xE0, (u32)&gUnk_080DFD46 + 0x90, (u32)&gUnk_080DFD46 + 0xB0, (u32)&gUnk_080DFD46 + 0xB0, (u32)&gUnk_080DFD46 + 0xB0,
    (u32)&gUnk_080DFD46 + 0xF0, (u32)&gUnk_080DFD46 + 0xC0, (u32)&gUnk_080DFD46 + 0xC0, (u32)&gUnk_080DFD46 + 0xC0,
};
struct ProcCmd ProcScr_ekrUnitKakudai[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x112)), PROC_REPEAT(UnitKakudaiPrepareAnimScript), PROC_REPEAT(UnitKakudaiMain), PROC_REPEAT(UnitKakudaiEndNop),
    PROC_END,
};
struct ProcCmd ProcScr_ekrWindowAppear[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x122)), PROC_REPEAT(EkrWindowAppearMain), PROC_END,
};
struct ProcCmd ProcScr_ekrNamewinAppear[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x132)), PROC_REPEAT(EkrNamewinAppearDelay), PROC_REPEAT(EkrNamewinAppearMain), PROC_END,
};
struct ProcCmd ProcScr_ekrBaseAppear[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x146)), PROC_REPEAT(EkrBaseAppearMain), PROC_END,
};
u32 frontier_df4_banim_a_res6[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    0x86000001, 0x00000000, 0x000057F0, 0x80000000, (u32)&TsaConf_BanimTmA1, (u32)&TsaConf_BanimTmA2,
    (u32)&TsaConf_BanimTmA3, (u32)&TsaConf_BanimTmA4, (u32)&TsaConf_BanimTmA3, (u32)&TsaConf_BanimTmA4, (u32)&TsaConf_BanimTmA3, (u32)&TsaConf_BanimTmA4,
    (u32)&TsaConf_BanimTmA1, (u32)&TsaConf_BanimTmA2, 0x00000001, (u32)&BanimLeftDefaultPos + 0xC, 0x00000003, (u32)&EkrChienCHRMain,
    0x00000000, 0x00000000, 0x00000001, (u32)&BanimLeftDefaultPos + 0x18, 0x00000003, (u32)&ExecAllAIS,
    0x00000000, 0x00000000, 0x00000001, (u32)&BanimLeftDefaultPos + 0x28, 0x00000003, (u32)&EkrUnitMainMiniMain,
    0x00000000, 0x00000000, 0x00000001, (u32)&BanimEkrTogiProcNames, 0x00000003, (u32)&ekrTogiInit_Init,
    0x00000003, (u32)&ekrTogiInit_LoadGfx, 0x00000003, (u32)&ekrTogiInit_Loop, 0x00000003, (u32)&ekrTogiInit_End,
    0x00000000, 0x00000000, 0x00000001, (u32)&BanimEkrTogiProcNames + 0x10, 0x00000003, (u32)&ekrTogiEnd_Init,
    0x00000003, (u32)&ekrTogiEnd_Loop, 0x00000003, (u32)&ekrTogiEnd_End, 0x00000000, 0x00000000,
    0x00000001, (u32)&BanimEkrTogiProcNames + 0x20, 0x00000003, (u32)&ekrTogiColor_Loop, 0x00000000, 0x00000000,
    (u32)&Pal_ArenaBattleBg_A, (u32)&Pal_ArenaBattleBg_B, (u32)&Pal_ArenaBattleBg_C,
};
u8 frontier_df4_banim_a_003_5E4570[] __attribute__((section(".data.frontier_df4_banim_a.gap3"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_003_5E4570.4bpp.lz");
u8 frontier_df4_banim_a_004_5E4E84[] __attribute__((section(".data.frontier_df4_banim_a.gap4"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_004_5E4E84.4bpp.lz");
u8 frontier_df4_banim_a_005_5EA510[] __attribute__((section(".data.frontier_df4_banim_a.gap5"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_005_5EA510.4bpp.lz");
u8 frontier_df4_banim_a_006_5EBF04[] __attribute__((section(".data.frontier_df4_banim_a.gap6"))) = INCBIN_U8("graphics/frontier_df4_banim_a/frontier_df4_banim_a_006_5EBF04.4bpp.lz");
struct AnimSpriteData frontier_df4_banim_a_007_5F1C3C[] __attribute__((section(".data.frontier_df4_banim_a.gap7"))) =
{
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -17 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -18 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -17 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -18 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -17 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -17 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -16 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -17 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -18 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -17 } } },
    ANIM_SPRITE_END,
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0000, -40, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0001, -32, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0002, -16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, -8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0004, 0, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0003, 8, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0005, 16, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0006, 24, -16 } } },
    { .header = (u32)(0x8000) | ((u32)(0x0000) << 16), .as = { .object = { 0x0007, 32, -16 } } },
    ANIM_SPRITE_END,
};
/* frontier_df4_banim_a_008_5FE7D8: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_banim_a_008_5FE7D8[] __attribute__((section(".data.frontier_df4_banim_a.gap8"))) = {
    (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_49 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_73 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_50 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_51 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_52 + 0x1,
    (u32)&AnimSprite_EkrBaseKaiten_53 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_54 + 0x1, 0x80000000, (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_55 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_74 + 0x2,
    (u32)&AnimSprite_EkrBaseKaiten_56 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_57 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_58 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_59 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_60 + 0x1, 0x80000000,
    (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_61 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_75 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_62 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_63 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_64 + 0x1,
    (u32)&AnimSprite_EkrBaseKaiten_65 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_66 + 0x1, 0x80000000, (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_67 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_76 + 0x2,
    (u32)&AnimSprite_EkrBaseKaiten_68 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_69 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_70 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_71 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_72 + 0x1, 0x80000000,
    (u32)&AnimSprite_EkrBaseKaiten_54 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_53 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_52 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_51 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_50 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_73 + 0x2,
    (u32)&AnimSprite_EkrBaseKaiten_49 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, 0x80000000, (u32)&AnimSprite_EkrBaseKaiten_60 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_59 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_58 + 0x1,
    (u32)&AnimSprite_EkrBaseKaiten_57 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_56 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_74 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_55 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, 0x80000000,
    (u32)&AnimSprite_EkrBaseKaiten_66 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_65 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_64 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_63 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_62 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_75 + 0x2,
    (u32)&AnimSprite_EkrBaseKaiten_61 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, 0x80000000, (u32)&AnimSprite_EkrBaseKaiten_72 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_71 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_70 + 0x1,
    (u32)&AnimSprite_EkrBaseKaiten_69 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_68 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_76 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_67 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_48 + 0x2, 0x80000000,
    0x40000000, 0xFFF80000, 0x0000FFF8, 0x00000001, 0x00000000, 0x00000000,
    0x70000000, 0x00000002, 0x00000000, 0x70000000, 0xFFF00004, 0x0000FFF0,
    0x70000000, 0x00000006, 0x0000FFF0, 0x70000000, 0xFFF00008, 0x00000000,
    0x00000001, 0x00000000, 0x00000000, 0x40000000, 0xFFF80000, 0x00000004,
    0x40000000, 0xFFF80000, 0x0000FFF4, 0x00008000, 0x0008000A, 0x0000FFF4,
    0x00008000, 0x0008000A, 0x00000004, 0x10008000, 0xFFF0000A, 0x0000FFF4,
    0x10008000, 0xFFF0000A, 0x00000004, 0x00004000, 0xFFF80000, 0x0000FFEC,
    0x00000000, 0x0008002A, 0x0000FFEC, 0x10000000, 0xFFF0002A, 0x0000FFEC,
    0x00000001, 0x00000000, 0x00000000, 0x90004000, 0x00000043, 0x0000FFF0,
    0x10008000, 0xFFF80047, 0x0000FFF0, 0x10000000, 0xFFF00068, 0x0000FFF8,
    0x90004000, 0xFFF00043, 0x00000000, 0x10008000, 0xFFE80047, 0x00000000,
    0x10000000, 0xFFE00068, 0x00000008, 0x10004000, 0xFFE80060, 0x00000010,
    0x10000000, 0xFFE00062, 0x00000010, 0x10000000, 0xFFF80064, 0x00000010,
    0x10000000, 0x0018001F, 0x0000FFE8, 0x10004000, 0x00080040, 0x0000FFE8,
    0x10000000, 0x00000042, 0x0000FFE8, 0x10000000, 0x00200018, 0x0000FFE8,
    0x00000001, 0x00000000, 0x00000000,
};
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_banim_a_009_5FF000[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x122, (u32)&AnimSprite_EkrBaseKaiten_88 + 0x2, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x13A, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x175, (u32)&AnimSprite_EkrBaseKaiten_89 + 0x1, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x1ED,
    (u32)&AnimSprite_EkrBaseKaiten_81 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_82 + 0x1, 0x80000000, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x122, (u32)&AnimSprite_EkrBaseKaiten_88 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_83 + 0x2,
    (u32)&AnimSprite_EkrBaseKaiten_84 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_90 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_85 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_86 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_87 + 0x1, 0x80000000,
    (u32)&AnimSprite_EkrBaseKaiten_82 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_81 + 0x1, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x1ED, (u32)&AnimSprite_EkrBaseKaiten_89 + 0x1, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x175, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x13A,
    (u32)&AnimSprite_EkrBaseKaiten_88 + 0x2, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x122, 0x80000000, (u32)&AnimSprite_EkrBaseKaiten_87 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_86 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_85 + 0x1,
    (u32)&AnimSprite_EkrBaseKaiten_90 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_84 + 0x1, (u32)&AnimSprite_EkrBaseKaiten_83 + 0x2, (u32)&AnimSprite_EkrBaseKaiten_88 + 0x2, (u32)&frontier_df4_banim_a_008_5FE7D8 + 0x122, 0x80000000,
    (u32)&StartSpellAnimDummy, (u32)&StartSpellAnimHandAxe, (u32)&StartSpellAnimBindingBlade, (u32)&StartSpellAnimJavelin, (u32)&StartSpellAnimJavelinCavalier, (u32)&StartSpellAnimJavelinSoldier,
    (u32)&StartSpellAnimJavelinPaladin, (u32)&StartSpellAnimJavelinPegasusKnight, (u32)&StartSpellAnimJavelinFalcon, (u32)&StartSpellAnimJavelinWyvernRider, (u32)&StartSpellAnimJavelinWyvernLord, (u32)&StartSpellAnimJavelinGenerial,
    (u32)&StartSpellAnimJavelinUnk, (u32)&StartSpellAnimJavelinPaladinF, (u32)&StartSpellAnimSong, (u32)&StartSpellAnimDance, (u32)&StartSpellAnimBallista, (u32)&StartSpellAnimSilence,
    (u32)&sub_805DFC8, (u32)&StartSpellAnimArrow, (u32)&sub_805E488, (u32)&sub_805E5D0, (u32)&StartSpellAnimFire, (u32)&StartSpellAnimElfire,
    (u32)&nullsub_55, (u32)&StartSpellAnimThunder, (u32)&StartSpellAnimLightning, (u32)&sub_805F1E4, (u32)&StartSpellAnimAircalibur, (u32)&StartSpellAnimFlux,
    (u32)&StartSpellAnimFimbulvetr, (u32)&StartSpellAnimBolting, (u32)&StartSpellAnimPurge, (u32)&nullsub_56, (u32)&sub_8060F84, (u32)&nullsub_57,
    (u32)&StartSpellAnimEclipse, (u32)&StartSpellAnimNosferatu, (u32)&StartSpellAnimHeal, (u32)&StartSpellAnimMend, (u32)&StartSpellAnimRecover, (u32)&StartSpellAnimPhysic,
    (u32)&StartSpellAnimFortify, (u32)&StartSpellAnimLatona, (u32)&StartSpellAnimRestore, (u32)&sub_80634E0, (u32)&StartSpellAnimFenrir, (u32)&StartSpellAnimShine,
    (u32)&sub_8063D14, (u32)&sub_8064314, 0x00000000, (u32)&StartSpellAnimSleep, (u32)&StartSpellAnimHammerne, (u32)&StartSpellAnimBerserk,
    (u32)&StartSpellAnimBarrier, (u32)&StartSpellAnimLuna, (u32)&StartSpellAnimExcalibur, (u32)&StartSpellAnimIvaldi, (u32)&StartSpellAnimFillasMight, (u32)&StartSpellAnimThorsIre,
    (u32)&StartSpellAnimNinisGrace, (u32)&StartSpellAnimSetsLitany, (u32)&StartSpellAnimStone, (u32)&StartSpellAnimAura, (u32)&StartSpellAnimDemonLight, (u32)&StartSpellAnimDarkBreath,
    (u32)&StartSpellAnimShadowshot, (u32)&StartSpellAnimEvilEye, (u32)&StartSpellAnimDemonSurge, (u32)&StartSpellAnimCrimsonEye, (u32)&StartSpellAnimNaglfar, (u32)&StartSpellAnimFireBreath,
    0x00000000, 0x00000001, 0x00000000, 0x00000000,
};
u32 data_085FF1C0[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    (u32)&gEkrSpellAnimLut + 0x125, 0x80000000,
};
struct ProcCmd ProcScr_efxRestRST[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME(frontier_df4_misc_lo_007_0E1870), PROC_SET_END_CB(efxBerserkCLONE_OnEnd), PROC_REPEAT(efxRestRSTMain), PROC_END,
};
struct ProcCmd ProcScr_efxTwobaiRST[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xC)), PROC_REPEAT(EfxTwobaiRSTMain), PROC_END,
};
struct ProcCmd ProcScr_DummvRST[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x1C)), PROC_SET_END_CB(efxRestRST_OnEnd), PROC_REPEAT(DummvRSTMain), PROC_END,
};
struct ProcCmd ProcScr_EfxRestWIN[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x28)), PROC_REPEAT(EfxRestWINMain), PROC_END,
};
u32 data_085FF238[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x34, 0x00000003, (u32)&EfxRestWINH_Wait, 0x00000003, (u32)&EfxRestWINHMain,
    0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxALPHA[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x40)), PROC_REPEAT(EfxALPHAMain), PROC_END,
};
u32 data_085FF270[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x4C, 0x00000003, (u32)&EfxCircleWINMain, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x5C, 0x00000003, (u32)&Loop6C_efxMagicQUAKE, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxDummymagic[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x6C)), PROC_REPEAT(EfxDummymagicMain), PROC_END,
};
struct ProcCmd ProcScr_efxTeono[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x7C)), PROC_REPEAT(EfxTeonoMain), PROC_END,
};
struct ProcCmd ProcScr_efxTeonoOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x88)), PROC_REPEAT(EfxTeonoObjMain), PROC_REPEAT(EfxTeonoObjEnd), PROC_END,
};
struct ProcCmd ProcScr_efxTeonoOBJ2[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x94)), PROC_REPEAT(EfxTeonoObj2Main), PROC_END,
};
u32 data_085FF308[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xA4, 0x00000004, (u32)&DummvRST_OnEnd, 0x00000003, (u32)&EfxTeonoSeMain,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xB0, 0x00000003, (u32)&efxHurtmut_Loop_Main,
    0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxArrowOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xBC)), PROC_REPEAT(EfxArrowObjMain), PROC_END,
};
struct ProcCmd ProcScr_efxTeyari[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xC8)), PROC_REPEAT(EfxTeyariMain), PROC_END,
};
struct ProcCmd ProcScr_efxTeyariOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xD4)), PROC_REPEAT(EfxTeyariObjMain), PROC_END,
};
struct ProcCmd ProcScr_efxSong[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xE4)), PROC_REPEAT(efxSong_Loop_Main), PROC_END,
};
struct ProcCmd ProcScr_efxSongBG[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xEC)), PROC_REPEAT(efxSongBG_Loop), PROC_END,
};
u32 frontier_df4_banim_a_res7[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    (u32)&Tsa_Song, (u32)&Tsa_SongBg_0, (u32)&Tsa_SongBg_1, (u32)&Tsa_SongBg_2, (u32)&Tsa_SongBg_3, (u32)&Tsa_SongBg_4,
    (u32)&Tsa_SongBg_5, (u32)&Tsa_SongBg_6, (u32)&Tsa_SongBg_7, (u32)&Tsa_SongBg_8, (u32)&Tsa_SongBg_9, (u32)&Tsa_SongBg_10,
    (u32)&Tsa_SongBg_11, (u32)&Tsa_SongBg_12, (u32)&Tsa_SongBg_13, (u32)&Tsa_SongBg_14, (u32)&Tsa_SongBg_15, (u32)&Tsa_SongBg_16,
    (u32)&Tsa_SongBg_17, (u32)&Tsa_SongBg_18, (u32)&Tsa_SongBg_19, (u32)&Tsa_SongBg_20, (u32)&Tsa_SongBg_21, (u32)&Tsa_SongBg_22,
    (u32)&Tsa_SongBg_23, (u32)&Tsa_SongBg_24, (u32)&Tsa_SongBg_25, (u32)&Img_SongBg_0, (u32)&Img_SongBg_0, (u32)&Img_SongBg_0,
    (u32)&Img_SongBg_0, (u32)&Img_SongBg_0, (u32)&Img_SongBg_0, (u32)&Img_SongBg_0, (u32)&Img_SongBg_0, (u32)&Img_SongBg_0,
    (u32)&Img_SongBg_0, (u32)&Img_SongBg_1, (u32)&Img_SongBg_1, (u32)&Img_SongBg_1, (u32)&Img_SongBg_1, (u32)&Img_SongBg_1,
    (u32)&Img_SongBg_2, (u32)&Img_SongBg_2, (u32)&Img_SongBg_2, (u32)&Img_SongBg_2, (u32)&Img_SongBg_2, (u32)&Img_SongBg_2,
    (u32)&Img_SongBg_2, (u32)&Img_SongBg_3, (u32)&Img_SongBg_3, (u32)&Img_SongBg_3, (u32)&Img_SongBg_3, (u32)&Img_SongBg_3,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x164, 0x00000003, (u32)&efxSongOBJ_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x170, 0x00000003, (u32)&efxDance_Loop_Main, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxShooter[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x17C)), PROC_REPEAT(efxShooter_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res8[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x188, 0x00000003, (u32)&efxShooterOBJ_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x198, 0x00000003, (u32)&sub_805DC9C, 0x00000000, 0x00000000,
};
u32 data_085FF508[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x1A8, 0x00000003, (u32)&sub_805DDF8, 0x00000000, 0x00000000,
};
u32 data_085FF520[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x1B8, 0x00000003, (u32)&sub_805DE74, 0x00000000, 0x00000000,
};
u32 data_085FF538[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x1C8, 0x000A000F, 0x00000000, 0x00000003, (u32)&efxDarkbreathBGCOL_Loop,
    0x00000000, 0x00000000,
};
u32 data_085FF558[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x1FC, 0x00000003, (u32)&sub_805E004, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x208, 0x00000003, (u32)&sub_805E130, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxArrow[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x218)), PROC_REPEAT(efxFirebreath_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res9[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x228, 0x00000003, (u32)&efxFirebreathOBJ_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x23C, 0x00000003, (u32)&efxFirebreathBG_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x24C, 0x000A000F, 0x00000000, 0x00000003, (u32)&efxFirebreathBGCOL_Loop,
    0x00000000, 0x00000000,
};
u32 data_085FF5F0[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&Frames_efxFirebreathBGCOL + 0xDC, 0x00000003, (u32)&efxIcebreath_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&Frames_efxFirebreathBGCOL + 0xEC, 0x00000004, (u32)&efxIcebreathOBJ_OnEnd, 0x0034000E, 0x00000000,
    0x00000000, 0x00000000,
};
u32 data_085FF628[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&Frames_efxFirebreathBGCOL + 0xFC, 0x00000003, (u32)&efxDarkbreath_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&Frames_efxFirebreathBGCOL + 0x10C, 0x00000003, (u32)&efxMshieldBG_Loop, 0x00000000, 0x00000000,
    (u32)&Tsa_DarkBreathBg_0, (u32)&Tsa_DarkBreathBg_1, (u32)&Tsa_DarkBreathBg_2, (u32)&Tsa_DarkBreathBg_3, (u32)&Tsa_DarkBreathBg_4, (u32)&Tsa_DarkBreathBg_5,
    (u32)&Tsa_DarkBreathBg_6, (u32)&Tsa_DarkBreathBg_7, (u32)&Tsa_DarkBreathBg_8, (u32)&Tsa_DarkBreathBg_9, (u32)&Tsa_DarkBreathBg_10, (u32)&Tsa_DarkBreathBg_11,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x3C4, 0x000A000F, 0x00000000, 0x00000003, (u32)&sub_805E780,
    0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxDarkbreathOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x47C)), PROC_REPEAT(efxDarkbreathOBJ_Loop), PROC_END,
};
u32 frontier_df4_banim_a_res10[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x490, 0x00000003, (u32)&Loop6C_efxThunder, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxThunderBG[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x49C)), PROC_REPEAT(EfxThunderBGMain), PROC_END,
};
u32 frontier_df4_banim_a_res11[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    (u32)&Tsa_EfxThuderBg1, (u32)&Tsa_EfxThuderBg2, (u32)&Tsa_EfxThuderBg1, (u32)&Tsa_EfxThuderBg2,
};
struct ProcCmd ProcScr_efxThunderBGCOL[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x4B4)), PROC_MARK(0xA), PROC_REPEAT(EfxThunderBGCOL_Loop), PROC_END,
};
struct ProcCmd ProcScr_efxThunderOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x508)), PROC_REPEAT(EfxThunderOBJMain), PROC_END,
};
struct ProcCmd ProcScr_efxFire[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x518)), PROC_REPEAT(Loop6C_efxFire), PROC_END,
};
struct ProcCmd ProcScr_efxFireBG[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x520)), PROC_REPEAT(Loop6C_efxFireBG), PROC_END,
};
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
extern const u32 frontier_df4_banim_a_010_5FF7C8 __attribute__((alias("ProcScr_efxFireOBJ")));
struct ProcCmd ProcScr_efxFireOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x55C)), PROC_REPEAT(EfxFireOBJ_Loop), PROC_END,
};
struct ProcCmd ProcScr_efxFireHITBG[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x568)), PROC_REPEAT(EfxFireHitBG_Loop), PROC_END,
};
u32 frontier_df4_banim_a_res12[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    (u32)&Img_Banim_0, (u32)&Img_Banim_0, (u32)&Img_Banim_0, (u32)&Img_Banim_0, (u32)&Img_Banim_0, (u32)&Img_Banim_0,
    (u32)&Img_AnimaHitBG_0, (u32)&Img_AnimaHitBG_0, (u32)&Img_AnimaHitBG_0, (u32)&Img_AnimaHitBG_1, (u32)&Img_AnimaHitBG_1, (u32)&Img_AnimaHitBG_2,
    (u32)&Img_AnimaHitBG_2, (u32)&Img_AnimaHitBG_3, (u32)&Img_AnimaHitBG_3, (u32)&Img_AnimaHitBG_4, (u32)&Img_AnimaHitBG_5, (u32)&Img_AnimaHitBG_6,
    (u32)&Img_AnimaHitBG_7, (u32)&Img_AnimaHitBG_8, (u32)&Img_AnimaHitBG_9, (u32)&frontier_df4_banim_b_015_62DC84, (u32)&frontier_df4_banim_b_015b_62DD30, (u32)&frontier_df4_banim_b_015c_62DDE8,
    (u32)&frontier_df4_banim_b_015d_62DEB4, (u32)&Tsa_AnimaHitBG_3, (u32)&Tsa_AnimaHitBG_4, (u32)&Tsa_AnimaHitBG_5, (u32)&Tsa_AnimaHitBG_6, (u32)&Tsa_AnimaHitBG_7,
    (u32)&Tsa_AnimaHitBG_8, (u32)&Tsa_AnimaHitBG_9, (u32)&Tsa_AnimaHitBG_10, (u32)&Tsa_AnimaHitBG_11, (u32)&Tsa_AnimaHitBG_12, (u32)&Tsa_AnimaHitBG_13,
    (u32)&frontier_df4_banim_b_016_62EDD8, (u32)&frontier_df4_banim_b_016b_62EF78, (u32)&frontier_df4_banim_b_016c_62F118, (u32)&frontier_df4_banim_b_016d_62F2B8, (u32)&frontier_df4_banim_b_016e_62F458, (u32)&Tsa_AnimaHitBG_19,
};
struct ProcCmd ProcScr_efxElfireBG[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0x56)), PROC_REPEAT(EfxElfireBG_Loop), PROC_END,
};
struct ProcCmd ProcScr_efxElfireBGCOL[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0x62)), PROC_MARK(0xA), PROC_REPEAT(EfxElfireBGCOL_Loop), PROC_END,
};
struct ProcCmd ProcScr_efxElfireOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0xCA)), PROC_REPEAT(EfxElfireObj_Loop), PROC_END,
};
u32 data_085FF8F0[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    0x00000001, (u32)&FrameConfig_AnimaHitBG + 0xDA, 0x00000003, (u32)&efxFimbulvetr_Loop_Main, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxFimbulvetrBGTR[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0xEA)), PROC_REPEAT(efxHammarneBG_Loop), PROC_END,
};
u32 frontier_df4_banim_a_res13[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    (u32)&Tsa_FimbulvetrBg_Tornado_A, (u32)&Tsa_FimbulvetrBg_Tornado_B, (u32)&Tsa_FimbulvetrBg_Tornado_C, (u32)&Tsa_FimbulvetrBg_Tornado_D, (u32)&Tsa_FimbulvetrBg_Tornado_E, (u32)&Tsa_FimbulvetrBg_Tornado_F,
    (u32)&Img_FimbulvetrBg_Tornado_A, (u32)&Img_FimbulvetrBg_Tornado_B, (u32)&Img_FimbulvetrBg_Tornado_C, (u32)&Img_FimbulvetrBg_Tornado_D, (u32)&Img_FimbulvetrBg_Tornado_E, (u32)&Img_FimbulvetrBg_Tornado_F,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x6E0, 0x00000003, (u32)&efxFimbulvetrBG_Loop, 0x00000000, 0x00000000,
    (u32)&frontier_df4_banim_b_017_63CDD4, (u32)&frontier_df4_banim_b_017b_63CE78, (u32)&frontier_df4_banim_b_017c_63CF20, (u32)&Tsa_FimbulvetrBg_D, (u32)&Tsa_FimbulvetrBg_E, (u32)&Tsa_FimbulvetrBg_F,
    (u32)&Tsa_FimbulvetrBg_G, (u32)&Tsa_FimbulvetrBg_H, (u32)&Tsa_FimbulvetrBg_I, (u32)&frontier_df4_banim_b_018_63D868, (u32)&frontier_df4_banim_b_018b_63DA88, (u32)&Img_FimbulvetrBg_A,
    (u32)&Img_FimbulvetrBg_A, (u32)&Img_FimbulvetrBg_A, (u32)&Img_FimbulvetrBg_A, (u32)&Img_FimbulvetrBg_A, (u32)&Img_FimbulvetrBg_A, (u32)&Img_FimbulvetrBg_B,
    (u32)&Img_FimbulvetrBg_B, (u32)&Img_FimbulvetrBg_C, (u32)&Img_FimbulvetrBg_D, (u32)&Img_FimbulvetrBg_D, 0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x720,
    0x00000003, (u32)&efxFimbulvetrOBJ_Loop, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x734,
    0x00000003, (u32)&efxFimbulvetrOBJ2_Loop, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x748,
    0x00000003, (u32)&efxFimbulvetrOBJ2Fall_Loop, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxLightning[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x760)), PROC_REPEAT(efxThunderstorm_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res14[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x770, 0x00000003, (u32)&efxThunderstormBG_Loop, 0x00000000, 0x00000000,
    (u32)&Img_BoltingBg_A, (u32)&Img_BoltingBg_A, (u32)&Img_BoltingBg_A, (u32)&Img_BoltingBg_A, (u32)&Img_BoltingBg_B, (u32)&Img_BoltingBg_B,
    (u32)&Img_BoltingBg_B, (u32)&Img_BoltingBg_B, (u32)&Img_BoltingBg_B, (u32)&Img_BoltingBg_B, (u32)&Img_BoltingBg_C, (u32)&Tsa_BoltingBg_A,
    (u32)&Tsa_BoltingBg_B, (u32)&Tsa_BoltingBg_C, (u32)&Tsa_BoltingBg_D, (u32)&Tsa_BoltingBg_E, (u32)&Tsa_BoltingBg_F, (u32)&Tsa_BoltingBg_G,
    (u32)&Tsa_BoltingBg_H, (u32)&Tsa_BoltingBg_I, (u32)&Lz77Tsa_BoltingBg_08636008, (u32)&Tsa_BoltingBg_K, 0x00000001, (u32)&Frames_efxThunderstormBG + 0x46,
    0x00000003, (u32)&efxThunderstormOBJ_Loop, 0x0064000E, 0x00000000, 0x00000003, (u32)&efxThunderstormOBJ_End,
    0x00000000, 0x00000000, 0x00000001, (u32)&Frames_efxThunderstormBG + 0x5A, 0x005E000E, 0x00000000,
    0x00000003, (u32)&efxThunderstormColor_Loop_A, 0x0003000E, 0x00000000, 0x00000003, (u32)&efxThunderstormColor_Loop_B,
    0x0014000E, 0x00000000, 0x00000003, (u32)&efxThunderstormColor_Loop_C, 0x00000000, 0x00000000,
    0x00000001, (u32)&Frames_efxThunderstormBG + 0x72, 0x00000003, (u32)&efxThunderstormDark_Loop_A, 0x00000003, (u32)&efxThunderstormDark_Loop_B,
    0x00000000, 0x00000000,
};
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
extern const u32 frontier_df4_banim_a_011_5FFBA0 __attribute__((alias("gProcScr_efxMistyrainBG")));
struct ProcCmd gProcScr_efxMistyrainBG[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x888)), PROC_REPEAT(efxMistyRainBg_Loop), PROC_END,
};
u32 frontier_df4_banim_a_res15[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    (u32)&Tsa_Flux_ClassReel_0, (u32)&Tsa_Flux_ClassReel_1, (u32)&Tsa_Flux_ClassReel_2, (u32)&Tsa_Flux_ClassReel_3, (u32)&Tsa_Flux_ClassReel_4, (u32)&Tsa_Flux_ClassReel_5,
    (u32)&Tsa_Flux_ClassReel_6, (u32)&Tsa_Flux_ClassReel_7, (u32)&Tsa_Flux_ClassReel_8, (u32)&Tsa_Flux_ClassReel_9, (u32)&Tsa_Flux_ClassReel_10, (u32)&Tsa_Flux_ClassReel_11,
    (u32)&frontier_df3_banim_mid_008_657A78, (u32)&frontier_df3_banim_mid_008b_657B20, (u32)&frontier_df3_banim_mid_008c_657BDC, (u32)&frontier_df3_banim_mid_008d_657CB4, (u32)&frontier_df3_banim_mid_008e_657D94, (u32)&Tsa_Flux_ClassReel_17,
    (u32)&Tsa_Flux_ClassReel_18, (u32)&Tsa_Flux_ClassReel_19, (u32)&Tsa_Flux_ClassReel_20, (u32)&Tsa_Flux_ClassReel_21, (u32)&Tsa_Flux_ClassReel_22, (u32)&Tsa_Flux_ClassReel_23,
    (u32)&Tsa_Flux_ClassReel_24, (u32)&Tsa_Flux_ClassReel_25, (u32)&Tsa_Flux_ClassReel_26, (u32)&Tsa_Flux_ClassReel_27, (u32)&frontier_df3_banim_mid_009_6587E0, (u32)&frontier_df3_banim_mid_009b_658880,
    (u32)&frontier_df3_banim_mid_009c_658934, (u32)&frontier_df3_banim_mid_009d_6589F0, (u32)&frontier_df3_banim_mid_009e_658ACC, (u32)&frontier_df3_banim_mid_009f_658BB4, (u32)&frontier_df3_banim_mid_009g_658CD8, (u32)&frontier_df3_banim_mid_009h_658DF8,
    (u32)&frontier_df3_banim_mid_009i_658F04, (u32)&frontier_df3_banim_mid_009j_659010, (u32)&frontier_df3_banim_mid_009k_65910C, (u32)&frontier_df3_banim_mid_009l_65920C, (u32)&frontier_df3_banim_mid_009m_659308, (u32)&AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8,
    (u32)&AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, (u32)&AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, (u32)&Img_Flux_ClassReel_0, (u32)&Img_Flux_ClassReel_0, (u32)&Img_Flux_ClassReel_0, (u32)&frontier_df3_banim_mid_006_654DFC,
    (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&Img_Flux_ClassReel_2,
    (u32)&Img_Flux_ClassReel_2, (u32)&Img_Flux_ClassReel_2, (u32)&Img_Flux_ClassReel_2, (u32)&Img_Flux_ClassReel_2, (u32)&Img_Flux_ClassReel_2, (u32)&Img_Flux_ClassReel_3,
    (u32)&Img_Flux_ClassReel_3, (u32)&Img_Flux_ClassReel_3, (u32)&Img_Flux_ClassReel_3, (u32)&Img_Flux_ClassReel_4, (u32)&Img_Flux_ClassReel_4, (u32)&Img_Flux_ClassReel_4,
    (u32)&Img_Flux_ClassReel_4, (u32)&Img_Flux_ClassReel_4, (u32)&Img_Flux_ClassReel_4, (u32)&Img_Flux_ClassReel_4, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC,
    (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&frontier_df3_banim_mid_006_654DFC, (u32)&Img_Flux_ClassReel_0, (u32)&Img_Flux_ClassReel_0,
    (u32)&Img_Flux_ClassReel_0, (u32)&AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, (u32)&AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, (u32)&AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8,
};
struct ProcCmd ProcScr_efxMistyrainOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x940)), PROC_SET_END_CB(efxMistyRainObj_OnEnd), PROC_REPEAT(efxMistyRainObj_0), PROC_SLEEP(0x20),
    PROC_REPEAT(efxMistyRainObj_1), PROC_SLEEP(0xB), PROC_REPEAT(efxMistyRainObj_2), PROC_SLEEP(0x16),
    PROC_END,
};
struct ProcCmd gProcScr_efxMistyrainOBJ2[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x950)), PROC_SET_END_CB(efxMistyRainObj_OnEnd), PROC_REPEAT(efxMistyRainObj2_0), PROC_SLEEP(0xE),
    PROC_REPEAT(efxMistyRainObj2_1), PROC_END,
};
struct ProcCmd ProcScr_efxFimbulvetr[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x964)), PROC_REPEAT(efxResire_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res16[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x970, 0x00000003, (u32)&efxResireBG_Loop_A, 0x00000003, (u32)&efxResireBG_Loop_B,
    0x00000003, (u32)&efxResireBG_Loop_C, 0x00000003, (u32)&efxResireBG_Loop_D, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0x97C, 0x00000003, (u32)&efxResireBG2_Loop, 0x00000000, 0x00000000,
    (u32)&AnimScr_EfxMistyRainObj3 + 0x2C, (u32)&AnimScr_EfxMistyRainObj3 + 0x2C, (u32)&AnimScr_EfxMistyRainObj3 + 0x2C, (u32)&AnimScr_EfxMistyRainObj3 + 0x2C, (u32)&AnimScr_EfxMistyRainObj3 + 0x2C, (u32)&AnimScr_EfxMistyRainObj3 + 0x2C,
    (u32)&AnimScr_EfxMistyRainObj3 + 0x2C, (u32)&AnimScr_EfxMistyRainObj3 + 0x2C, (u32)&Img_NosferatuBg_B, (u32)&Img_NosferatuBg_B, (u32)&Img_NosferatuBg_B, (u32)&Img_NosferatuBg_C,
    (u32)&Img_NosferatuBg_C, (u32)&Img_NosferatuBg_D, (u32)&Img_NosferatuBg_D, (u32)&Img_NosferatuBg_E, (u32)&Img_NosferatuBg_E, (u32)&Img_NosferatuBg_F,
    (u32)&Img_NosferatuBg_F, (u32)&Img_NosferatuBg_F, (u32)&Img_NosferatuBg_G, (u32)&Img_NosferatuBg_G, (u32)&Img_NosferatuBg_G, (u32)&Img_NosferatuBg_H,
    (u32)&Img_NosferatuBg_H, (u32)&Img_NosferatuBg_H, (u32)&Img_NosferatuBg_H, (u32)&Img_NosferatuBg_H, (u32)&Img_NosferatuBg_I, (u32)&Img_NosferatuBg_I,
    (u32)&Img_NosferatuBg_I, (u32)&Img_NosferatuBg_I, (u32)&Img_NosferatuBg_I, (u32)&Img_NosferatuBg_I, (u32)&Img_NosferatuBg_I, (u32)&Img_NosferatuBg_I,
    (u32)&Img_NosferatuBg_J, (u32)&Img_NosferatuBg_J, (u32)&Img_NosferatuBg_J, (u32)&Img_NosferatuBg_J, (u32)&Img_NosferatuBg_K, (u32)&Img_NosferatuBg_K,
    (u32)&Img_NosferatuBg_K, (u32)&Img_NosferatuBg_L, (u32)&Img_NosferatuBg_L, (u32)&Img_NosferatuBg_L, (u32)&Img_NosferatuBg_M, (u32)&Img_NosferatuBg_M,
    (u32)&Img_NosferatuBg_M, (u32)&Img_NosferatuBg_M, (u32)&Img_NosferatuBg_M, (u32)&Tsa_NosferatuBg_0, (u32)&frontier_df4_banim_b_021_663368, (u32)&frontier_df4_banim_b_021b_663414,
    (u32)&frontier_df4_banim_b_021c_6634C4, (u32)&frontier_df4_banim_b_021d_66357C, (u32)&frontier_df4_banim_b_021e_66363C, (u32)&frontier_df4_banim_b_021f_663708, (u32)&frontier_df4_banim_b_021g_6637E8, (u32)&Tsa_NosferatuBg_8,
    (u32)&Tsa_NosferatuBg_9, (u32)&Tsa_NosferatuBg_10, (u32)&Tsa_NosferatuBg_11, (u32)&Tsa_NosferatuBg_12, (u32)&Tsa_NosferatuBg_13, (u32)&Tsa_NosferatuBg_14,
    (u32)&Tsa_NosferatuBg_15, (u32)&Tsa_NosferatuBg_16, (u32)&Tsa_NosferatuBg_17, (u32)&Tsa_NosferatuBg_18, (u32)&Tsa_NosferatuBg_19, (u32)&Tsa_NosferatuBg_20,
    (u32)&Tsa_NosferatuBg_21, (u32)&Tsa_NosferatuBg_22, (u32)&Tsa_NosferatuBg_23, (u32)&Tsa_NosferatuBg_24, (u32)&Tsa_NosferatuBg_25, (u32)&Tsa_NosferatuBg_26,
    (u32)&Tsa_NosferatuBg_27, (u32)&Tsa_NosferatuBg_28, (u32)&Tsa_NosferatuBg_29, (u32)&Tsa_NosferatuBg_30, (u32)&Tsa_NosferatuBg_31, (u32)&Tsa_NosferatuBg_32,
    (u32)&Tsa_NosferatuBg_33, (u32)&Tsa_NosferatuBg_34, (u32)&Tsa_NosferatuBg_35, (u32)&Tsa_NosferatuBg_36, (u32)&Tsa_NosferatuBg_37, (u32)&Tsa_NosferatuBg_38,
    (u32)&Tsa_NosferatuBg_39, (u32)&Tsa_NosferatuBg_40, (u32)&Tsa_NosferatuBg_41, (u32)&Tsa_NosferatuBg_42, (u32)&Tsa_NosferatuBg_43, (u32)&Tsa_NosferatuBg_44,
    (u32)&Tsa_NosferatuBg_45, (u32)&Tsa_NosferatuBg_46, (u32)&frontier_df4_banim_b_022_665FB0, (u32)&frontier_df4_banim_b_022b_66608C, (u32)&frontier_df4_banim_b_022c_666158, (u32)&frontier_df4_banim_b_022d_666210,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xA5C, 0x00000003, (u32)&efxResireRST_Loop, 0x00000000, 0x00000000,
};
struct ProcCmd gProcScr_efxThunderstorm[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xA6C)), PROC_REPEAT(efxLightning_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res17[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xA7C, 0x00000003, (u32)&efxLightningBG_Loop, 0x00000000, 0x00000000,
    (u32)&Img_Banim_1, (u32)&Img_Banim_1, (u32)&Img_Banim_1, (u32)&Img_Banim_2, (u32)&Img_Banim_2, (u32)&Img_Banim_2,
    (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_4, (u32)&Img_Banim_4,
    (u32)&Img_Banim_4, (u32)&Img_Banim_5, (u32)&Img_Banim_5, (u32)&Img_Banim_5, (u32)&Img_Light_0, (u32)&Img_Light_0,
    (u32)&Img_Light_0, (u32)&Img_Light_0, (u32)&Img_Light_0, (u32)&Img_Light_0, (u32)&Img_Light_0, (u32)&Img_Light_0,
    (u32)&Img_Light_0, (u32)&Img_Light_1, (u32)&Img_Light_1, (u32)&Img_Light_1, (u32)&Img_Light_2, (u32)&Img_Light_2,
    (u32)&Img_Light_2, (u32)&Img_Light_2, (u32)&Img_Light_2, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Light, (u32)&Pal_Light,
    (u32)&Pal_Light, (u32)&Pal_Light, (u32)&Pal_Light, (u32)&Pal_Light, (u32)&Pal_Light, (u32)&Pal_Light,
    (u32)&Tsa_Light_0, (u32)&Tsa_Light_1, (u32)&frontier_df4_banim_b_019_64C610, (u32)&frontier_df4_banim_b_019b_64C71C, (u32)&Tsa_Light_4, (u32)&Tsa_Light_5,
    (u32)&Tsa_Light_6, (u32)&Tsa_Light_7, (u32)&Tsa_Light_8, (u32)&Tsa_Light_9, (u32)&Tsa_Light_10, (u32)&Tsa_Light_11,
    (u32)&Tsa_Light_12, (u32)&Tsa_Light_13, (u32)&Tsa_Light_14, (u32)&frontier_df3_banim_mid_000_64D2B4, (u32)&frontier_df3_banim_mid_000b_64D3C8, (u32)&frontier_df3_banim_mid_000c_64D478,
    (u32)&frontier_df3_banim_mid_000d_64D580, (u32)&frontier_df3_banim_mid_000e_64D6BC, (u32)&frontier_df3_banim_mid_000f_64D830, (u32)&frontier_df3_banim_mid_000g_64D9C8, (u32)&frontier_df3_banim_mid_000h_64DB3C, (u32)&frontier_df3_banim_mid_000i_64DC48,
    (u32)&frontier_df3_banim_mid_000j_64DD1C, (u32)&Tsa_Light_25, (u32)&Tsa_Light_26, (u32)&Tsa_Light_27, (u32)&Tsa_Light_28, (u32)&Tsa_Light_29,
    (u32)&Tsa_Light_30, (u32)&Tsa_Light_31, (u32)&Tsa_Light_32, 0x00000001, (u32)&Frames_efxLightningBG + 0x88, 0x00000003,
    (u32)&efxPurge_Loop_Main, 0x00000000, 0x00000000, 0x00000001, (u32)&Frames_efxLightningBG + 0x94, 0x00000003,
    (u32)&efxPurgeBG_Loop, 0x00000000, 0x00000000, (u32)&Img_Banim_1, (u32)&Img_Banim_1, (u32)&Img_Banim_1,
    (u32)&Img_Banim_2, (u32)&Img_Banim_2, (u32)&Img_Banim_2, (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_3,
    (u32)&Img_Banim_3, (u32)&Img_Banim_4, (u32)&Img_Banim_4, (u32)&Img_Banim_4, (u32)&Img_Banim_5, (u32)&Img_Banim_5,
    (u32)&Img_Banim_5, (u32)&Img_Banim_1, (u32)&Img_Banim_1, (u32)&Img_Banim_1, (u32)&Img_Banim_2, (u32)&Img_Banim_2,
    (u32)&Img_Banim_2, (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_4,
    (u32)&Img_Banim_4, (u32)&Img_Banim_4, (u32)&Img_Banim_5, (u32)&Img_Banim_5, (u32)&Img_Banim_5, (u32)&Img_Banim_1,
    (u32)&Img_Banim_1, (u32)&Img_Banim_1, (u32)&Img_Banim_2, (u32)&Img_Banim_2, (u32)&Img_Banim_2, (u32)&Img_Banim_3,
    (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_3, (u32)&Img_Banim_4, (u32)&Img_Banim_4, (u32)&Img_Banim_4,
    (u32)&Img_Banim_5, (u32)&Img_Banim_5, (u32)&Img_Banim_5, (u32)&Img_Banim_7, (u32)&Img_Banim_7, (u32)&Img_PurgeBg_0,
    (u32)&Img_PurgeBg_0, (u32)&Img_PurgeBg_1, (u32)&Img_PurgeBg_1, (u32)&Img_PurgeBg_2, (u32)&Img_PurgeBg_2, (u32)&Img_PurgeBg_3,
    (u32)&Img_PurgeBg_3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    (u32)&Img_PurgeBg_4, (u32)&Img_PurgeBg_5, (u32)&Img_PurgeBg_6, (u32)&Img_PurgeBg_7, (u32)&Img_PurgeBg_8, (u32)&Img_PurgeBg_9,
    (u32)&Img_PurgeBg_9, (u32)&Img_PurgeBg_10, (u32)&Img_PurgeBg_10, (u32)&Img_PurgeBg_11, (u32)&Img_PurgeBg_12, (u32)&Img_PurgeBg_13,
    (u32)&Img_PurgeBg_14, (u32)&Img_PurgeBg_15, (u32)&Img_PurgeBg_16, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0,
    (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_0, (u32)&Pal_Banim_3, (u32)&Pal_Banim_3, (u32)&Pal_Banim_3,
    (u32)&Pal_Banim_3, (u32)&Pal_Banim_3, (u32)&Pal_Banim_3, (u32)&Pal_Banim_3, (u32)&Pal_Banim_3, (u32)&Pal_Banim_3,
    (u32)&Pal_Banim_3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg,
    (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg,
    (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Pal_PurgeBg, (u32)&Tsa_PurgeBg_0, (u32)&Tsa_PurgeBg_1, (u32)&Tsa_PurgeBg_2,
    (u32)&Tsa_PurgeBg_3, (u32)&Tsa_PurgeBg_4, (u32)&Tsa_PurgeBg_5, (u32)&Tsa_PurgeBg_6, (u32)&Tsa_PurgeBg_7, (u32)&Tsa_PurgeBg_8,
    (u32)&Tsa_PurgeBg_9, (u32)&Tsa_PurgeBg_10, (u32)&Tsa_PurgeBg_11, (u32)&Tsa_PurgeBg_12, (u32)&Tsa_PurgeBg_13, (u32)&Tsa_PurgeBg_14,
    (u32)&Tsa_PurgeBg_15, (u32)&Tsa_PurgeBg_16, (u32)&Tsa_PurgeBg_17, (u32)&Tsa_PurgeBg_18, (u32)&Tsa_PurgeBg_19, (u32)&Tsa_PurgeBg_20,
    (u32)&Tsa_PurgeBg_21, (u32)&Tsa_PurgeBg_22, (u32)&Tsa_PurgeBg_23, (u32)&Tsa_PurgeBg_24, (u32)&Tsa_PurgeBg_25, (u32)&Tsa_PurgeBg_26,
    (u32)&Tsa_PurgeBg_27, (u32)&Tsa_PurgeBg_28, (u32)&Tsa_PurgeBg_29, (u32)&Tsa_PurgeBg_30, (u32)&Tsa_PurgeBg_31, (u32)&frontier_df4_banim_b_028_69697C,
    (u32)&frontier_df4_banim_b_028b_696AA0, (u32)&frontier_df4_banim_b_028c_696BC0, (u32)&frontier_df4_banim_b_028d_696CCC, (u32)&frontier_df4_banim_b_028e_696DC8, (u32)&frontier_df4_banim_b_028f_696EB0, (u32)&frontier_df4_banim_b_028g_696F98,
    (u32)&frontier_df4_banim_b_028h_697078, (u32)&frontier_df4_banim_b_028i_697154, (u32)&frontier_df4_banim_b_028j_697234, (u32)&frontier_df4_banim_b_028k_697328, (u32)&frontier_df4_banim_b_028l_69741C, (u32)&frontier_df4_banim_b_028m_697520,
    (u32)&frontier_df4_banim_b_028n_697628, (u32)&frontier_df4_banim_b_028o_697740, (u32)&frontier_df4_banim_b_028p_697864, (u32)&Tsa_PurgeBg_48, (u32)&Tsa_PurgeBg_49, (u32)&Tsa_PurgeBg_50,
    (u32)&Tsa_PurgeBg_51, (u32)&Tsa_PurgeBg_52, (u32)&Tsa_PurgeBg_53, (u32)&Tsa_PurgeBg_54, (u32)&Tsa_PurgeBg_55, (u32)&Tsa_PurgeBg_56,
    (u32)&Tsa_PurgeBg_57, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    (u32)&Tsa_PurgeBg_58, (u32)&Tsa_PurgeBg_59, (u32)&Tsa_PurgeBg_60, (u32)&Tsa_PurgeBg_61, (u32)&Tsa_PurgeBg_62, (u32)&Tsa_PurgeBg_63,
    (u32)&Tsa_PurgeBg_64, (u32)&Tsa_PurgeBg_65, (u32)&Tsa_PurgeBg_66, (u32)&Tsa_PurgeBg_67, (u32)&Tsa_PurgeBg_68, (u32)&Tsa_PurgeBg_69,
    (u32)&Tsa_PurgeBg_70, (u32)&Tsa_PurgeBg_71, (u32)&Tsa_PurgeBg_72, 0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xCA4, 0x00000003,
    (u32)&efxPurgeOBJRND_Loop, 0x0045000E, 0x00000000, 0x00000000, 0x00000000, 0x000000D0,
    0x00000030, 0x000000A0, 0x00000090, 0x00000040, 0x00000040, 0x000000C0,
    0x00000060, 0x00000080, 0x00000030, 0x00000020, 0x00000060, 0x00000050,
    0x00000080, 0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xCB4, 0x00000004, (u32)&efxMshieldBGOBJ_OnEnd, 0x0045000E,
    0x00000000, 0x00000000, 0x00000000,
};
u32 data_08600594[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xCC0, 0x00000003, (u32)&efxDivine_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xCCC, 0x00000003, (u32)&efxDivineBG_Loop, 0x00000000, 0x00000000,
    (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg,
    (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg,
    (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&Img_DivineBg,
    (u32)&Img_DivineBg, (u32)&Img_DivineBg, (u32)&frontier_df4_banim_b_023_6719A8, (u32)&frontier_df4_banim_b_023b_671A48, (u32)&frontier_df4_banim_b_023c_671AF0, (u32)&frontier_df4_banim_b_023d_671B98,
    (u32)&frontier_df4_banim_b_023e_671C48, (u32)&frontier_df4_banim_b_023f_671D00, (u32)&frontier_df4_banim_b_023g_671DCC, (u32)&frontier_df4_banim_b_023h_671E98, (u32)&frontier_df4_banim_b_023i_671F6C, (u32)&frontier_df4_banim_b_023j_672044,
    (u32)&frontier_df4_banim_b_023k_672120, (u32)&Tsa_DivineBg_12, (u32)&Tsa_DivineBg_13, (u32)&Tsa_DivineBg_14, (u32)&Tsa_DivineBg_15, (u32)&Tsa_DivineBg_16,
    (u32)&Tsa_DivineBg_17, (u32)&Tsa_DivineBg_18, (u32)&Tsa_DivineBg_19, (u32)&Tsa_DivineBg_20, (u32)&Img_DivineBg, (u32)&Img_DivineBg,
    (u32)&Img_DivineBg, (u32)&Tsa_DivineBg2_0, (u32)&Tsa_DivineBg2_1, (u32)&Tsa_DivineBg2_2, (u32)&Img_DivineBg3_0, (u32)&Img_DivineBg3_0,
    (u32)&Img_DivineBg3_1, (u32)&Img_DivineBg3_2, (u32)&Img_DivineBg3_3, (u32)&Img_DivineBg3_4, (u32)&Img_DivineBg3_5, (u32)&Img_DivineBg3_6,
    (u32)&Img_DivineBg3_7, (u32)&Img_DivineBg3_8, (u32)&Img_DivineBg3_9, (u32)&Img_DivineBg3_10, (u32)&Img_DivineBg3_11, (u32)&Img_DivineBg3_12,
    (u32)&Img_DivineBg3_13, (u32)&Img_DivineBg3_14, (u32)&Img_DivineBg3_15, (u32)&Img_DivineBg3_16, (u32)&Img_DivineBg3_16, (u32)&Img_DivineBg3_17,
    (u32)&Img_DivineBg3_17, (u32)&Tsa_DivineBg_0, (u32)&Tsa_DivineBg3_0, (u32)&Tsa_DivineBg3_1, (u32)&Tsa_DivineBg3_2, (u32)&Tsa_DivineBg3_3,
    (u32)&Tsa_DivineBg3_4, (u32)&Tsa_DivineBg3_5, (u32)&Tsa_DivineBg3_6, (u32)&Tsa_DivineBg3_7, (u32)&Tsa_DivineBg3_8, (u32)&Tsa_DivineBg3_9,
    (u32)&Tsa_DivineBg3_10, (u32)&Tsa_DivineBg3_11, (u32)&Tsa_DivineBg3_12, (u32)&Tsa_DivineBg3_13, (u32)&Tsa_DivineBg3_14, (u32)&Tsa_DivineBg3_15,
    (u32)&Tsa_DivineBg3_16, (u32)&Tsa_DivineBg3_17, (u32)&Tsa_DivineBg3_18, (u32)&Tsa_DivineBg3_19, 0x00000001, (u32)&frontier_df4_misc_lo_007_0E1870 + 0xDAC,
    0x00000003, (u32)&efxDivineOBJ_Loop, 0x00000000, 0x00000000,
};
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_banim_a_012_600754[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638, 0x00000003, (u32)&sub_806166C, 0x00000000, 0x00000000,
    (u32)&Tsa_EclipseBg_A, (u32)&Tsa_EclipseBg_B, (u32)&Tsa_EclipseBg_C, (u32)&Tsa_EclipseBg_D, (u32)&Tsa_EclipseBg_E, (u32)&Tsa_EclipseBg_F,
    (u32)&Tsa_EclipseBg_G, (u32)&Tsa_EclipseBg_H, (u32)&Tsa_EclipseBg_I, (u32)&Tsa_EclipseBg_J, (u32)&Tsa_EclipseBg_K, (u32)&Tsa_EclipseBg_L,
    (u32)&Tsa_EclipseBg_M, (u32)&Tsa_EclipseBg_N, (u32)&Tsa_EclipseBg_O, (u32)&Tsa_EclipseBg_P, (u32)&Tsa_EclipseBg_Q, (u32)&Tsa_EclipseBg_R,
    (u32)&Tsa_EclipseBg_S, (u32)&Tsa_EclipseBg_T, (u32)&Tsa_EclipseBg_U, (u32)&Tsa_EclipseBg_V, (u32)&Tsa_EclipseBg_W, (u32)&Tsa_EclipseBg_X,
    (u32)&Tsa_EclipseBg_Y, (u32)&Tsa_EclipseBg_Z, (u32)&Tsa_EclipseBg_AA, (u32)&Img_EclipseBg_A, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B,
    (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B,
    (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_B, (u32)&Img_EclipseBg_C,
    (u32)&Img_EclipseBg_C, (u32)&Img_EclipseBg_C, (u32)&Img_EclipseBg_D, (u32)&Img_EclipseBg_E, (u32)&Img_EclipseBg_F, (u32)&Img_EclipseBg_G,
    (u32)&Img_EclipseBg_H, (u32)&Img_EclipseBg_I, (u32)&Img_EclipseBg_J, (u32)&Img_EclipseBg_K, (u32)&Img_EclipseBg_L, (u32)&Img_EclipseBg_M,
    0x00000001, (u32)&Frames_efxHazymoonBG_C + 0x36, 0x00000004, (u32)&efxHazymoonOBJ2_OnEnd, 0x00000003, (u32)&efxHazymoonOBJ2_Loop_C,
    0x00000003, (u32)&efxHazymoonOBJ2_Loop_A, 0x00000003, (u32)&efxHazymoonOBJ2_Loop_B, 0x00000003, (u32)&efxHazymoonOBJ2_Loop_C,
    0x00000003, (u32)&efxHazymoonOBJ2_Loop_A, 0x00000003, (u32)&efxHazymoonOBJ2_Loop_B, 0x00000000, 0x00000000,
    0x00000001, (u32)&Frames_efxHazymoonBG_C + 0x46, 0x00000003, (u32)&efxHazymoonOBJ3_Loop, 0x00000000, 0x00000000,
    0x00380060, 0x00680030, 0x004000A0, 0x00880058, 0x008800A0, 0x006000C0,
};
struct ProcCmd ProcScr_efxHazymoonOBJ3RND[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)Frames_efxHazymoonBG_C + 0x56)), PROC_SET_END_CB(efxHazymoonOBJ3RND_OnEnd), PROC_SLEEP(0x2C), PROC_END,
};
struct ProcCmd ProcScr_efxResire[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)Frames_efxHazymoonBG_C + 0x6A)), PROC_REPEAT(efxFenrir_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res18[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&Frames_efxHazymoonBG_C + 0x76, 0x00000004, (u32)&efxFenrirBG_OnEnd, 0x00000003, (u32)&efxFenrirBG_Loop,
    0x00000000, 0x00000000, 0x00000001, (u32)&Frames_efxHazymoonBG_C + 0x82, 0x000A000F, 0x00000000,
    0x00000004, (u32)&EfxTeonoSeCallBack, 0x00000003, (u32)&efxLunaBGCOL_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x188, 0x00000003, (u32)&efxFenrirOBJ_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x198, 0x00000003, (u32)&efxFenrirBG2_Loop, 0x00000000, 0x00000000,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520, (u32)&frontier_df4_banim_b_025_67F520,
    (u32)&Img_FenrirBg_1, (u32)&Img_FenrirBg_2, (u32)&Img_FenrirBg_3, (u32)&Tsa_Banim_13, (u32)&Tsa_FenrirBg_0, (u32)&Tsa_FenrirBg_1,
    (u32)&Tsa_FenrirBg_2, (u32)&Tsa_FenrirBg_3, (u32)&Tsa_FenrirBg_4, (u32)&Tsa_FenrirBg_5, (u32)&Tsa_FenrirBg_6, (u32)&Tsa_FenrirBg_7,
    (u32)&frontier_df4_banim_b_026_683C80, (u32)&frontier_df4_banim_b_026b_683D84, (u32)&frontier_df4_banim_b_026c_683E88, (u32)&frontier_df4_banim_b_026d_683F8C, (u32)&frontier_df4_banim_b_026e_6840CC, (u32)&frontier_df4_banim_b_026f_684210,
    (u32)&frontier_df4_banim_b_026g_684354, (u32)&frontier_df4_banim_b_026h_684498, (u32)&frontier_df4_banim_b_026i_6845DC, (u32)&frontier_df4_banim_b_026j_684720, (u32)&frontier_df4_banim_b_026k_6848A0, (u32)&frontier_df4_banim_b_026l_684A24,
    (u32)&frontier_df4_banim_b_026m_684BA8, (u32)&frontier_df4_banim_b_026n_684D08, (u32)&frontier_df4_banim_b_026o_684E68, (u32)&frontier_df4_banim_b_026p_684FC8, (u32)&frontier_df4_banim_b_026q_68516C, (u32)&frontier_df4_banim_b_026r_685310,
    (u32)&frontier_df4_banim_b_026s_6854B4, (u32)&frontier_df4_banim_b_026t_685624, (u32)&frontier_df4_banim_b_026u_685794, (u32)&frontier_df4_banim_b_026v_685904, (u32)&frontier_df4_banim_b_026w_685AA8, (u32)&frontier_df4_banim_b_026x_685C4C,
    (u32)&frontier_df4_banim_b_026y_685DF0, (u32)&frontier_df4_banim_b_026z_685F64, (u32)&frontier_df4_banim_b_026aa_6860D8, (u32)&frontier_df4_banim_b_026ab_68624C, (u32)&frontier_df4_banim_b_026ac_6863FC, (u32)&frontier_df4_banim_b_026ad_6865AC,
    (u32)&frontier_df4_banim_b_026ae_68675C, (u32)&frontier_df4_banim_b_026af_6868D0, (u32)&frontier_df4_banim_b_026ag_686A44, (u32)&Tsa_FenrirBg_41, (u32)&Tsa_FenrirBg_42, (u32)&Tsa_FenrirBg_43,
    (u32)&frontier_df4_banim_b_027_6870D4, (u32)&frontier_df4_banim_b_027b_68724C, (u32)&frontier_df4_banim_b_027c_6873C4, (u32)&Tsa_FenrirBg_47, (u32)&Tsa_FenrirBg_48, (u32)&Tsa_FenrirBg_49,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x2A8, 0x00000003, (u32)&efxFenrirOBJ2_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x2B8, 0x00000003, (u32)&efxFenrirOBJ2Chiri_Loop, 0x00000000, 0x00000000,
    0x000000B8, 0x00000055, 0x00000042, 0x00000077, 0x0000009E, 0x00000027,
    0x00000087, 0x000000D2,
};
struct ProcCmd ProcScr_efxLive[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0x2CC)), PROC_REPEAT(efxLive_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res19[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x2D4, 0x00000003, (u32)&efxRelive_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x2E0, 0x00000003, (u32)&efxRecover_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x2EC, 0x00000003, (u32)&efxReblow_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x2F8, 0x00000003, (u32)&efxLiveBG_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&gEfxmagicHealstaves_3 + 0x8, 0x000A000F, 0x00000000, 0x00000003, (u32)&efxLiveBGCOL_Loop,
    0x00000000, 0x00000000, 0x00000001, (u32)&gEfxmagicHealstaves_7 + 0x44, 0x00000003, (u32)&efxLiveALPHA_Loop_A,
    0x00000003, (u32)&efxLiveALPHA_Loop_B, 0x00000000, 0x00000000, 0x00000001, (u32)&gEfxmagicHealstaves_7 + 0x54,
    0x00000003, (u32)&efxLiveOBJ_Loop, 0x00000000, 0x00000000, 0x00000001, (u32)&gEfxmagicHealstaves_7 + 0x60,
    0x00000003, (u32)&efxReserveOBJ_Loop_A, 0x00000003, (u32)&efxReserveOBJ_Loop_B, 0x00000000, 0x00000000,
    0x00000001, (u32)&gEfxmagicHealstaves_7 + 0x70, 0x00000003, (u32)&efxReblowOBJ_Loop_A, 0x00000003, (u32)&sub_8062CE4,
    0x00000000, 0x00000000, 0x00000001, (u32)&gEfxmagicHealstaves_7 + 0x80, 0x00000003, (u32)&efxReserve_Loop_Main,
    0x00000000, 0x00000000, 0x00000001, (u32)&gEfxmagicHealstaves_7 + 0x8C, 0x00000003, (u32)&efxReserveBG_Loop,
    0x00000000, 0x00000000, (u32)&Tsa_Banim_14, (u32)&Tsa_Fortify_0, (u32)&Tsa_Fortify_1, (u32)&Tsa_Fortify_2,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x49C, 0x000A000F, 0x00000000, 0x00000003, (u32)&efxReserveBGCOL_Loop,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x5B0, 0x00000003, (u32)&efxReserveBG2_Loop,
    0x00000000, 0x00000000, (u32)&Tsa_FortifyBg2, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x5C4, 0x000A000F,
    0x00000000, 0x00000003, (u32)&efxReserveBGCOL2_Loop, 0x00000000, 0x00000000, 0x00000001,
    (u32)&frontier_df4_misc_lo_008_0E2638 + 0x6B4, 0x00000003, (u32)&efxRest_Loop_Main, 0x00000000, 0x00000000, 0x00000001,
    (u32)&frontier_df4_misc_lo_008_0E2638 + 0x6BC, 0x00000003, (u32)&efxRestBG_Loop, 0x00000000, 0x00000000, (u32)&frontier_df4_banim_b_033_6A819C,
    (u32)&frontier_df4_banim_b_033b_6A8248, (u32)&frontier_df4_banim_b_033c_6A82FC, (u32)&frontier_df4_banim_b_033d_6A83BC, (u32)&frontier_df4_banim_b_033e_6A8484, (u32)&frontier_df4_banim_b_033f_6A8560, (u32)&Tsa_RestoreBg_5,
    (u32)&Tsa_RestoreBg_6, (u32)&Tsa_RestoreBg_7, (u32)&Tsa_RestoreBg_8, (u32)&Tsa_RestoreBg_9, (u32)&Tsa_RestoreBg_10, (u32)&Tsa_RestoreBg_11,
    (u32)&Img_Banim_8, (u32)&Img_Banim_8, (u32)&Img_Banim_8, (u32)&Img_Banim_8, (u32)&Img_Banim_8, (u32)&Img_Banim_8,
    (u32)&Img_Banim_9, (u32)&Img_Banim_9, (u32)&Img_Banim_9, (u32)&Img_Banim_10, (u32)&Img_Banim_10, (u32)&Img_Banim_11,
    (u32)&Img_Banim_11, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x6FC, 0x00000004, (u32)&efxFenrirBGCOL_OnEnd, 0x0050000E,
    0x00000000, 0x00000000, 0x00000000,
};
u32 data_08600DB8[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x708, 0x00000003, (u32)&efxSilence_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x714, 0x00000003, (u32)&efxDarkbreathBG_Loop, 0x00000000, 0x00000000,
    (u32)&Tsa_SilenceBg_0, (u32)&Tsa_SilenceBg_1, (u32)&Tsa_SilenceBg_2, (u32)&frontier_df4_banim_b_037_6AC820, (u32)&frontier_df4_banim_b_037b_6AC908, (u32)&frontier_df4_banim_b_037c_6ACA04,
    (u32)&frontier_df4_banim_b_037d_6ACAEC, (u32)&frontier_df4_banim_b_037e_6ACB84, (u32)&frontier_df4_banim_b_037f_6ACC6C, (u32)&frontier_df4_banim_b_037g_6ACD04, (u32)&frontier_df4_banim_b_037h_6ACDEC, (u32)&frontier_df4_banim_b_037i_6ACEE8,
    (u32)&frontier_df4_banim_b_037j_6ACF80, (u32)&frontier_df4_banim_b_037k_6AD068, (u32)&frontier_df4_banim_b_037l_6AD100, (u32)&frontier_df4_banim_b_037m_6AD1FC, (u32)&Tsa_SilenceBg_16, (u32)&Tsa_SilenceBg_17,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x76C, 0x00000004, (u32)&efxSilenceOBJ_OnEnd, 0x0028000E, 0x00000000,
    0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxFenrir[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0x77C)), PROC_REPEAT(efxSleep_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res20[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x788, 0x00000003, (u32)&sub_8063940, 0x00000000, 0x00000000,
    (u32)&Tsa_SleepBg_0, (u32)&Tsa_SleepBg_1, (u32)&Tsa_SleepBg_2, (u32)&Tsa_SleepBg_3, (u32)&Tsa_SleepBg_4, (u32)&Tsa_SleepBg_5,
    (u32)&Tsa_SleepBg_6, (u32)&Tsa_SleepBg_7, (u32)&Tsa_SleepBg_8, (u32)&Tsa_SleepBg_9, (u32)&Tsa_SleepBg_10, (u32)&Tsa_SleepBg_11,
    (u32)&Tsa_SleepBg_12, (u32)&Tsa_SleepBg_13, (u32)&Tsa_SleepBg_14, (u32)&Tsa_SleepBg_15, 0x00000001, (u32)&Frames_efxSleepBG + 0x104,
    0x00000004, (u32)&efxRestOBJ_Loop, 0x0050000E, 0x00000000, 0x00000000, 0x00000000,
    0x00000001, (u32)&Frames_efxSleepBG + 0x110, 0x00000004, (u32)&efxRestOBJ_Loop, 0x00C8000E, 0x00000000,
    0x00000000, 0x00000000, 0x00000001, (u32)&Frames_efxSleepBG + 0x120, 0x00000004, (u32)&efxSleepOBJ_OnEnd,
    0x0001000E, 0x00000000, 0x00000002, (u32)&efxSleepSE_PlaySE, 0x0036000E, 0x00000000,
    0x00000002, (u32)&efxSleepSE_PlaySE, 0x0041000E, 0x00000000, 0x00000002, (u32)&efxSleepSE_PlaySE,
    0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxShine[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)Frames_efxSleepBG + 0x12C)), PROC_REPEAT(efxHammarne_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res21[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&Frames_efxSleepBG + 0x138, 0x00000003, (u32)&efxFimbulvetrBGTR_Loop, 0x00000000, 0x00000000,
    (u32)&Pal_HammerneBg + 0x20, (u32)&Pal_HammerneBg + 0xCC, (u32)&Pal_HammerneBg + 0x17C, (u32)&Pal_HammerneBg + 0x23C, (u32)&Pal_HammerneBg + 0x304, (u32)&Pal_HammerneBg + 0x3DC,
    (u32)&Tsa_HammerneBg_6, (u32)&Tsa_HammerneBg_7, (u32)&Tsa_HammerneBg_8, (u32)&Tsa_HammerneBg_9, (u32)&Tsa_HammerneBg_10, (u32)&Tsa_HammerneBg_11,
    (u32)&Tsa_HammerneBg_12, (u32)&Img_Banim_8, (u32)&Img_Banim_8, (u32)&Img_Banim_8, (u32)&Img_Banim_8, (u32)&Img_Banim_8,
    (u32)&Img_Banim_8, (u32)&Img_Banim_9, (u32)&Img_Banim_9, (u32)&Img_Banim_9, (u32)&Img_Banim_10, (u32)&Img_Banim_10,
    (u32)&Img_Banim_11, (u32)&Img_Banim_11, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x910, 0x00000004, (u32)&efxSleepSE_OnEnd,
    0x0050000E, 0x00000000, 0x00000000, 0x00000000,
};
u32 data_08601000[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x920, 0x00000003, (u32)&efxBerserk_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x92C, 0x00000003, (u32)&efxBerserkBG_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x93C, 0x00000004, (u32)&efxHammarneOBJ_OnEnd, 0x00000003, (u32)&efxBerserkCLONE_Loop,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x94C, 0x00000004, (u32)&efxBerserkOBJ_OnEnd,
    0x00000003, (u32)&efxBerserkOBJ_Loop_A, 0x0007000E, 0x00000000, 0x00000003, (u32)&efxBerserkOBJ_Loop_B,
    0x0003000E, 0x00000000, 0x00000003, (u32)&efxBerserkOBJ_Loop_C, 0x0007000E, 0x00000000,
    0x00000003, (u32)&efxBerserkOBJ_Loop_D, 0x0003000E, 0x00000000, 0x00000003, (u32)&efxBerserkOBJ_Loop_E,
    0x0007000E, 0x00000000, 0x00000003, (u32)&efxBerserkOBJ_Loop_F, 0x0003000E, 0x00000000,
    0x00000003, (u32)&efxBerserkOBJ_Loop_G, 0x0007000E, 0x00000000, 0x00000003, (u32)&efxBerserkOBJ_Loop_H,
    0x0003000E, 0x00000000, 0x00000003, (u32)&efxBerserkOBJ_Loop_I, 0x0007000E, 0x00000000,
    0x00000003, (u32)&efxBerserkOBJ_Loop_J, 0x0011000E, 0x00000000, 0x00000000, 0x00000000,
};
u32 data_08601108[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x95C, 0x00000003, (u32)&efxMshield_Loop_Main, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x968, 0x00000003, (u32)&efxSilenceBG_Loop, 0x00000000, 0x00000000,
    (u32)&Tsa_BarrierBg_0, (u32)&Tsa_BarrierBg_1, (u32)&Tsa_BarrierBg_2, (u32)&Tsa_BarrierBg_3, (u32)&Tsa_BarrierBg_4, 0x00000001,
    (u32)&frontier_df4_misc_lo_008_0E2638 + 0xA40, 0x00000004, (u32)&sub_8064568, 0x00DC000E, 0x00000000, 0x00000000,
    0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xA50, 0x00000004, (u32)&sub_8064568, 0x006E000E,
    0x00000000, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xA60, 0x00000003,
    (u32)&efxShine_Loop_Main, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xA6C, 0x00000003,
    (u32)&efxShineBG_Loop, 0x00000000, 0x00000000, (u32)&Tsa_ShineBg1_Left, (u32)&Tsa_ShineBg1_Right, (u32)&Img_ShineBg1,
    0x00000001, (u32)&Frames_efxShineBG + 0x8, 0x00000003, (u32)&efxShineBG2_Loop, 0x00000000, 0x00000000,
    (u32)&frontier_df3_banim_aura_003_754840, (u32)&data_087548F0, (u32)&data_087549F8, (u32)&data_08754B34, (u32)&data_08754CA8, (u32)&data_08754E40,
    (u32)&data_08754FB4, (u32)&data_087550C0, (u32)&data_08755194, 0x00000001, (u32)&Frames_efxShineBG2 + 0x28, 0x000A000F,
    0x00000000, 0x00000003, (u32)&efxExcaliburBGCOL2_Loop, 0x00000000, 0x00000000, 0x00000001,
    (u32)&Frames_efxShineBGCOL + 0x1A, 0x00000003, (u32)&efxShineOBJRND_Loop, 0x00000000, 0x00000000, 0xFFCAFFFC,
    0xFFE8FFD8, 0x00040004, 0xFFEC0014, 0x00000001, (u32)&Frames_efxShineBGCOL + 0x2A, 0x00000003,
    (u32)&efxShineOBJ_Loop, 0x00000000, 0x00000000, 0x00000001, (u32)&Frames_efxShineBGCOL + 0x36, 0x00000003,
    (u32)&efxLuna_Loop_Main, 0x00000000, 0x00000000, 0x00000001, (u32)&Frames_efxShineBGCOL + 0x3E, 0x00000003,
    (u32)&efxSleepBG_Loop, 0x00000000, 0x00000000, (u32)&Tsa_LunaBg1_A, 0x00000001, (u32)&Frames_efxLunaBG + 0x6,
    0x00000003, (u32)&efxLunaSCR_Loop, 0x00000000, 0x00000000, 0x00000001, (u32)&Frames_efxLunaBG + 0x12,
    0x00000003, (u32)&EfxSRankWeaponEffectSCR2Main, 0x00000000, 0x00000000,
};
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_banim_a_013_601630[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xC64, 0x00000004, (u32)&efxExcaliburBG2_OnEnd, 0x00000003, (u32)&sub_8065A44,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xC74, 0x000A000F, 0x00000000,
    0x00000003, (u32)&sub_8065AA8, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xC9C,
    0x00000004, (u32)&efxExcaliburBG3_OnEnd, 0x00000003, (u32)&sub_8065BF0, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xCAC, 0x000A000F, 0x00000000, 0x00000003, (u32)&sub_8065C54,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xCD4, 0x00000003, (u32)&efxExcaliburOBJ_Loop,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xCE4, 0x00000003, (u32)&efxExcaliburBG0_Loop,
    0x00000000, 0x00000000, (u32)&AnimScr_DarkBreath_Far + 0x6C, (u32)&Pal_efxExcaliburBG0 + 0x20, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xCFC,
    0x00000003, (u32)&sub_8065E44, 0x00000000, 0x00000000,
};
u32 data_08601700[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xD08, 0x00000003, (u32)&efxGespenstBG_Loop, 0x00000000, 0x00000000,
    (u32)&data_0875F138 + 0x20, (u32)&data_0875F138 + 0x114, (u32)&data_0875F138 + 0x208, (u32)&data_0875F138 + 0x2FC, (u32)&data_0875F138 + 0x474, (u32)&data_0875F138 + 0x5EC,
    (u32)&data_0875F138 + 0x764, (u32)&data_0875F138 + 0x940, (u32)&data_0875F138 + 0xB1C, (u32)&data_0875F138 + 0xCF8, (u32)&data_0875F138 + 0xE94, (u32)&data_0875F138 + 0x1030,
};
u32 data_08601748[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, 0x080E33A4, 0x00000004, (u32)&sub_80661D0, 0x00000003, (u32)&sub_80661EC,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xD7C, 0x00000004, (u32)&efxGespenstBG4_OnEnd,
    0x00000003, (u32)&efxGespenstBG4_Loop, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xD8C,
    0x000A000F, 0x00000000, 0x00000003, (u32)&efxGespenstBGCOL2_Loop, 0x00000000, 0x00000000,
};
u32 data_086017A8[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xDF0, 0x00000003, (u32)&sub_8066410, 0x00000000, 0x00000000,
};
u32 data_086017C0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xE00, 0x00000004, (u32)&sub_80664B8, 0x00000003, (u32)&sub_80664D0,
    0x0013000E, 0x00000000, 0x00000003, (u32)&sub_80664EC, 0x0018000E, 0x00000000,
    0x00000003, (u32)&sub_8066508, 0x0013000E, 0x00000000, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_efxLuna[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0xE10)), PROC_REPEAT(efxOura_Loop_Main), PROC_END,
};
u32 frontier_df4_banim_a_res22[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xE18, 0x00000003, (u32)&efxOuraBG_Loop, 0x00000000, 0x00000000,
    (u32)&Tsa_AuraBg1_0, (u32)&Tsa_AuraBg1_1, (u32)&Tsa_AuraBg1_2, (u32)&Tsa_AuraBg1_3, (u32)&Tsa_AuraBg1_4, (u32)&Tsa_AuraBg1_5,
    (u32)&Tsa_AuraBg1_6, (u32)&Tsa_AuraBg1_7, (u32)&Tsa_AuraBg1_8, (u32)&Tsa_AuraBg1_9, (u32)&Tsa_AuraBg1_10, (u32)&Tsa_AuraBg1_11,
    (u32)&Tsa_AuraBg1_12, (u32)&Tsa_AuraBg1_13, (u32)&Tsa_AuraBg1_14, (u32)&Tsa_AuraBg1_15, (u32)&Tsa_AuraBg1_16, (u32)&Tsa_AuraBg1_17,
    (u32)&Tsa_AuraBg1_18, (u32)&Tsa_AuraBg1_19, (u32)&Tsa_AuraBg1_20, (u32)&Tsa_AuraBg1_21, (u32)&Tsa_AuraBg1_22, (u32)&Tsa_AuraBg1_23,
    (u32)&Tsa_AuraBg1_24, (u32)&frontier_df4_banim_b_056_7657CC, (u32)&frontier_df4_banim_b_056b_7658D0, (u32)&frontier_df4_banim_b_056c_7659D4, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xE9C,
    0x00000004, (u32)&efxOuraBG2_OnEnd, 0x00000003, (u32)&efxOuraBG2_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xEA8, 0x000A000F, 0x00000000, 0x00000003, (u32)&efxOuraBGCOL_Loop,
    0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xEC8, 0x00000003, (u32)&efxOuraBG3_Loop,
    0x00000000, 0x00000000, (u32)&frontier_banim_aurabg3_005_774CB8, (u32)&frontier_banim_aurabg3_006_774F30, (u32)&frontier_banim_aurabg3_007_7751A8, (u32)&frontier_banim_aurabg3_008_775420,
    (u32)&frontier_banim_aurabg3_009_775698, (u32)&frontier_banim_aurabg3_010_775908, (u32)&frontier_banim_aurabg3_011_775B64, (u32)&frontier_banim_aurabg3_012_775DDC, (u32)&frontier_banim_aurabg3_013_776054, (u32)&frontier_banim_aurabg3_014_7762CC,
    (u32)&frontier_banim_aurabg3_015_776544, (u32)&frontier_banim_aurabg3_016_7767BC, (u32)&Img_AuraBg3_0, (u32)&Img_AuraBg3_1, (u32)&Img_AuraBg3_2, (u32)&Img_AuraBg3_3,
    (u32)&Img_AuraBg3_4, (u32)&Img_AuraBg3_5, (u32)&Img_AuraBg3_6, (u32)&frontier_banim_aurabg3_000_76E98C, (u32)&frontier_banim_aurabg3_001_76FE78, (u32)&frontier_banim_aurabg3_002_771224,
    (u32)&frontier_banim_aurabg3_003_7725D4, (u32)&frontier_banim_aurabg3_004_7738F0,
};
struct ProcCmd ProcScr_efxExcalibur[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0xF48)), PROC_REPEAT(sub_8066B7C), PROC_END,
};
u32 data_08601978[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xF50, 0x00000003, (u32)&efxLunaBG_Loop, 0x00000000, 0x00000000,
    (u32)&frontier_banim_aurabg3_017_777118, (u32)&frontier_banim_aurabg3_018_7771B8, (u32)&frontier_banim_aurabg3_019_777264, (u32)&frontier_banim_aurabg3_020_777308, (u32)&frontier_banim_aurabg3_021_7773B4, (u32)&frontier_banim_aurabg3_022_777468,
    (u32)&frontier_banim_aurabg3_023_777520, (u32)&frontier_banim_aurabg3_024_7775CC, (u32)&frontier_banim_aurabg3_025_777674, (u32)&frontier_banim_aurabg3_026_77771C, (u32)&frontier_banim_aurabg3_027_7777BC, (u32)&frontier_banim_aurabg3_028_777858,
};
u32 data_086019C0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0xF8C, 0x00000004, (u32)&sub_8066E24, 0x00000003, (u32)&sub_8066E40,
    0x00000000, 0x00000000,
};
u32 data_086019E0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, 0x080E35D0, 0x00000003, (u32)&efxReblowOBJ_Loop_B, 0x00000000, 0x00000000,
};
u32 data_086019F8[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, 0x080E35DC, 0x00000003, (u32)&efxIvaldiWOUT_Loop, 0x00000000, 0x00000000,
};
/* #143 shiftability: ProcScr_efxLuceBGCOL (JP 0x08601A10) carved in-place from the
 * fully-symbolized gap13 .4byte blob into a real relocatable typed struct ProcCmd[]
 * -- byte-neutral (same 24 bytes, same relocs). Its PROC_NAME pointed at the raw
 * literal 0x080E35E8 (the "efxLuceBGCOL" debug-name string, which has no own symbol),
 * which did NOT track a +0x40000 ROM shift; re-express it as
 * frontier_df4_misc_lo_008_0E2638 + 0xFB0 (== 0x080E35E8) so the word becomes an
 * R_ARM_ABS32 relocation that shifts with the ROM -- exactly like the efxLive /
 * efxSleep / efxOura / efxExcalibur sibling proc-script carves in this file. The
 * opaque baseline .set alias @0x08601A10 is dropped in
 * layout/baseline_syms_drop.d/ProcScr_efxLuceBGCOL.tsv so this real definition wins.
 * PROC_REPEAT loop pointer already relocated (efxLuceBGCOL_Loop, T); PROC_END is 0. */
struct ProcCmd ProcScr_efxLuceBGCOL[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0xFB0)), PROC_REPEAT(efxLuceBGCOL_Loop), PROC_END,
};
u32 frontier_df4_banim_a_res23[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&FrameConf_efxLuceBGCOL + 0x3E, 0x00000003, (u32)&efxEreshkigal_Loop_Main, 0x00000000, 0x00000000,
};
u32 data_08601A40[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&FrameConf_efxLuceBGCOL + 0x4E, 0x00000003, (u32)&sub_806749C, 0x0045000E, 0x00000000,
    0x00000000, 0x00000000, 0x000000D0, 0x00000030, 0x00000003, 0x00000400,
    0x000000A0, 0x00000090, 0x00000001, 0x00000800, 0x00000040, 0x00000040,
    0x00000003, 0x00000400, 0x000000C0, 0x00000060, 0x00000001, 0x00000800,
    0x00000080, 0x00000030, 0x00000005, 0x00000400, 0x00000020, 0x00000060,
    0x00000000, 0x00000800, 0x00000050, 0x00000080, 0x00000005, 0x00000400,
    0x000000A0, 0x00000060, 0x00000001, 0x00000800, 0x000000D0, 0x00000030,
    0x00000003, 0x00000400, 0x00000010, 0x00000040, 0x00000000, 0x00000800,
    0x00000040, 0x00000070, 0x00000005, 0x00000400, 0x00000090, 0x00000060,
    0x00000001, 0x00000800, 0x00000050, 0x00000020, 0x00000003, 0x00000400,
    (u32)&data_087A0EF4 + 0xB18, (u32)&data_087A0EF4 + 0xBF0, (u32)&data_087A0EF4 + 0xC88, (u32)&data_087A1C24 + 0x10, (u32)&data_087A1C24 + 0x80, (u32)&data_087A1C24 + 0xD0,
    0x00000001, (u32)&FrameConf_efxLuceBGCOL + 0x62, 0x00000004, (u32)&efxGorgonOBJ_OnEnd, 0x003B000E, 0x00000000,
    0x00000000, 0x00000000,
};
u32 data_08601B68[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&FrameConf_efxLuceBGCOL + 0x76, 0x00000004, (u32)&sub_8067600, 0x000D000E, 0x00000000,
    0x00000003, (u32)&sub_8067618, 0x006E000E, 0x00000000, 0x00000000, 0x00000000,
};
u32 data_08601B98[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&FrameConf_efxLuceBGCOL + 0x8A, 0x00000003, (u32)&efxHazymoonBG_Loop, 0x00000000, 0x00000000,
    (u32)&frontier_banim_dracozombie_018_781CBC, (u32)&frontier_banim_dracozombie_018_781CBC, (u32)&frontier_banim_dracozombie_019_7832B4, (u32)&frontier_banim_dracozombie_020_7844F0, (u32)&frontier_banim_dracozombie_021_785C08, (u32)&frontier_banim_dracozombie_022_7875A0,
    (u32)&frontier_banim_dracozombie_023_788CC4, (u32)&frontier_banim_dracozombie_024_78A0D0, (u32)&frontier_banim_dracozombie_025_78AF74, (u32)&frontier_banim_dracozombie_026_78BE1C, (u32)&frontier_banim_dracozombie_027_78CEA8, (u32)&frontier_banim_dracozombie_028_78D004,
    (u32)&frontier_banim_dracozombie_029_78D354, (u32)&frontier_banim_dracozombie_030_78D6A4, (u32)&frontier_banim_dracozombie_031_78DAB4, (u32)&frontier_banim_dracozombie_032_78DF08, (u32)&frontier_banim_dracozombie_033_78E33C, (u32)&frontier_banim_dracozombie_034_78E750,
    (u32)&frontier_banim_dracozombie_035_78EAE0, (u32)&frontier_banim_dracozombie_036_78EE00, 0x00000001, (u32)&FrameConf_efxLuceBGCOL + 0x14A, 0x00000003, (u32)&efxSuperdruidBG3_Loop,
    0x00000000, 0x00000000, (u32)&frontier_banim_dracozombie_040b_7959D8, (u32)&Img_EreshkigalBg3_0, (u32)&Img_EreshkigalBg3_1, (u32)&Img_EreshkigalBg3_2,
    (u32)&Img_EreshkigalBg3_3, (u32)&frontier_df4_banim_b_057_79A108, (u32)&Img_EreshkigalBg3_5, (u32)&Img_EreshkigalBg3_6, (u32)&Img_EreshkigalBg3_7, (u32)&Img_EreshkigalBg3_8,
    (u32)&Tsa_EreshkigalBg3_0, (u32)&Tsa_EreshkigalBg3_1, (u32)&frontier_df4_banim_b_058_79F83C, (u32)&Tsa_EreshkigalBg3_3, (u32)&frontier_df4_banim_b_059_79FCB0, (u32)&data_0879FF00,
    (u32)&data_087A0174, (u32)&data_087A03A0, (u32)&data_087A05E4, (u32)&data_087A083C,
};
u32 data_08601C68[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x1144, 0x00000003, (u32)&sub_8067884, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x1158, 0x00000004, (u32)&efxExcaliburBGCOL_OnEnd, 0x000D000E, 0x00000000,
    0x00000000, 0x00000000,
};
u32 data_08601CA0[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_008_0E2638 + 0x116C, 0x00000004, (u32)&efxSuperdruidOBJ2_OnEnd, 0x000D000E, 0x00000000,
    0x00000000, 0x00000000,
};
/* frontier_df4_banim_a_014_601CD8: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_banim_a_014_601CD8[] __attribute__((section(".data.frontier_df4_banim_a.gap14"))) = {
    0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0x3, 0x00000003, (u32)&efxIvaldi_Loop_Main + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0xF, 0x00000003, (u32)&efxIvaldiBG2_Loop + 0x1, 0x00000000, 0x00000000,
    (u32)&Tsa_IvaldiBg1_0, (u32)&Tsa_IvaldiBg1_1, (u32)&Tsa_IvaldiBg1_2, (u32)&Tsa_IvaldiBg1_3, (u32)&Tsa_IvaldiBg1_4, (u32)&Tsa_IvaldiBg1_5,
    (u32)&Tsa_IvaldiBg1_6, (u32)&Tsa_IvaldiBg1_7, (u32)&Tsa_IvaldiBg1_8, (u32)&Tsa_IvaldiBg1_9, (u32)&Tsa_IvaldiBg1_10, (u32)&Tsa_IvaldiBg1_11,
    0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0x4F, 0x00000003, (u32)&sub_8067EA4 + 0x1, 0x00000000, 0x00000000,
    (u32)&Tsa_IvaldiBg2_0, (u32)&Tsa_IvaldiBg2_1, (u32)&Tsa_IvaldiBg2_2, (u32)&Tsa_IvaldiBg2_3, (u32)&Tsa_IvaldiBg2_4, 0x00000001,
    (u32)&frontier_df4_misc_lo_009_0E37C5 + 0x7B, 0x00000003, (u32)&sub_8067F68 + 0x1, 0x00000000, 0x00000000, (u32)&Tsa_IvaldiBg3_0,
    (u32)&Tsa_IvaldiBg3_1, (u32)&Tsa_IvaldiBg3_2, (u32)&Tsa_IvaldiBg3_3, (u32)&Tsa_IvaldiBg3_4, (u32)&Tsa_IvaldiBg3_5, (u32)&Tsa_IvaldiBg3_6,
    (u32)&Tsa_IvaldiBg3_7, (u32)&Tsa_IvaldiBg3_8, (u32)&Tsa_IvaldiBg3_9, (u32)&Tsa_IvaldiBg3_10, (u32)&Img_IvaldiBg3_0, (u32)&Img_IvaldiBg3_1,
    (u32)&Img_IvaldiBg3_2, (u32)&Img_IvaldiBg3_3, (u32)&Img_IvaldiBg3_4, (u32)&Img_IvaldiBg3_5, (u32)&Img_IvaldiBg3_6, (u32)&Img_IvaldiBg3_7,
    (u32)&Img_IvaldiBg3_8, (u32)&Img_IvaldiBg3_9, (u32)&Img_IvaldiBg3_10, (u32)&Pal_IvaldiBg3_0, (u32)&Pal_IvaldiBg3_1, (u32)&Pal_IvaldiBg3_2,
    (u32)&Pal_IvaldiBg3_3, (u32)&Pal_IvaldiBg3_4, (u32)&Pal_IvaldiBg3_5, (u32)&Pal_IvaldiBg3_6, (u32)&Pal_IvaldiBg3_7, (u32)&Pal_IvaldiBg3_8,
    (u32)&Pal_IvaldiBg3_9, (u32)&Pal_IvaldiBg3_10, 0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0xB7, 0x00000003, (u32)&efxIvaldiBG4_Loop + 0x1,
    0x00000000, 0x00000000, (u32)&Tsa_IvaldiBg4, 0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0xCB, 0x00000003,
    (u32)&efxIvaldiOBJFall_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0xDF, 0x00000003,
    (u32)&efxIvaldiOBJSideWash_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0xF7, 0x00000003,
    (u32)&efxIvaldiOBJUprise_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009_0E37C5 + 0x10B, 0x00000003,
    (u32)&efxIvaldiOBJ1_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009aa_0E3910, 0x00000003,
    (u32)&efxIvaldiOBJ2_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928, 0x00000003,
    (u32)&sub_8068850 + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0x10, 0x00000003,
    (u32)&efxMaohFlash_Loop_Main + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0x20, 0x00000003,
    (u32)&efxIvaldiBG3_Loop + 0x1, 0x00000000, 0x00000000, (u32)&Tsa_DemonLightBg_Close_1, (u32)&Tsa_DemonLightBg_Close_2, (u32)&Tsa_DemonLightBg_Close_3,
    (u32)&Tsa_DemonLightBg_Close_4, (u32)&Tsa_DemonLightBg_Close_5, (u32)&Tsa_DemonLightBg_Close_6, (u32)&Tsa_DemonLightBg_Close_7, (u32)&Tsa_DemonLightBg_Close_8, (u32)&Tsa_DemonLightBg_Close_9,
    (u32)&Tsa_DemonLightBg_Close_10, (u32)&Tsa_DemonLightBg_Close_11, (u32)&Tsa_DemonLightBg_Close_12, (u32)&Tsa_DemonLightBg_Close_13, (u32)&Tsa_DemonLightBg_Close_14, (u32)&Tsa_DemonLightBg_Close_15,
    (u32)&Tsa_DemonLightBg_Close_16, (u32)&Tsa_DemonLightBg_Close_17, (u32)&Tsa_DemonLightBg_Close_18, (u32)&Tsa_DemonLightBg_Close_19, (u32)&Tsa_DemonLightBg_Close_20, (u32)&Tsa_DemonLightBg_Close_21,
    (u32)&Tsa_DemonLightBg_Close_22, (u32)&Tsa_DemonLightBg_Close_23, (u32)&Tsa_DemonLightBg_Close_24, (u32)&Tsa_DemonLightBg_Close_25, (u32)&Tsa_DemonLightBg_Close_26, (u32)&Tsa_DemonLightBg_Close_27,
    (u32)&Tsa_DemonLightBg_Close_28, (u32)&Tsa_DemonLightBg_Close_29, (u32)&Tsa_DemonLightBg_Close_30, (u32)&Tsa_DemonLightBg_Close_31, (u32)&Tsa_DemonLightBg_Close_32, (u32)&Img_DemonLightBg_Close_1,
    (u32)&Img_DemonLightBg_Close_2, (u32)&Img_DemonLightBg_Close_3, (u32)&Img_DemonLightBg_Close_4, (u32)&Img_DemonLightBg_Close_5, (u32)&Img_DemonLightBg_Close_6, (u32)&Img_DemonLightBg_Close_7,
    (u32)&Img_DemonLightBg_Close_8, (u32)&Img_DemonLightBg_Close_9, (u32)&Img_DemonLightBg_Close_10, (u32)&Img_DemonLightBg_Close_11, (u32)&Img_DemonLightBg_Close_12, (u32)&Img_DemonLightBg_Close_13,
    (u32)&Img_DemonLightBg_Close_14, (u32)&Img_DemonLightBg_Close_15, (u32)&Img_DemonLightBg_Close_16, (u32)&Img_DemonLightBg_Close_17, (u32)&Img_DemonLightBg_Close_18, (u32)&Img_DemonLightBg_Close_19,
    (u32)&Img_DemonLightBg_Close_20, (u32)&Img_DemonLightBg_Close_21, (u32)&Img_DemonLightBg_Close_22, (u32)&Img_DemonLightBg_Close_23, (u32)&Img_DemonLightBg_Close_24, (u32)&Img_DemonLightBg_Close_25,
    (u32)&Img_DemonLightBg_Close_26, (u32)&Img_DemonLightBg_Close_27, (u32)&Img_DemonLightBg_Close_28, (u32)&Img_DemonLightBg_Close_29, (u32)&Img_DemonLightBg_Close_30, (u32)&Img_DemonLightBg_Close_31,
    (u32)&Img_DemonLightBg_Close_32, (u32)&Pal_DemonLightBg_Close_1, (u32)&Pal_DemonLightBg_Close_2, (u32)&Pal_DemonLightBg_Close_3, (u32)&Pal_DemonLightBg_Close_4, (u32)&Pal_DemonLightBg_Close_5,
    (u32)&Pal_DemonLightBg_Close_6, (u32)&Pal_DemonLightBg_Close_7, (u32)&Pal_DemonLightBg_Close_8, (u32)&Pal_DemonLightBg_Close_9, (u32)&Pal_DemonLightBg_Close_10, (u32)&Pal_DemonLightBg_Close_11,
    (u32)&Pal_DemonLightBg_Close_12, (u32)&Pal_DemonLightBg_Close_13, (u32)&Pal_DemonLightBg_Close_14, (u32)&Pal_DemonLightBg_Close_15, (u32)&Pal_DemonLightBg_Close_16, (u32)&Pal_DemonLightBg_Close_17,
    (u32)&Pal_DemonLightBg_Close_18, (u32)&Pal_DemonLightBg_Close_19, (u32)&Pal_DemonLightBg_Close_20, (u32)&Pal_DemonLightBg_Close_21, (u32)&Pal_DemonLightBg_Close_22, (u32)&Pal_DemonLightBg_Close_23,
    (u32)&Pal_DemonLightBg_Close_24, (u32)&Pal_DemonLightBg_Close_25, (u32)&Pal_DemonLightBg_Close_26, (u32)&Pal_DemonLightBg_Close_27, (u32)&Pal_DemonLightBg_Close_28, (u32)&Pal_DemonLightBg_Close_29,
    (u32)&Pal_DemonLightBg_Close_30, (u32)&Pal_DemonLightBg_Close_31, (u32)&Pal_DemonLightBg_Close_32, (u32)&Tsa_DemonLightBg_Far_1, (u32)&Tsa_DemonLightBg_Far_2, (u32)&Tsa_DemonLightBg_Far_3,
    (u32)&Tsa_DemonLightBg_Far_4, (u32)&Tsa_DemonLightBg_Far_5, (u32)&Tsa_DemonLightBg_Far_6, (u32)&Tsa_DemonLightBg_Far_7, (u32)&Tsa_DemonLightBg_Far_8, (u32)&Tsa_DemonLightBg_Far_9,
    (u32)&Tsa_DemonLightBg_Far_10, (u32)&Tsa_DemonLightBg_Far_11, (u32)&Tsa_DemonLightBg_Far_12, (u32)&Tsa_DemonLightBg_Far_13, (u32)&Tsa_DemonLightBg_Far_14, (u32)&Tsa_DemonLightBg_Far_15,
    (u32)&Tsa_DemonLightBg_Far_16, (u32)&Tsa_DemonLightBg_Far_17, (u32)&Tsa_DemonLightBg_Far_18, (u32)&Tsa_DemonLightBg_Far_19, (u32)&Tsa_DemonLightBg_Far_20, (u32)&Tsa_DemonLightBg_Far_21,
    (u32)&Tsa_DemonLightBg_Far_22, (u32)&Tsa_DemonLightBg_Far_23, (u32)&Tsa_DemonLightBg_Far_24, (u32)&Tsa_DemonLightBg_Far_25, (u32)&Tsa_DemonLightBg_Far_26, (u32)&Tsa_DemonLightBg_Far_27,
    (u32)&Tsa_DemonLightBg_Far_28, (u32)&Tsa_DemonLightBg_Far_29, (u32)&Tsa_DemonLightBg_Far_30, (u32)&Tsa_DemonLightBg_Far_31, (u32)&Tsa_DemonLightBg_Far_32, (u32)&Img_DemonLightBg_Far_1,
    (u32)&Img_DemonLightBg_Far_2, (u32)&Img_DemonLightBg_Far_3, (u32)&Img_DemonLightBg_Far_4, (u32)&Img_DemonLightBg_Far_5, (u32)&Img_DemonLightBg_Far_6, (u32)&Img_DemonLightBg_Far_7,
    (u32)&Img_DemonLightBg_Far_8, (u32)&Img_DemonLightBg_Far_9, (u32)&Img_DemonLightBg_Far_10, (u32)&Img_DemonLightBg_Far_11, (u32)&Img_DemonLightBg_Far_12, (u32)&Img_DemonLightBg_Far_13,
    (u32)&Img_DemonLightBg_Far_14, (u32)&Img_DemonLightBg_Far_15, (u32)&Img_DemonLightBg_Far_16, (u32)&Img_DemonLightBg_Far_17, (u32)&Img_DemonLightBg_Far_18, (u32)&Img_DemonLightBg_Far_19,
    (u32)&Img_DemonLightBg_Far_20, (u32)&Img_DemonLightBg_Far_21, (u32)&Img_DemonLightBg_Far_22, (u32)&Img_DemonLightBg_Far_23, (u32)&Img_DemonLightBg_Far_24, (u32)&Img_DemonLightBg_Far_25,
    (u32)&Img_DemonLightBg_Far_26, (u32)&Img_DemonLightBg_Far_27, (u32)&Img_DemonLightBg_Far_28, (u32)&Img_DemonLightBg_Far_29, (u32)&Img_DemonLightBg_Far_30, (u32)&Img_DemonLightBg_Far_31,
    (u32)&Img_DemonLightBg_Far_32, (u32)&Pal_DemonLightBg_Far_1, (u32)&Pal_DemonLightBg_Far_2, (u32)&Pal_DemonLightBg_Far_3, (u32)&Pal_DemonLightBg_Far_4, (u32)&Pal_DemonLightBg_Far_5,
    (u32)&Pal_DemonLightBg_Far_6, (u32)&Pal_DemonLightBg_Far_7, (u32)&Pal_DemonLightBg_Far_8, (u32)&Pal_DemonLightBg_Far_9, (u32)&Pal_DemonLightBg_Far_10, (u32)&Pal_DemonLightBg_Far_11,
    (u32)&Pal_DemonLightBg_Far_12, (u32)&Pal_DemonLightBg_Far_13, (u32)&Pal_DemonLightBg_Far_14, (u32)&Pal_DemonLightBg_Far_15, (u32)&Pal_DemonLightBg_Far_16, (u32)&Pal_DemonLightBg_Far_17,
    (u32)&Pal_DemonLightBg_Far_18, (u32)&Pal_DemonLightBg_Far_19, (u32)&Pal_DemonLightBg_Far_20, (u32)&Pal_DemonLightBg_Far_21, (u32)&Pal_DemonLightBg_Far_22, (u32)&Pal_DemonLightBg_Far_23,
    (u32)&Pal_DemonLightBg_Far_24, (u32)&Pal_DemonLightBg_Far_25, (u32)&Pal_DemonLightBg_Far_26, (u32)&Pal_DemonLightBg_Far_27, (u32)&Pal_DemonLightBg_Far_28, (u32)&Pal_DemonLightBg_Far_29,
    (u32)&Pal_DemonLightBg_Far_30, (u32)&Pal_DemonLightBg_Far_31, (u32)&Pal_DemonLightBg_Far_32, 0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0xB4, 0x00000003,
    (u32)&efxMaohFlashBG2_Loop + 0x1, 0x00000000, 0x00000000, (u32)&Tsa_DemonLightBg_0, (u32)&Tsa_DemonLightBg_1, (u32)&Tsa_DemonLightBg_2,
    (u32)&Img_DemonLightBg_2, (u32)&Img_DemonLightBg_3, (u32)&Img_DemonLightBg_4, (u32)&Pal_DemonLightBg_0, (u32)&Pal_DemonLightBg_1, (u32)&Pal_Ekrdragonfx_2,
    0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0xD4, 0x00000003, (u32)&efxMaohFlashBG3_Loop + 0x1, 0x00000000, 0x00000000,
    (u32)&Tsa_DemonLightBg3_Close_0, (u32)&Tsa_DemonLightBg3_Close_1, (u32)&Tsa_DemonLightBg3_Close_2, (u32)&Tsa_DemonLightBg3_Close_3, (u32)&Tsa_DemonLightBg3_Close_4, (u32)&Img_DemonLightBg3_Close_0,
    (u32)&Img_DemonLightBg3_Close_1, (u32)&Img_DemonLightBg3_Close_2, (u32)&Img_DemonLightBg3_Close_3, (u32)&Img_DemonLightBg3_Close_4, (u32)&Pal_DemonLightBg3_Close_0, (u32)&Pal_DemonLightBg3_Close_1,
    (u32)&Pal_DemonLightBg3_Close_2, (u32)&Pal_DemonLightBg3_Close_3, (u32)&Pal_DemonLightBg3_Close_4, (u32)&Tsa_DemonLightBg3_Far_0, (u32)&Tsa_DemonLightBg3_Far_1, (u32)&Tsa_DemonLightBg3_Far_2,
    (u32)&Tsa_DemonLightBg3_Far_3, (u32)&Tsa_DemonLightBg3_Far_4, (u32)&Img_DemonLightBg3_Far_0, (u32)&Img_DemonLightBg3_Far_1, (u32)&Img_DemonLightBg3_Far_2, (u32)&Img_DemonLightBg3_Far_3,
    (u32)&Img_DemonLightBg3_Far_4, (u32)&Pal_DemonLightBg3_Far_0, (u32)&Pal_DemonLightBg3_Far_1, (u32)&Pal_DemonLightBg3_Far_2, (u32)&Pal_DemonLightBg3_Far_3, (u32)&Pal_DemonLightBg3_Far_4,
    0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0x10C, 0x00000003, (u32)&sub_8068E34 + 0x1, 0x00000000, 0x00000000,
    (u32)&Tsa_DemonLightBg4_Close_0, (u32)&Tsa_DemonLightBg4_Close_1, (u32)&Tsa_DemonLightBg4_Close_2, (u32)&Tsa_DemonLightBg4_Close_3, (u32)&Tsa_DemonLightBg4_Close_4, (u32)&Tsa_DemonLightBg4_Close_5,
    (u32)&Tsa_DemonLightBg4_Close_6, (u32)&Tsa_DemonLightBg4_Close_7, (u32)&Img_DemonLightBg_0, (u32)&Img_DemonLightBg4_Close_0, (u32)&Img_DemonLightBg4_Close_1, (u32)&Img_DemonLightBg4_Close_2,
    (u32)&Img_DemonLightBg4_Close_3, (u32)&Img_DemonLightBg4_Close_4, (u32)&Img_DemonLightBg4_Close_5, (u32)&Img_DemonLightBg4_Close_6, (u32)&Pal_DemonLightBg4_Close_0, (u32)&Pal_DemonLightBg4_Close_1,
    (u32)&Pal_DemonLightBg4_Close_2, (u32)&Pal_DemonLightBg4_Close_3, (u32)&Pal_DemonLightBg4_Close_4, (u32)&Pal_DemonLightBg4_Close_5, (u32)&Pal_DemonLightBg4_Close_6, (u32)&Pal_DemonLightBg4_Close_7,
    (u32)&Tsa_DemonLightBg4_Far_0, (u32)&Tsa_DemonLightBg4_Far_1, (u32)&Tsa_DemonLightBg4_Far_2, (u32)&Tsa_DemonLightBg4_Far_3, (u32)&Tsa_DemonLightBg4_Far_4, (u32)&Tsa_DemonLightBg4_Far_5,
    (u32)&Tsa_DemonLightBg4_Far_6, (u32)&Tsa_DemonLightBg4_Far_7, (u32)&Img_DemonLightBg_1, (u32)&Img_DemonLightBg4_Far_0, (u32)&Img_DemonLightBg4_Far_1, (u32)&Img_DemonLightBg4_Far_2,
    (u32)&Img_DemonLightBg4_Far_3, (u32)&Img_DemonLightBg4_Far_4, (u32)&Img_DemonLightBg4_Far_5, (u32)&Img_DemonLightBg4_Far_6, (u32)&Pal_DemonLightBg4_Far_0, (u32)&Pal_DemonLightBg4_Far_1,
    (u32)&Pal_DemonLightBg4_Far_2, (u32)&Pal_DemonLightBg4_Far_3, (u32)&Pal_DemonLightBg4_Far_4, (u32)&Pal_DemonLightBg4_Far_5, (u32)&Pal_DemonLightBg4_Far_6, (u32)&Pal_DemonLightBg4_Far_7,
    0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0x140, 0x00000003, (u32)&efxMaohFlashWOUT_Loop_A + 0x1, 0x0020000E, 0x00000000,
    0x00000003, (u32)&efxMaohFlashWOUT_Loop_B + 0x1, 0x00000000, 0x00000000, 0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0x154,
    0x0004000E, 0x00000000, 0x00000003, (u32)&efxMaohFlashBGCOL_Loop + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009ab_0E3928 + 0x25C, 0x00000003, (u32)&efxMaohFlashEyeLOBJ2_Loop + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009b_0E3BA4, 0x00000003, (u32)&efxMaohFlashEyeOBJ1_Loop + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009c_0E3BC4, 0x00000003, (u32)&efxMaohFlashEyeFire1OBJ1_Loop + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009d_0E3BE0, 0x00000003, (u32)&efxMaohFlashEyeFire2OBJ1_Loop + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009e_0E3C04, 0x00000003, (u32)&efxMaohFlashThunderOBJ2_Loop + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009f_0E3C28, 0x00000003, (u32)&gap_000695C4 + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009f_0E3C28 + 0x18, 0x00000003, (u32)&efxMaohFlashEyeROBJ2_Loop + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009f_0E3C28 + 0x30, 0x00000003, (u32)&efxStone_Loop_Main + 0x1, 0x00000000, 0x00000000,
    0x00000001, (u32)&frontier_df4_misc_lo_009f_0E3C28 + 0x3C, 0x00000003, (u32)&efxStoneBG_Loop + 0x1, 0x00000000, 0x00000000,
    (u32)&Img_Banim_14, (u32)&Img_Stone_0, (u32)&Img_Stone_1, (u32)&Img_Stone_2, (u32)&Img_Stone_3, (u32)&Img_Stone_4,
    (u32)&Img_Stone_5, (u32)&Img_Stone_6, (u32)&Img_Stone_7, (u32)&Img_Stone_8, (u32)&Img_Stone_9, (u32)&Img_Stone_10,
    (u32)&Img_Stone_11, (u32)&Img_Stone_12, (u32)&Img_Stone_13, (u32)&Img_Stone_14, (u32)&Img_Stone_15, (u32)&Img_Stone_16,
    (u32)&Img_Stone_17, (u32)&Tsa_Stone_0, (u32)&Tsa_Stone_1, (u32)&Tsa_Stone_2, (u32)&Tsa_Stone_3, (u32)&Tsa_Stone_4,
    (u32)&Tsa_Stone_5, (u32)&Tsa_Stone_6, (u32)&Tsa_Stone_7, (u32)&Tsa_Stone_8, (u32)&Tsa_Stone_9, (u32)&Tsa_Stone_10,
    (u32)&Tsa_Stone_11, (u32)&Tsa_Stone_12, (u32)&Tsa_Stone_13, (u32)&Tsa_Stone_14, (u32)&Tsa_Stone_15, (u32)&Tsa_Stone_16,
    (u32)&Tsa_Stone_17, (u32)&Tsa_Stone_18, 0x00000001, (u32)&frontier_df4_misc_lo_009f_0E3C28 + 0x98, 0x00000003, (u32)&efxStoneOBJ_Loop + 0x1,
    0x00000000, 0x00000000,
};
