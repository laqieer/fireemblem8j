#include "global.h"
#include "anime.h"

#include "proc.h"

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
__asm__(
"\t.section .data.frontier_df4_banim_a.gap0, \"aw\", %progbits\n"
"\t.global data_085E1740\n"
"data_085E1740:\n"
"\t.4byte 0x1D6C0000, 0x616B614A, 0x79CF698C, 0x77DF658F, 0x3A535D29, 0x4B3A3ED6\n"
"\t.4byte 0x5BDE537C, 0x67FF5FFF, 0x7FDD6753, 0x4E306F37, 0x3BBE212A, 0x19B11A77\n"
"\t.4byte 0x7DE211FF, 0x623876F5, 0x4BEF0AE3, 0x0000594A, 0x00100010, 0xF0000038\n"
"\t.4byte 0x9001F001, 0x00111101, 0xAFB10000, 0x5BF10000, 0xA1001000, 0x111DF0B5\n"
"\t.4byte 0x00FFFF11, 0x5555FFFF, 0x33335555, 0xF0333320, 0xFA00001F, 0x0000011B\n"
"\t.4byte 0x00011FB5, 0x9401193B, 0x88F11100, 0xD0380380, 0x0442330F, 0x33233423\n"
"\t.4byte 0x33060042, 0x10347423, 0x300F1006, 0x11003311, 0x00F52333, 0x7003F04B\n"
"\t.4byte 0xB3AB0003, 0x303B4700, 0x7D10B8B3, 0x70030010, 0x23A31001, 0x22072222\n"
"\t.4byte 0xBBBBBBBB, 0x0110BB10, 0x39541F90, 0x00F3A300, 0xAF00B947, 0x10F21111\n"
"\t.4byte 0xB011F103, 0x915F1001, 0xBB7300FF, 0xDB0300B8, 0x1F31FFF0, 0xDDDD6F10\n"
"\t.4byte 0xE0DD60DD, 0xFFB2001F, 0xEB00001A, 0xED7300BC, 0x4310BF20, 0x035003F0\n"
"\t.4byte 0xDE01DCDD, 0xDDEDDDCD, 0x4B00DCEC, 0xCDDDED01, 0xECDCDECE, 0xDC000810\n"
"\t.4byte 0xCEDCDECD, 0x7BEDCDED, 0xF04310DD, 0x40037003, 0xCB01EE47, 0x21B0AF00\n"
"\t.4byte 0x8F90101B, 0xEEEE4710, 0xF1E9EEEE, 0x1001301F, 0x0300DE43, 0x1FF11ABB\n"
"\t.4byte 0x600110C1, 0xFFFFFD9F, 0x9F00DFED, 0x9F00DF54, 0xDF9F00EF, 0xEDCF9F00\n"
"\t.4byte 0x1F50DD7A, 0xBFF01311, 0x00DF1F90, 0x00AABD06, 0x1F00BC1F, 0xBC1F00BD\n"
"\t.4byte 0x15BD1F00, 0x00DFDDDD, 0x5F00EF1F, 0xD51600DF, 0x3F005FF0, 0xBD3F00BE\n"
"\t.4byte 0xF0BD1F01, 0x3FF0C73F, 0xBBBD3F30, 0x917FD0BB, 0xC70B115F, 0x5FF01F70\n"
"\t.4byte 0x60DBBBBB, 0x201FF2BF, 0x00F06701, 0xF08F0203, 0x011AF0DA, 0x0D0B01FF\n"
"\t.4byte 0x99999999, 0x01301FF2, 0x4B03000A, 0xFD03009F, 0xD94A2009, 0x037003F0\n"
"\t.4byte 0xF04310FC, 0x10017001, 0x7003F043, 0x2B000003, 0x0400DFA0, 0x900300F9\n"
"\t.4byte 0xDF0189F0, 0x504300FE, 0x301DF0AF, 0x20AB1043, 0x0001F04A, 0xBBCCBC02\n"
"\t.4byte 0x01CBCBBC, 0xBC00CC4F, 0xCCCCCCBB, 0x02BCDDCB, 0xBCDCCCCB, 0x0B00CBCC\n"
"\t.4byte 0xDCBC30BC, 0x1F200400, 0xDCCDBBCB, 0xDC1F1080, 0xCCBCCDCB, 0xDC02BBCC\n"
"\t.4byte 0xBDCCDBCB, 0xBBA501CC, 0xD3E2BB41, 0xCD11119B, 0xF45F33FE, 0x71F0B311\n"
"\t.4byte 0x0310DF22, 0xD90600A1, 0x9F9F10B1, 0xFF03009F, 0x00DBDDF1, 0x9BCCF1CD\n"
"\t.4byte 0xACACFAAA, 0xDDFEBD00, 0xBCFEACDB, 0xFAFC04B9, 0x14AFAA9C, 0xC0DCCD1F\n"
"\t.4byte 0x2A02E000, 0xAA999AD9, 0xCB00AADA, 0xAA9ADADD, 0x03FFFFBA, 0xAAFABBAC\n"
"\t.4byte 0x1F10DA9F, 0xEE00BB22, 0xDEC9CCDC, 0x00ADCDCC, 0xACCCCCCD, 0xCDCCCCBE\n"
"\t.4byte 0xBBCCCD02, 0x00CCBDEC, 0x01D6107F, 0xC90320E3, 0x53007330, 0xF1832063\n"
"\t.4byte 0xAFF9AC00, 0xAFFFFCF1, 0xCFCC00F9, 0x999CFAB9, 0xEC00D9BB, 0xABC1BCBB\n"
"\t.4byte 0x00DACCAE, 0xCEADCCCE, 0xCDABDEAA, 0xA9FFAD00, 0xFFFC9FDF, 0xC99F00DF\n"
"\t.4byte 0xAA9FDFCF, 0x9F01DF99, 0x9FDFBBBA, 0x0700ADDC, 0x9FDFDC02, 0x00BACAA9\n"
"\t.4byte 0xBF00A96B, 0xBDC9CBCB, 0x60EABCBC, 0x002901CD, 0xDCCECA0F, 0xCE01AEDC\n"
"\t.4byte 0xCABDCCCC, 0x6600BCCC, 0x0300E95A, 0x100340EC, 0xE3939183, 0xDBEA00BC\n"
"\t.4byte 0xCAECAABA, 0xEE00CAAA, 0xEEAABEEC, 0x009BBBBA, 0x111919EC, 0x1019AACA\n"
"\t.4byte 0x119B9110, 0xFF010E04, 0xAB00BA9F, 0xAAAA9DFD, 0x00EE9DFD, 0xBB9CFCEE\n"
"\t.4byte 0x111ADABB, 0x19C91103, 0x03911111, 0x002D14EB, 0xBCCABBEC, 0xFCCEBECA\n"
"\t.4byte 0xEEBECE16, 0xD4CC7311, 0xCD1B1123, 0xDCDCCD1C, 0xC911D111, 0xCBCCD021\n"
"\t.4byte 0xBCCCBC05, 0x0400DBCD, 0xCE3F11CC, 0x018001F0, 0x03F03003, 0x63100380\n"
"\t.4byte 0x00003F03, 0x6C160810, 0x03D023F0, 0x33102740, 0x00FF25D5, 0x034013AB\n"
"\t.4byte 0x33030093, 0x90FDC702, 0x50CF507E, 0xC0E71201, 0x3103101F, 0x39400340\n"
"\t.4byte 0x88331EC0, 0x8872711B, 0x77211B1D, 0x03100700, 0x10610B00, 0x00285507\n"
"\t.4byte 0x17107603, 0xDD1300DD, 0x40AA0730, 0x0710610B, 0x76030028, 0x00481710\n"
"\t.4byte 0x4488811B, 0xBB44411B, 0xF5B11B38, 0x3601F07F, 0xFFFB1A5F, 0x211BDB08\n"
"\t.4byte 0x68531022, 0x8220F177, 0x87030072, 0x7882F127, 0x82F17609, 0x770F4067\n"
"\t.4byte 0x00130078, 0x3382F172, 0x23DBF132, 0xDBF1330B, 0x34030042, 0x03100B10\n"
"\t.4byte 0x0F303450, 0x23031033, 0x032235F1, 0xBB24F122, 0x7F50A1BB, 0xF0D21FA6\n"
"\t.4byte 0x91DF167F, 0xBBF1FF07, 0xAAEF3F10, 0x05EF3F05, 0x8B03EF3F, 0xEF3F05EF\n"
"\t.4byte 0x003F05CA, 0x05EFDC0F, 0x5F35EF1F, 0x3805ABAD, 0xADAB03AC, 0x05AE5F05\n"
"\t.4byte 0xAF0F205F, 0x05AE3F05, 0x5FF0AD3F, 0xFC133F37, 0x30FD5330, 0xF10F1003\n"
"\t.4byte 0x4001F01F, 0xAB2E103F, 0x50E23610, 0xF00F1003, 0xDC00003F, 0x00CDBF00\n"
"\t.4byte 0xDCECDBCD, 0xCDCCBDBC, 0xBCBBCB00, 0xBBCBBDCE, 0xBBCB24DD, 0xBCBB8704\n"
"\t.4byte 0xDDBB6E03, 0xCDCCDC11, 0xCBECA804, 0xBEC114CB, 0x24BCC804, 0x001D00AE\n"
"\t.4byte 0x80060024, 0xBC1EDD1F, 0xFC02CBDB, 0x9A040500, 0x03CC1F00, 0xDCBDBBCB\n"
"\t.4byte 0x0708BCBD, 0xDC050C00, 0xCDBDBBCC, 0x00BE3100, 0x00CD4208, 0xDBCCDC24\n"
"\t.4byte 0xCD7800CB, 0x704630F7, 0x00061004, 0x2505DC21, 0x53006304, 0xBC6D2096\n"
"\t.4byte 0xDB1500EC, 0x5F007C00, 0x20DB7AEC, 0x1051001F, 0xFDDB071F, 0x59F1DF37\n"
"\t.4byte 0xAC03009C, 0x13040300, 0x0300CCF1, 0x1310AB68, 0x07CC5707, 0x9ADAEF9C\n"
"\t.4byte 0xCC9DA900, 0xADFFFFCA, 0xAFAA00FC, 0xFDFACF9A, 0xFA049AA9, 0xF9ABCBFD\n"
"\t.4byte 0xFFFFB507, 0xDDDDEB00, 0xBAAAAADE, 0xA9CF00CE, 0x9CFABDCB, 0xC900CEBA\n"
"\t.4byte 0x99CECB9F, 0x0EBEBAA9, 0xBECBBCB9, 0x6B105780, 0xD09B5B10, 0x17200F40\n"
"\t.4byte 0xCD4710AA, 0x00DAFDFB, 0xBDFDFAAB, 0xDBDFDB9A, 0xCFCBBA00, 0xAFAACBD9\n"
"\t.4byte 0xA9AD00BA, 0xBA9DBA9C, 0xDC00A99A, 0x99A9BEBD, 0x00B9CEDB, 0xA9CEC9AC\n"
"\t.4byte 0xB9BECBAA, 0xBECAAA00, 0xCEDBABC9, 0x4B0782BB, 0xCEAAAAAA, 0xEE7F00DF\n"
"\t.4byte 0xDDCECE00, 0x99ADA9BD, 0xACCA00BD, 0xCADBBDFC, 0xAC00BDAF, 0x9ABDACF9\n"
"\t.4byte 0x04BDA9AA, 0xCD9ABCB9, 0xBE2000FC, 0xDADD10DE, 0x9C9315A9, 0x20AAFACA\n"
"\t.4byte 0x2F05B9CF, 0x999FDFC9, 0x9FDF0CBA, 0xF3F8CBCB, 0xA9BD03B0, 0xBA470080\n"
"\t.4byte 0xADCDBCDC, 0xBD00AABD, 0xBDB9ABDB, 0x00BBADB9, 0xACBD9ABD, 0x9ADBA9BD\n"
"\t.4byte 0xDBAABD10, 0xDDCA7B05, 0x9A489FDF, 0x9ACB5300, 0xFCCB0705, 0xBAAB009C\n"
"\t.4byte 0xCABC9AFA, 0xDB1FB9CA, 0x7300ABDD, 0x03B053F0, 0xBFBABFFA, 0xF01FF0FC\n"
"\t.4byte 0xF01FF01F, 0x301FF01F, 0x7110001F, 0xF0ED051B, 0x00036003, 0x03F032F1\n"
"\t.4byte 0xFB0370FF, 0x1403B053, 0x12EB1BE3, 0xF31C2427, 0x7FF3E07F, 0x0F101F8C\n"
"\t.4byte 0xFFFFAFB1, 0x555B04F1, 0x04B4A155, 0x10244481, 0x0424F133, 0x23323481\n"
"\t.4byte 0x332412F1, 0x342F9032, 0x32140032, 0x23332200, 0x32342323, 0x23321C32\n"
"\t.4byte 0xF01FF033, 0xFA1F201F, 0x5555001B, 0x22341FB5, 0x0BA01B2B, 0x1F001BEB\n"
"\t.4byte 0x2232321B, 0x2433011B, 0x35F11B23, 0x0CE10424, 0x25F14232, 0x7F00E914\n"
"\t.4byte 0x33142235, 0x7F0025F1, 0x257F0035, 0x51008033, 0x33231B24, 0xF0321B22\n"
"\t.4byte 0x0B203300, 0x3F903700, 0x45454233, 0x54542309, 0x45060054, 0x71070034\n"
"\t.4byte 0x810F1023, 0x540D107F, 0x07004454, 0x26003559, 0x801D3034, 0x0034F11F\n"
"\t.4byte 0x0034507F, 0x7F00247F, 0xA1323444, 0xFF00B47C, 0x13110B01, 0x7300BB10\n"
"\t.4byte 0x331F2323, 0xCD004232, 0xDF30D400, 0x1FF06F91, 0x701FE0FF, 0x01FB10BF\n"
"\t.4byte 0x110B1103, 0x22EB2413, 0x019B2007, 0x0001AE0C, 0x00001FB1, 0x0019F910\n"
"\t.4byte 0x001B9F10, 0x00F9F124, 0x201BB903, 0x80F1000B, 0x9FB91300, 0xFB9F1001\n"
"\t.4byte 0xFB101601, 0x9F2700B9, 0x0B002700, 0x30B97F9F, 0x200B0003, 0x201B003B\n"
"\t.4byte 0x202B0023, 0x4710FF33, 0x4B104300, 0x5B100B10, 0x6B202710, 0x00C07310\n"
"\t.4byte 0x11BFB27B, 0x22122311, 0x34230922, 0xDFF25555, 0xAF102333, 0x22AA0DBA\n"
"\t.4byte 0x1F50DF10, 0x01547201, 0x90F8457A, 0x5B5F9107, 0x30C3FCAB, 0xEBBBBB01\n"
"\t.4byte 0xDCED1B00, 0xDDDE1BEC, 0x001B7CDD, 0x20DD081E, 0x20181D01, 0x00E9E901\n"
"\t.4byte 0xFFFF1BE9, 0xCDCD1BEF, 0xCC1BEC00, 0xBB1BECCB, 0x1BEB00BC, 0x1BECBCCC\n"
"\t.4byte 0x10B0CCBC, 0x0700ED07, 0xCBCB0B30, 0xCD541BEB, 0x00CC4700, 0x1F00CD0F\n"
"\t.4byte 0x0090DCBB, 0x21ECBD1F, 0x77F9EC63, 0xBFAF041B, 0x07FA1BF9, 0x05F9F995\n"
"\t.4byte 0xFFF919BF, 0xC90700EA, 0xBB400B30, 0x1BF90710, 0x1BFBB9F9, 0x00C9F92D\n"
"\t.4byte 0x0700C907, 0x10BB0F10, 0x1BF9000B, 0x11FF9F92, 0x9F019F93, 0xAFFF931C\n"
"\t.4byte 0x0B00931E, 0xBFFFF900, 0x9BFA9F1C, 0x1EC10F1F, 0x5B101FFD, 0x0110BFF0\n"
"\t.4byte 0x5AE0437F, 0x3983F99F, 0x00000083, 0x194C0000, 0x05DB01B9, 0x1A5D0DFD\n"
"\t.4byte 0x77DF05DC, 0x3A530198, 0x4B3A3ED6, 0x5BDE537C, 0x67FF5FFF, 0x77FE200F\n"
"\t.4byte 0x4DD86F37, 0x33DF212B, 0x19B11A77, 0x7DE211FF, 0x623876F5, 0x53F00B63\n"
"\t.4byte 0x00004914, 0x00100010, 0xF0000038, 0x9001F001, 0x00111101, 0xAFB10000\n"
"\t.4byte 0x5BF10000, 0xA1001000, 0x111DF0B5, 0x00FFFF11, 0x5555FFFF, 0x33335555\n"
"\t.4byte 0xF0333320, 0xFA00001F, 0x0000011B, 0x00011FB5, 0x9401193B, 0x88F11100\n"
"\t.4byte 0xD0380380, 0x0442330F, 0x33233423, 0x33060042, 0x10347423, 0x300F1006\n"
"\t.4byte 0x11003311, 0x00F52333, 0x7003F04B, 0xB3AB0003, 0x303B4700, 0x7D10B8B3\n"
"\t.4byte 0x70030010, 0x23A31001, 0x22072222, 0xBBBBBBBB, 0x0110BB10, 0x39541F90\n"
"\t.4byte 0x00F3A300, 0xAF00B947, 0x10F21111, 0xB011F103, 0x915F1001, 0xBB7300FF\n"
"\t.4byte 0xDB0300B8, 0x1F31FFF0, 0xDDDD6F10, 0xE0DD60DD, 0xFFB2001F, 0xEB00001A\n"
"\t.4byte 0xED7300BC, 0x4310BF20, 0x035003F0, 0xDE01DCDD, 0xDDEDDDCD, 0x4B00DCEC\n"
"\t.4byte 0xCDDDED01, 0xECDCDECE, 0xDC000810, 0xCEDCDECD, 0x7BEDCDED, 0xF04310DD\n"
"\t.4byte 0x40037003, 0xCB01EE47, 0x21B0AF00, 0x8F90101B, 0xEEEE4710, 0xF1E9EEEE\n"
"\t.4byte 0x1001301F, 0x0300DE43, 0x1FF11ABB, 0x600110C1, 0xFFFFFD9F, 0x9F00DFED\n"
"\t.4byte 0x9F00DF54, 0xDF9F00EF, 0xEDCF9F00, 0x1F50DD7A, 0xBFF01311, 0x00DF1F90\n"
"\t.4byte 0x00AABD06, 0x1F00BC1F, 0xBC1F00BD, 0x15BD1F00, 0x00DFDDDD, 0x5F00EF1F\n"
"\t.4byte 0xD51600DF, 0x3F005FF0, 0xBD3F00BE, 0xF0BD1F01, 0x3FF0C73F, 0xBBBD3F30\n"
"\t.4byte 0x917FD0BB, 0xC70B115F, 0x5FF01F70, 0x60DBBBBB, 0x201FF2BF, 0x00F06701\n"
"\t.4byte 0xF08F0203, 0x011AF0DA, 0x0D0B01FF, 0x99999999, 0x01301FF2, 0x4B03000A\n"
"\t.4byte 0xFD03009F, 0xD94A2009, 0x037003F0, 0xF04310FC, 0x10017001, 0x7003F043\n"
"\t.4byte 0x2B000003, 0x0400DFA0, 0x900300F9, 0xDF0189F0, 0x504300FE, 0x301DF0AF\n"
"\t.4byte 0x20AB1043, 0x0001F04A, 0xBBCCBC02, 0x01CBCBBC, 0xBC00CC4F, 0xCCCCCCBB\n"
"\t.4byte 0x02BCDDCB, 0xBCDCCCCB, 0x0B00CBCC, 0xDCBC30BC, 0x1F200400, 0xDCCDBBCB\n"
"\t.4byte 0xDC1F1080, 0xCCBCCDCB, 0xDC02BBCC, 0xBDCCDBCB, 0xBBA501CC, 0xD3E2BB41\n"
"\t.4byte 0xCD11119B, 0xE15F33FE, 0x71F0B311, 0x9FB101B0, 0x03009F9F, 0xDCF1FF00\n"
"\t.4byte 0x9AF1CDDA, 0xF1D900AA, 0xF1AA99AF, 0xFF00FFFC, 0xADCBCFF1, 0x68FFFBF1\n"
"\t.4byte 0x101F14BF, 0x4B00CBDF, 0x00AAAACD, 0xAA9CDCAA, 0x99CDBAAA, 0xACCBAA00\n"
"\t.4byte 0xCBAAA9BA, 0x509B40FF, 0xDCEDDD1F, 0x00DDAACC, 0xCD9DCDCC, 0xBDA9CCCC\n"
"\t.4byte 0xAACCCC00, 0xAABBCCCD, 0xF0CC60BD, 0xF101C07F, 0xF1FDBA9C, 0xBAA9AC00\n"
"\t.4byte 0xACB9ACF1, 0xC9AC10F1, 0xBB0B00CC, 0x80DA9CF1, 0xCCBB0300, 0xEEDB9AF1\n"
"\t.4byte 0x99AF00FF, 0xDDFFFD99, 0xFB00AABD, 0xBABCFFFF, 0x00AAFFFF, 0xBDDBFFAA\n"
"\t.4byte 0xCBBDFFAB, 0xBCDFAC01, 0xAABBCDDD, 0x00806300, 0x9DCBCB6F, 0xDFBCBCBD\n"
"\t.4byte 0x2801CA40, 0x9BCCCCBA, 0xDC26DCCD, 0xBA872099, 0xC071F0BC, 0xED00C97F\n"
"\t.4byte 0xFFE9F1EE, 0x00FC91DF, 0xAA91BBCF, 0xFC91FFBB, 0x139AFF2C, 0xCC1310E3\n"
"\t.4byte 0xDDDE1F00, 0xBB870189, 0x7E00FFFD, 0x9401CFFF, 0xAA03D480, 0xFFBCBCBF\n"
"\t.4byte 0x10BBCBCF, 0x1E00FF1E, 0x17101FE0, 0x118F00CD, 0xC911C0D1, 0xCBCCD021\n"
"\t.4byte 0xCDBCCCBC, 0x0400DB46, 0xF08888CC, 0x0801A001, 0x03F08071, 0x63100380\n"
"\t.4byte 0x10000008, 0x20887E08, 0xB023F003, 0x10274003, 0x883B1033, 0x18AB00AB\n"
"\t.4byte 0x00980340, 0xC7028803, 0x50FA7E90, 0x120150CF, 0x101FC0E7, 0x03408103\n"
"\t.4byte 0x1EC08089, 0x711B4388, 0x3A1B4372, 0x07007721, 0x0B000310, 0x23071061\n"
"\t.4byte 0x760300AB, 0x00DD1710, 0x0730DD13, 0x61540B40, 0x00230710, 0x17107603\n"
"\t.4byte 0x31001B43, 0x411B4433, 0x701BBB44, 0xF07FF5B1, 0x1A5F3601, 0x10DBFFFB\n"
"\t.4byte 0x1022211B, 0xF1776353, 0x00724032, 0xF1273703, 0x12767332, 0x406732F1\n"
"\t.4byte 0x0073770F, 0xF1007213, 0xF1323332, 0x163323DB, 0x0042DBF1, 0x0B103403\n"
"\t.4byte 0xA0340310, 0x10330F30, 0x35F12303, 0xF1072222, 0xA1BBBB24, 0x1FA67F50\n"
"\t.4byte 0x16A57FF0, 0xFF0791DF, 0x3F10BBF1, 0x553F05EF, 0xEF3F05EF, 0x05EF3F03\n"
"\t.4byte 0x3F05EF3F, 0xDC0F0095, 0xEF1F05EF, 0x05AD5F35, 0x03AC5738, 0x5F05ADAB\n"
"\t.4byte 0x205F05AE, 0x5F3F050F, 0xAD3F05AE, 0x3F375FF0, 0x5330FC13, 0x10FB0330\n"
"\t.4byte 0xF01FF10F, 0x103F4001, 0x3610AB2E, 0x10C40350, 0x003FF00F, 0xBF00DC00\n"
"\t.4byte 0xDB00CDCD, 0xBDBCDCEC, 0x00CBCDCC, 0xBDCEBCBB, 0xCBDDBBCB, 0x8704BB44\n"
"\t.4byte 0x03CDBCBB, 0x23DCDD6E, 0xA804CDCC, 0x14CBCBEC, 0x7CC804C1, 0x00AE24BC\n"
"\t.4byte 0x0024001D, 0xDD1F8006, 0xCBDB3CBC, 0x0500FC02, 0x1F009A04, 0xBB06CBCC\n"
"\t.4byte 0xBCBDDCBD, 0x0C000708, 0xBBCC0ADC, 0x3100CDBD, 0xCD0800BE, 0xDC240085\n"
"\t.4byte 0x00CBDBCC, 0x4630CD78, 0x100470EB, 0xDC210006, 0x00CC2505, 0x962E051E\n"
"\t.4byte 0xECBC6D10, 0x00DB1500, 0xEC5F007C, 0x1F20DB7D, 0x1F105100, 0x8B18E103\n"
"\t.4byte 0x6A0300DC, 0x1903009A, 0x0300FCB7, 0xFB0300CF, 0x247D14C0, 0xDCBCDDBB\n"
"\t.4byte 0x00DDB9AA, 0xCAAA99AC, 0xAFFFFFCD, 0xFDCBDB00, 0xFFFFCCBA, 0xBABA3CAB\n"
"\t.4byte 0x1F30B307, 0xF004FA24, 0x9C00B9DA, 0xAABA9AA9, 0x00BAAA9B, 0xBAA9BFFC\n"
"\t.4byte 0xBAA9999A, 0xAC4300AC, 0x409C03C0, 0xCC0B1003, 0xDBAA00A9, 0xAABCB9FF\n"
"\t.4byte 0xDC00C9BA, 0xBBA9ABCC, 0x40DAAAAB, 0xBCA610FB, 0xDEEEDBCC, 0xEEED01DD\n"
"\t.4byte 0xDDDFDDEE, 0x20D5049B, 0x4004B9DF, 0xBDBFFAAD, 0xDFFA00AB, 0xCDFAB9BB\n"
"\t.4byte 0xBC00B99B, 0xCDBA9AAB, 0xE0B9ABCC, 0x00057F40, 0xAA9DEA04, 0x00A9BD9A\n"
"\t.4byte 0xAABDC99A, 0x9ABDAAB9, 0xBDCFFC18, 0x1F208000, 0x00DDCBCB, 0xA99CCDCA\n"
"\t.4byte 0x99AAACDC, 0x04FABD21, 0xBCDFAB87, 0xAD5500AB, 0x16AB5700, 0xBF19CC13\n"
"\t.4byte 0x00DA0300, 0x00CD5503, 0x0300DC03, 0xC90300BD, 0xC9080710, 0x00ADFDDD\n"
"\t.4byte 0xFFFFDCE7, 0xFBCABF00, 0xBC9CADFB, 0xBDAC00FF, 0xBDACCDC9, 0xCA00AAA9\n"
"\t.4byte 0xEDCCBA9D, 0x00AABDFF, 0xBBAAAB9A, 0xBCDCBA9B, 0xBBF50080, 0xBDBFCB9A\n"
"\t.4byte 0x0184CCAD, 0xDDDEED72, 0xCDBE00BC, 0x4300BDE9, 0x100340EA, 0x1003500B\n"
"\t.4byte 0x0300EC0F, 0xBABFFAFF, 0xF01FF0BF, 0xF01FF01F, 0x301FF01F, 0x10001C1F\n"
"\t.4byte 0xF0D1091B, 0x00036003, 0xF0327FF1, 0xFB037003, 0x1603B053, 0x11EB1BFF\n"
"\t.4byte 0x3746F96D, 0x7FF37FF3, 0x0F101F6C, 0x6F07AFB1, 0x55555B04, 0x8104B4A1\n"
"\t.4byte 0x33102444, 0x810424F1, 0xF1233234, 0x32332412, 0x32342F90, 0x00321400\n"
"\t.4byte 0x23233322, 0x32323423, 0x3323321C, 0x1FF01FF0, 0x1BFA1F20, 0xB5555500\n"
"\t.4byte 0x2B22341F, 0xEB0BA01B, 0x1B1F001B, 0x1B223232, 0x23243301, 0x2435F11B\n"
"\t.4byte 0x320CE104, 0x1425F142, 0x357F00E9, 0xF1331422, 0x357F0025, 0x33257F00\n"
"\t.4byte 0x24510080, 0x2233231B, 0x00F0321B, 0x000B2033, 0x333F9037, data_08FFF000 + 0x455542\n"
"\t.4byte 0x54545423, 0x34450600, 0x23710700, 0x7F810F10, 0x54540D10, 0x59070044\n"
"\t.4byte 0x34260035, 0x1F801D30, 0x7F0034F1, 0x7F003450, 0x447F0024, 0x7CA13234\n"
"\t.4byte 0x01FF00B4, 0x1013110B, 0x237300BB, 0x32331F23, 0x00CD0042, 0x91DF30D4\n"
"\t.4byte 0xFF1FF06F, 0xBF701FE0, 0x0301FB10, 0x13110B11, 0x0722EB24, 0x0C019B20\n"
"\t.4byte 0xB10001AE, 0x1000001F, 0x100019F9, 0x24001B9F, 0x0300F9F1, 0x0B201BB9\n"
"\t.4byte 0x0080F100, 0x019FB913, 0x01FB9F10, 0xB9FB1016, 0x009F2700, 0x9F0B0027\n"
"\t.4byte 0x0330B97F, 0x3B200B00, 0x23201B00, 0x33202B00, 0x004710FF, 0x104B1043\n"
"\t.4byte 0x105B100B, 0x106B2027, 0x7B00C073, 0x1111BFB2, 0x22221223, 0x55342309\n"
"\t.4byte 0x33DFF255, 0xBAAF1023, 0x1022AA0D, 0x011F50DF, 0x7A015472, 0x0790F845\n"
"\t.4byte 0xAB5B5F91, 0x0130C3FC, 0x00EBBBBB, 0xECDCED1B, 0xDDDDDE1B, 0x1E001B5C\n"
"\t.4byte 0x281E401A, 0xE90110FB, 0x1BE900E9, 0x1BEFFFFF, 0xEC00CDCD, 0xECCBCC1B\n"
"\t.4byte 0x00BCBB1B, 0xBCCC1BEB, 0xCCBC1BEC, 0xED0710B0, 0x0B300700, 0x1BEBCBCB\n"
"\t.4byte 0x4700CD54, 0xCD0F00CC, 0xDCBB1F00, 0xBD1F0090, 0xEC6321EC, 0x041B77F9\n"
"\t.4byte 0x1BF9BFAF, 0xF99507FA, 0x19BF05F9, 0x00EAFFF9, 0x0B30C907, 0x0710BB40\n"
"\t.4byte 0xB9F91BF9, 0xF92D1BFB, 0xC90700C9, 0x0F100700, 0x000B10BB, 0x9F921BF9\n"
"\t.4byte 0x9F9311FF, 0x931C9F01, 0x931EAFFF, 0xF9000B00, 0x9F1CBFFF, 0x0F1F9BFA\n"
"\t.4byte 0x1FFD1EC1, 0xBFF05B10, 0x437F0110, 0xF99F5AE0, 0x00833983, 0x1D6C0000\n"
"\t.4byte 0x55AE4D8D, 0x6A5459F0, 0x77DF55CF, 0x3A53496C, 0x4B3A3ED6, 0x5BDE537C\n"
"\t.4byte 0x67FF5FFF, 0x73FF200F, 0x4ED16F37, 0x2FBF212B, 0x19B11A77, 0x7DE211FF\n"
"\t.4byte 0x623876F5, 0x4BEF1303, 0x000055AE, 0x00100010, 0xF0000038, 0x9001F001\n"
"\t.4byte 0x00111101, 0xAFB10000, 0x5BF10000, 0xA1001000, 0x111DF0B5, 0x00FFFF11\n"
"\t.4byte 0x5555FFFF, 0x33335555, 0xF0333320, 0xFA00001F, 0x0000011B, 0x00011FB5\n"
"\t.4byte 0x9401193B, 0x88F11100, 0xD0380380, 0x0442330F, 0x33233423, 0x33060042\n"
"\t.4byte 0x10347423, 0x300F1006, 0x11003311, 0x00F52333, 0x7003F04B, 0xB3AB0003\n"
"\t.4byte 0x303B4700, 0x7D10B8B3, 0x70030010, 0x23A31001, 0x22072222, 0xBBBBBBBB\n"
"\t.4byte 0x0110BB10, 0x39541F90, 0x00F3A300, 0xAF00B947, 0x10F21111, 0xB011F103\n"
"\t.4byte 0x915F1001, 0xBB7300FF, 0xDB0300B8, 0x1F31FFF0, 0xDDDD6F10, 0xE0DD60DD\n"
"\t.4byte 0xFFB2001F, 0xEB00001A, 0xED7300BC, 0x4310BF20, 0x035003F0, 0xDE01DCDD\n"
"\t.4byte 0xDDEDDDCD, 0x4B00DCEC, 0xCDDDED01, 0xECDCDECE, 0xDC000810, 0xCEDCDECD\n"
"\t.4byte 0x7BEDCDED, 0xF04310DD, 0x40037003, 0xCB01EE47, 0x21B0AF00, 0x8F90101B\n"
"\t.4byte 0xEEEE4710, 0xF1E9EEEE, 0x1001301F, 0x0300DE43, 0x1FF11ABB, 0x600110C1\n"
"\t.4byte 0xFFFFFD9F, 0x9F00DFED, 0x9F00DF54, 0xDF9F00EF, 0xEDCF9F00, 0x1F50DD7A\n"
"\t.4byte 0xBFF01311, 0x00DF1F90, 0x00AABD06, 0x1F00BC1F, 0xBC1F00BD, 0x15BD1F00\n"
"\t.4byte 0x00DFDDDD, 0x5F00EF1F, 0xD51600DF, 0x3F005FF0, 0xBD3F00BE, 0xF0BD1F01\n"
"\t.4byte 0x3FF0C73F, 0xBBBD3F30, 0x917FD0BB, 0xC70B115F, 0x5FF01F70, 0x60DBBBBB\n"
"\t.4byte 0x201FF2BF, 0x00F06701, 0xF08F0203, 0x011AF0DA, 0x0D0B01FF, 0x99999999\n"
"\t.4byte 0x01301FF2, 0x4B03000A, 0xFD03009F, 0xD94A2009, 0x037003F0, 0xF04310FC\n"
"\t.4byte 0x10017001, 0x7003F043, 0x2B000003, 0x0400DFA0, 0x900300F9, 0xDF0189F0\n"
"\t.4byte 0x504300FE, 0x301DF0AF, 0x20AB1043, 0x0001F04A, 0xBBCCBC02, 0x01CBCBBC\n"
"\t.4byte 0xBC00CC4F, 0xCCCCCCBB, 0x02BCDDCB, 0xBCDCCCCB, 0x0B00CBCC, 0xDCBC30BC\n"
"\t.4byte 0x1F200400, 0xDCCDBBCB, 0xDC1F1080, 0xCCBCCDCB, 0xDC02BBCC, 0xBDCCDBCB\n"
"\t.4byte 0xBBA501CC, 0xD3E2BB41, 0xCD11119B, 0xE05F33FE, 0x9893B311, 0x110003F0\n"
"\t.4byte 0x049D9FB1, 0x9F9FB19D, 0xDB2811FF, 0xA9AA00AA, 0x9B9ABABA, 0x9B00D9FB\n"
"\t.4byte 0xB9BDFB9E, 0x39CFDBBE, 0x1F14CFCC, 0xE710DF10, 0x0100AAAA, 0xAAAAA900\n"
"\t.4byte 0xA9AA9B9A, 0x9A9F01B9, 0xB99DEB9E, 0x001F60BF, 0xAACCDCED, 0xAACDCCDD\n"
"\t.4byte 0xCCCCCD00, 0xCCCCBDAA, 0xCCCD029A, 0xCCBDC9BB, 0xB0B17F10, 0x10A10300\n"
"\t.4byte 0x007FF06B, 0x00DFBF10, 0xDBFCDFDC, 0xBFDADFDC, 0xC1CFCB00, 0xABAFACFD\n"
"\t.4byte 0x9F990099, 0x9FBBBBBF, 0xAA10AACF, 0x0700DF9F, 0xCFCA9BDC, 0xDADCBB00\n"
"\t.4byte 0xDACFDBEF, 0xABFC00DF, 0xC999CECB, 0xBB00BCBE, 0xAAEBEC9B, 0x929E99AA\n"
"\t.4byte 0xE99FE200, 0xBDEB6B00, 0x01BD2001, 0xCDEBBCBC, 0x00CECBCB, 0xCD9C000F\n"
"\t.4byte 0xCDA9DCDC, 0x10FDCCCB, 0x6073F013, 0x10012003, 0x9FB00267, 0x01B7DF10\n"
"\t.4byte 0xE3D3CC73, 0x109FF100, 0x401FF067, 0xCBCD171F, 0xFC6700BC, 0x1FF04A12\n"
"\t.4byte 0xCD78CB32, 0xD1118F00, 0xD021C911, pad_BC3A00 + 0x91cc, 0xDBCDBCCC, 0x88CC0400\n"
"\t.4byte 0x01F0CE88, 0x800801A0, 0x038003F0, 0x2F086310, 0x08100000, 0xF0032088\n"
"\t.4byte 0x4003B023, 0x3310D527, 0x00883B10, 0x034018AB, 0x7F030098, 0x90C70288\n"
"\t.4byte 0x50CF507E, 0xC0E71201, 0x5003101F, 0x89034081, 0x63881EC0, 0x3541511B\n"
"\t.4byte 0x63630300, 0x0066311B, 0x40555003, 0x0B00530F, 0x611B6356, 0x1BDD3605\n"
"\t.4byte 0x03003331, 0x0E030063, 0x611BDD66, 0x13600B00, 0x40610700, 0x33270036\n"
"\t.4byte 0x66611B66, 0xB11B38BB, 0x01F07FF5, 0xFB1A5F36, 0x1BDB08FF, 0x47107771\n"
"\t.4byte 0x01F13353, 0xF1635337, 0x00663337, 0x0B00AA03, 0x36030063, 0x10330300\n"
"\t.4byte 0x00803613, 0xDBF13203, 0xDBF13323, 0x0300425B, 0x100B1034, 0x0F303403\n"
"\t.4byte 0xDB002F00, 0x35F12333, 0x0FF12222, 0xA1BBBB24, 0x1FA67F50, 0xDF167FF0\n"
"\t.4byte 0xFF07914A, 0x3F10BBF1, 0xEF3F05EF, 0xEF3F05AB, 0x05EF2002, 0x3F05EF3F\n"
"\t.4byte 0xDC2A0F00, 0xEF1F05EF, 0x05AD5F35, 0x03AEAC38, 0x5F05ADAB, 0x205F05AE\n"
"\t.4byte 0xAE3F050F, 0xAD3F05BF, 0x3F375FF0, 0x5330FC13, 0x0F100330, 0xF01FF1F7\n"
"\t.4byte 0x103F4001, 0x3610AB2E, 0x0F100350, 0x003FF088, 0xBF00DC00, 0x00DBCDCD\n"
"\t.4byte 0xBDBCDCEC, 0xBBCBCDCC, 0xBDCEBC00, 0xCBDDBBCB, 0x870490BB, 0x6E03BCBB\n"
"\t.4byte 0xCCDCDDBB, 0xA804CD46, 0x14CBCBEC, 0xBCC804C1, 0x00AE24F8, 0x0024001D\n"
"\t.4byte 0xDD1F8006, 0x03BADBBC, 0x0500BC93, 0x1F009A04, 0xDCB403CC, pad_BC3A00 + 0x8335\n"
"\t.4byte 0xDC0C0007, 0x00CDAD03, 0x00BE5031, 0x2400CD08, 0xCBDBCCDC, 0xCD7800BD\n"
"\t.4byte 0x04704630, 0x21000610, 0x722505DC, 0x051E00CC, 0xBC6D102E, 0xDB1500EC\n"
"\t.4byte 0x007C00CF, 0x20DBEC5F, 0x1051001F, 0xD5DB071F, 0x07108B18, 0x9B0300AB\n"
"\t.4byte 0x00FC9748, 0x00BD5403, 0xDB64DF03, 0xB9E9039A, 0xA99A00A9, 0x9BB9A9E9\n"
"\t.4byte 0xFB009BEB, 0xDEBCFCCF, 0x54CDFDCB, 0xCD1F40BD, 0x10BA1D00, 0xC09AA903\n"
"\t.4byte 0x23000300, 0xBC9BFB99, 0x9C2AFCA9, 0xFD4740BE, 0x00BA0300, 0x40A09C03\n"
"\t.4byte 0x0750AC0F, 0xCBBDFDCB, 0xBCFC00BC, 0xCAFACDFD, 0xF90099BF, 0xFBBB9999\n"
"\t.4byte 0x10AABBB9, 0x50AAA9FA, 0xBEFDAD07, 0xFDAC00BE, 0xECBABBBD, 0xEC00BEBC\n"
"\t.4byte 0xC9BCEBCB, 0x0AB9CEBE, 0xBA99E99A, 0x10BA1F40, 0x11D5DE7F, 0xADA000A0\n"
"\t.4byte 0x00BDA000, 0xA000FD7C, 0xA000BD5C, 0x95A000DD, 0xAAC2409B, 0x2300A9FB\n"
"\t.4byte 0xBDA000DE, 0x1CEDA000, 0x00AA1306, 0x0380EA03, 0xEC0300E9, 0xAAEE0300\n"
"\t.4byte 0x00BD0300, 0xA000FDA0, 0xADA000BD, 0xCDA000AD, 0x00BD7800, 0xCB075078\n"
"\t.4byte 0xFD55A000, 0x00BFA000, 0xA00099A0, 0x56A000BB, 0xBBA000AA, 0x00AA1F00\n"
"\t.4byte 0xEB43101F, 0x104B40FF, 0x105B1053, 0x10131063, 0xBABFFA07, 0x1FF0FCBF\n"
"\t.4byte 0x1FF01FF0, 0x1FF01FF0, 0x10001F30, 0xED051B71, 0x036003F0, 0xF032F100\n"
"\t.4byte 0x0370FF03, 0x03B053FB, 0xEB1BFF16, 0x1C248711, 0xF3E07FF3, 0x101F8C7F\n"
"\t.4byte 0xFFAFB10F, 0x5B04F1FF, 0xB4A15555, 0x24448104, 0x24F13310, 0x32348104\n"
"\t.4byte 0x2412F123, 0x2F903233, 0x14003234, 0x33220032, 0x34232323, 0x321C3232\n"
"\t.4byte 0x1FF03323, 0x1F201FF0, 0x55001BFA, 0x341FB555, 0xA01B2B22, 0x001BEB0B\n"
"\t.4byte 0x32321B1F, 0x33011B22, 0xF11B2324, 0xE1042435, 0xF142320C, 0x00E91425\n"
"\t.4byte 0x1422357F, 0x0025F133, 0x7F00357F, 0x00803325, 0x231B2451, 0x321B2233\n"
"\t.4byte 0x203300F0, 0x9037000B, 0x4542333F, 0x54230945, 0x06005454, 0x07003445\n"
"\t.4byte 0x0F102371, 0x0D107F81, 0x00445454, 0x00355907, 0x1D303426, 0x34F11F80\n"
"\t.4byte 0x34507F00, 0x00247F00, 0x3234447F, 0x00B47CA1, 0x110B01FF, 0x00BB1013\n"
"\t.4byte 0x1F232373, 0x00423233, 0x30D400CD, 0xF06F91DF, 0x1FE0FF1F, 0xFB10BF70\n"
"\t.4byte 0x0B110301, 0xEB241311, 0x9B200722, 0x01160401, 0x001FB100, 0x19F91000\n"
"\t.4byte 0x1B9F1000, 0xF9F12400, 0x1BB90300, 0xF1000B20, 0xB9130080, 0x9F10019F\n"
"\t.4byte 0x101601FB, 0x2700B9FB, 0x0027009F, 0xB97F9F0B, 0x0B000330, 0x1B003B20\n"
"\t.4byte 0x2B002320, 0x10FF3320, 0x10430047, 0x100B104B, 0x2027105B, 0xC073106B\n"
"\t.4byte 0xBFB27B00, 0x12231111, 0x23092222, 0xF2555534, 0x102333DF, 0xAA0DBAAF\n"
"\t.4byte 0x50DF1022, 0x5472011F, 0xF8457A01, 0x5F910790, 0xC3FCAB5B, 0xBBBB0130\n"
"\t.4byte 0xED1B05EB, 0x041BECDC, 0x1E001B63, 0x1E401A70, 0x0120181D, 0x1BE9E9E9\n"
"\t.4byte 0xEFFFFF00, 0xECCDCD1B, 0xCBCC001B, 0xBCBB1BEC, 0xCC021BEB, 0xBC1BECBC\n"
"\t.4byte 0xED0710CC, 0x300700C1, 0xEBCBCB0B, 0x4700CD1B, 0x0F00CC52, 0xBB1F00CD\n"
"\t.4byte 0xBD1F00DC, 0x6321EC40, 0x1B77F9EC, 0xF910BFAF, 0x9507FA1B, 0x19BFF9F9\n"
"\t.4byte 0xEAFFF915, 0x30C90700, 0x0710BB0B, 0xF91BF900, 0xF91BFBB9, 0x0700B4C9\n"
"\t.4byte 0x100700C9, 0x0B10BB0F, 0x92001BF9, 0x9311FF9F, 0x041C9F9F, 0x1EAFFF93\n"
"\t.4byte 0xF90B0093, 0x1CBF00FF, 0x1F9BFA9F, 0xFD3F1EC1, 0xF05B101F, 0x7F0110BF\n"
"\t.4byte 0xF99F5A43, 0x83398083\n"
);
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_banim_a.gap1, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_001_5E37CC\n"
"frontier_df4_banim_a_001_5E37CC:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_005_0DF388 + 0x3C, 0x00000003, ekrDispUPMain, 0x00000000, 0x00000000\n"
"	.global data_085E37E4\n"
"data_085E37E4:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_005_0DF388 + 0x48, 0x00000003, EfxHpBar_DeclineToDeath, 0x00000003, EfxHpBar_MoveCameraOnEnd\n"
"	.4byte 0x00000003, EfxHpBar_WaitCameraMove, 0x00000000, 0x00000000\n"
"	.global data_085E380C\n"
"data_085E380C:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_005_0DF388 + 0x54, 0x00000003, EfxHpBarResire_WaitOnCurrentSide, 0x00000003, EfxHpBarResire_SetAnotherSide\n"
"	.4byte 0x00000003, EfxHpBarResire_DeclineToDeath, 0x00000003, EfxHpBar_MoveCameraOnEnd, 0x00000003, EfxHpBar_WaitCameraMove\n"
"	.4byte 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_EfxAvoid[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_005_0DF388 + 0x64)), PROC_REPEAT(EfxAvoidMain), PROC_REPEAT(EfxHpBar_MoveCameraOnEnd), PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap1, \"aw\", %progbits\n"
"	.global data_085E386C\n"
"data_085E386C:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_005_0DF388 + 0x70, 0x00000003, EfxHPBarLiveMain, 0x00000003, EfxHpBar_MoveCameraOnEnd\n"
"	.4byte 0x00000003, EfxHpBar_WaitCameraMove, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxNoDamage[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_005_0DF388 + 0x80)), PROC_REPEAT(EfxNoDamageMain), PROC_REPEAT(EfxHpBar_MoveCameraOnEnd), PROC_REPEAT(EfxHpBar_WaitCameraMove),
    PROC_END,
};
struct ProcCmd ProcScr_efxNoDamageYure[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_005_0DF388 + 0x8C)), PROC_REPEAT(EfxNoDamageYureMain), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap1, \"aw\", %progbits\n"
"	.4byte 0x00000001, gEfxNoDmgBgShakeOff + 0x1C, 0x000A000F, 0x00000000, 0x00000003, EfxStatusCHGMain\n"
"	.4byte 0x00000003, EfxHpBar_MoveCameraOnEnd, 0x00000003, EfxHpBar_WaitCameraMove, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, gEfxNoDmgBgShakeOff + 0x2C, 0x00000003, efxDeadEvent_Loop_A, 0x00000003, efxDeadEvent_Loop_B\n"
"	.4byte 0x00000003, efxDeadEvent_Loop_C, 0x00000003, efxDeadEvent_Loop_D, 0x00000003, efxDeadEvent_Loop_E\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, gEfxNoDmgBgShakeOff + 0x3C, 0x00000003, efxDead_Loop_A\n"
"	.4byte 0x00000003, efxDead_Loop_B, 0x00000000, 0x00000000, 0x00000001, gEfxNoDmgBgShakeOff + 0x44\n"
"	.4byte 0x00000003, EfxDeadPikaMain, 0x00000000, 0x00000000, 0x00000001, gEfxNoDmgBgShakeOff + 0x50\n"
"	.4byte 0x00000003, EfxDeadAlphaMain, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxDeadDragonAlpha[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)gEfxNoDmgBgShakeOff + 0x60)), PROC_REPEAT(EfxDeadDragonAlphaMain), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap1, \"aw\", %progbits\n"
"	.4byte 0x00000001, gEfxNoDmgBgShakeOff + 0x74, 0x00000003, efxFarAttack_Init, 0x00000003, efxFarAttack_ScrollIn\n"
"	.4byte 0x00000003, efxFarAttack_ScrollOut, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxQuakePure[] __attribute__((section(".data.frontier_df4_banim_a.gap1"))) = {
    PROC_NAME((void*)((u8*)gEfxbattle_6 + 0x132)), PROC_REPEAT(efxQuakePure_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap1, \"aw\", %progbits\n"
"	.4byte gEfxbattle_0, 0x00000000, gEfxQuakeVecs, 0x00000000, gEfxbattle_1, 0x00000000\n"
"	.4byte gEfxQuakeVecs2, 0x00000000, gEfxbattle_2, 0x00000000, gEfxbattle_3, 0x00000000\n"
"	.4byte gEfxbattle_4 + 0xB2, 0x00000000, gEfxbattle_4 + 0xC4, 0x00000000, gEfxbattle_4 + 0xE6, 0x00000000\n"
"	.4byte gEfxbattle_4 + 0xF8, 0x00000000, gEfxbattle_4 + 0x10A, 0x00000000, gEfxbattle_4 + 0x11C, 0x00000000\n"
"	.4byte gEfxbattle_4 + 0x1D2, 0x00000000, gEfxbattle_4 + 0x1E4, 0x00000000, gEfxbattle_4 + 0x1F6, 0x00000000\n"
"	.4byte gEfxbattle_4 + 0x208, 0x00000000\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_002_5E3AD4\n"
"frontier_df4_banim_a_002_5E3AD4:\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.global data_085E3B74\n"
"data_085E3B74:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_006_0DFBEF + 0x31, 0x000A000F, 0x00000000, 0x00000003, EfxFlashHPBarDelay\n"
"	.4byte 0x00000003, EfxFlashHPBarMain1, 0x00000003, EfxFlashHPBarRestorePal, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxHPBarColorChange[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_006_0DFBEF + 0x41)), PROC_MARK(0xA), PROC_REPEAT(EfxHPBarColorChangeMain), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.global data_085E3BC4\n"
"data_085E3BC4:\n"
"	.4byte 0x00000001, gFrameLut_EfxHPBarColorChange2 + 0x22, 0x000A000F, 0x00000000, 0x00000003, EfxFlashUnitMain\n"
"	.4byte 0x00000003, EfxFlashUnitRestorePal, 0x00000000, 0x00000000\n"
"	.global data_085E3BEC\n"
"data_085E3BEC:\n"
"	.4byte 0x00000001, gFrameLut_EfxHPBarColorChange2 + 0x32, 0x000A000F, 0x00000000, 0x00000003, EfxFlashUnitEffectMain\n"
"	.4byte 0x00000003, EfxFlashUnitEffectRestorePal, 0x00000000, 0x00000000\n"
"	.global data_085E3C14\n"
"data_085E3C14:\n"
);
struct ProcCmd ProcScr_efxStatusUnit[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gFrameLut_EfxHPBarColorChange2 + 0x4A)), PROC_MARK(0xA), PROC_SET_END_CB(EfxStatusUnitEnd), PROC_REPEAT(EfxStatusUnitMain),
    PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.global data_085E3C3C\n"
"data_085E3C3C:\n"
"	.4byte 0x00000001, gFrameLut_EfxStatusUnit + 0x22, 0x000A000F, 0x00000000, 0x00000004, efxWeaponIcon_OnEnd\n"
"	.4byte 0x00000003, efxWeaponIcon_Loop, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxSpellCast[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gFrameLut_EfxStatusUnit + 0x5E)), PROC_MARK(0xA), PROC_REPEAT(efxSpellCast_Loop_A), PROC_REPEAT(efxSpellCast_Loop_B),
    PROC_REPEAT(efxSpellCast_Loop_C), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.4byte 0x00000001, gFrameLut_EfxStatusUnit + 0x6E, 0x000A000F, 0x00000000, 0x00000003, sub_8055EB8\n"
"	.4byte 0x00000003, sub_8055F40, 0x00000003, sub_8055F90, 0x00000003, sub_805601C\n"
"	.4byte 0x00000003, sub_8056078, 0x00000000, 0x00000000, frontier_banim_dracozombie_037_794964, frontier_banim_dracozombie_038_794D78\n"
"	.4byte frontier_banim_dracozombie_039_795198, frontier_banim_dracozombie_040_7955B8\n"
);
struct ProcCmd ProcScr_efxSPDQuake[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x12)), PROC_REPEAT(efxSPDQuake_Loop), PROC_REPEAT(efxSPDQuake_Loop2), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.4byte 0x00000001, gUnk_080DFD46 + 0x1E, 0x00000003, ekrBaStart_InitScreen, 0x00000003, ekrBaStart_SreenFailIn\n"
"	.4byte 0x00000003, ekrBaStart_InitBattleScreen, 0x00000003, ekrBaStart_ExecEkrBattle6C, 0x00000003, ekrBaStart_0\n"
"	.4byte 0x00000003, ekrBaStart_1, 0x00000003, ekrBaStart_2, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_ekrBattleEnding[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x32)), PROC_REPEAT(ekrBattleEnding_0), PROC_REPEAT(ekrBattleEnding_1), PROC_REPEAT(ekrBattleEnding_2),
    PROC_REPEAT(ekrBattleEnding_3), PROC_REPEAT(ekrBattleEnding_4), PROC_REPEAT(ekrBattleEnding_5), PROC_REPEAT(ekrBattleEnding_6),
    PROC_REPEAT(ekrBattleEnding_7), PROC_END,
};
struct ProcCmd ProcScr_EkrBaseKaiten[] __attribute__((section(".data.frontier_df4_banim_a.gap2"))) = {
    PROC_NAME((void*)((u8*)gUnk_080DFD46 + 0x42)), PROC_REPEAT(EkrBaseKaitenMain), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.4byte Img_ConstDataDB034_1, 0x00000000, Img_ConstDataDB034_1, 0x00000000, Img_ConstDataDB034_0, 0x00000000\n"
"	.4byte Img_ConstDataDB034_1, 0x00000000, Img_ConstDataDB034_2, Img_ConstDataDB034_3, Img_ConstDataDB034_3, Img_ConstDataDB034_3\n"
"	.4byte Img_ConstDataDB034_4, Img_ConstDataDB034_3, Img_ConstDataDB034_3, Img_ConstDataDB034_3, data_085FD0E8, 0x00000000\n"
"	.4byte data_085FD0E8 + 0x20, 0x00000000, data_085FC458, 0x00000000, data_085FD0E8 + 0x44, 0x00000000\n"
"	.4byte data_085FD998 + 0x24, frontier_df4_banim_a_008_5FE7D8 + 0x48, frontier_df4_banim_a_008_5FE7D8 + 0x48, frontier_df4_banim_a_008_5FE7D8 + 0x48, frontier_df4_banim_a_009_5FF000 + 0x24, frontier_df4_banim_a_008_5FE7D8 + 0x6C\n"
"	.4byte frontier_df4_banim_a_008_5FE7D8 + 0x6C, frontier_df4_banim_a_008_5FE7D8 + 0x6C, data_085FD998, frontier_df4_banim_a_008_5FE7D8, frontier_df4_banim_a_008_5FE7D8, frontier_df4_banim_a_008_5FE7D8\n"
"	.4byte frontier_df4_banim_a_009_5FF000, frontier_df4_banim_a_008_5FE7D8 + 0x24, frontier_df4_banim_a_008_5FE7D8 + 0x24, frontier_df4_banim_a_008_5FE7D8 + 0x24, data_085FD0E8 + 0x68, 0x00000000\n"
"	.4byte data_085FD0E8 + 0x88, 0x00000000, data_085FC458 + 0x24, 0x00000000, data_085FD0E8 + 0xAC, 0x00000000\n"
"	.4byte data_085FD998 + 0x6C, frontier_df4_banim_a_008_5FE7D8 + 0xD8, frontier_df4_banim_a_008_5FE7D8 + 0xD8, frontier_df4_banim_a_008_5FE7D8 + 0xD8, frontier_df4_banim_a_009_5FF000 + 0x6C, frontier_df4_banim_a_008_5FE7D8 + 0xFC\n"
"	.4byte frontier_df4_banim_a_008_5FE7D8 + 0xFC, frontier_df4_banim_a_008_5FE7D8 + 0xFC, data_085FD998 + 0x48, frontier_df4_banim_a_008_5FE7D8 + 0x90, frontier_df4_banim_a_008_5FE7D8 + 0x90, frontier_df4_banim_a_008_5FE7D8 + 0x90\n"
"	.4byte frontier_df4_banim_a_009_5FF000 + 0x48, frontier_df4_banim_a_008_5FE7D8 + 0xB4, frontier_df4_banim_a_008_5FE7D8 + 0xB4, frontier_df4_banim_a_008_5FE7D8 + 0xB4, gUnk_080DFD46 + 0x60, 0x00000000\n"
"	.4byte gUnk_080DFD46 + 0x70, 0x00000000, gUnk_080DFD46 + 0x50, 0x00000000, gUnk_080DFD46 + 0x80, 0x00000000\n"
"	.4byte gUnk_080DFD46 + 0xA0, gUnk_080DFD46 + 0xD0, gUnk_080DFD46 + 0xD0, gUnk_080DFD46 + 0xD0, gUnk_080DFD46 + 0x100, gUnk_080DFD46 + 0xE0\n"
"	.4byte gUnk_080DFD46 + 0xE0, gUnk_080DFD46 + 0xE0, gUnk_080DFD46 + 0x90, gUnk_080DFD46 + 0xB0, gUnk_080DFD46 + 0xB0, gUnk_080DFD46 + 0xB0\n"
"	.4byte gUnk_080DFD46 + 0xF0, gUnk_080DFD46 + 0xC0, gUnk_080DFD46 + 0xC0, gUnk_080DFD46 + 0xC0\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap2, \"aw\", %progbits\n"
"	.4byte 0x86000001, 0x00000000, 0x000057F0, 0x80000000, TsaConf_BanimTmA1, TsaConf_BanimTmA2\n"
"	.4byte TsaConf_BanimTmA3, TsaConf_BanimTmA4, TsaConf_BanimTmA3, TsaConf_BanimTmA4, TsaConf_BanimTmA3, TsaConf_BanimTmA4\n"
"	.4byte TsaConf_BanimTmA1, TsaConf_BanimTmA2, 0x00000001, BanimLeftDefaultPos + 0xC, 0x00000003, EkrChienCHRMain\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, BanimLeftDefaultPos + 0x18, 0x00000003, ExecAllAIS\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, BanimLeftDefaultPos + 0x28, 0x00000003, EkrUnitMainMiniMain\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, data_080E0008, 0x00000003, ekrTogiInit_Init\n"
"	.4byte 0x00000003, ekrTogiInit_LoadGfx, 0x00000003, ekrTogiInit_Loop, 0x00000003, ekrTogiInit_End\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, data_080E0008 + 0x10, 0x00000003, ekrTogiEnd_Init\n"
"	.4byte 0x00000003, ekrTogiEnd_Loop, 0x00000003, ekrTogiEnd_End, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, data_080E0008 + 0x20, 0x00000003, ekrTogiColor_Loop, 0x00000000, 0x00000000\n"
"	.4byte Pal_ArenaBattleBg_A, Pal_ArenaBattleBg_B, Pal_ArenaBattleBg_C\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap8, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_008_5FE7D8\n"
"frontier_df4_banim_a_008_5FE7D8:\n"
"	.4byte data_085FD998 + 0x92, AnimSprite_EkrBaseKaiten_49 + 0x2, AnimSprite_EkrBaseKaiten_73 + 0x2, AnimSprite_EkrBaseKaiten_50 + 0x1, AnimSprite_EkrBaseKaiten_51 + 0x1, AnimSprite_EkrBaseKaiten_52 + 0x1\n"
"	.4byte AnimSprite_EkrBaseKaiten_53 + 0x1, AnimSprite_EkrBaseKaiten_54 + 0x1, 0x80000000, data_085FD998 + 0x92, AnimSprite_EkrBaseKaiten_55 + 0x2, AnimSprite_EkrBaseKaiten_74 + 0x2\n"
"	.4byte AnimSprite_EkrBaseKaiten_56 + 0x1, AnimSprite_EkrBaseKaiten_57 + 0x1, data_085FDDAC + 0x1, AnimSprite_EkrBaseKaiten_59 + 0x1, AnimSprite_EkrBaseKaiten_60 + 0x1, 0x80000000\n"
"	.4byte data_085FD998 + 0x92, AnimSprite_EkrBaseKaiten_61 + 0x2, AnimSprite_EkrBaseKaiten_75 + 0x2, AnimSprite_EkrBaseKaiten_62 + 0x1, AnimSprite_EkrBaseKaiten_63 + 0x1, AnimSprite_EkrBaseKaiten_64 + 0x1\n"
"	.4byte AnimSprite_EkrBaseKaiten_65 + 0x1, AnimSprite_EkrBaseKaiten_66 + 0x1, 0x80000000, data_085FD998 + 0x92, AnimSprite_EkrBaseKaiten_67 + 0x2, AnimSprite_EkrBaseKaiten_76 + 0x2\n"
"	.4byte AnimSprite_EkrBaseKaiten_68 + 0x1, AnimSprite_EkrBaseKaiten_69 + 0x1, data_085FE358 + 0x1, AnimSprite_EkrBaseKaiten_71 + 0x1, data_085FE490 + 0x1, 0x80000000\n"
"	.4byte AnimSprite_EkrBaseKaiten_54 + 0x1, AnimSprite_EkrBaseKaiten_53 + 0x1, AnimSprite_EkrBaseKaiten_52 + 0x1, AnimSprite_EkrBaseKaiten_51 + 0x1, AnimSprite_EkrBaseKaiten_50 + 0x1, AnimSprite_EkrBaseKaiten_73 + 0x2\n"
"	.4byte AnimSprite_EkrBaseKaiten_49 + 0x2, data_085FD998 + 0x92, 0x80000000, AnimSprite_EkrBaseKaiten_60 + 0x1, AnimSprite_EkrBaseKaiten_59 + 0x1, data_085FDDAC + 0x1\n"
"	.4byte AnimSprite_EkrBaseKaiten_57 + 0x1, AnimSprite_EkrBaseKaiten_56 + 0x1, AnimSprite_EkrBaseKaiten_74 + 0x2, AnimSprite_EkrBaseKaiten_55 + 0x2, data_085FD998 + 0x92, 0x80000000\n"
"	.4byte AnimSprite_EkrBaseKaiten_66 + 0x1, AnimSprite_EkrBaseKaiten_65 + 0x1, AnimSprite_EkrBaseKaiten_64 + 0x1, AnimSprite_EkrBaseKaiten_63 + 0x1, AnimSprite_EkrBaseKaiten_62 + 0x1, AnimSprite_EkrBaseKaiten_75 + 0x2\n"
"	.4byte AnimSprite_EkrBaseKaiten_61 + 0x2, data_085FD998 + 0x92, 0x80000000, data_085FE490 + 0x1, AnimSprite_EkrBaseKaiten_71 + 0x1, data_085FE358 + 0x1\n"
"	.4byte AnimSprite_EkrBaseKaiten_69 + 0x1, AnimSprite_EkrBaseKaiten_68 + 0x1, AnimSprite_EkrBaseKaiten_76 + 0x2, AnimSprite_EkrBaseKaiten_67 + 0x2, data_085FD998 + 0x92, 0x80000000\n"
"	.4byte 0x40000000, 0xFFF80000, 0x0000FFF8, 0x00000001, 0x00000000, 0x00000000\n"
"	.4byte 0x70000000, 0x00000002, 0x00000000, 0x70000000, 0xFFF00004, 0x0000FFF0\n"
"	.4byte 0x70000000, 0x00000006, 0x0000FFF0, 0x70000000, 0xFFF00008, 0x00000000\n"
"	.4byte 0x00000001, 0x00000000, 0x00000000, 0x40000000, 0xFFF80000, 0x00000004\n"
"	.4byte 0x40000000, 0xFFF80000, 0x0000FFF4, 0x00008000, 0x0008000A, 0x0000FFF4\n"
"	.4byte 0x00008000, 0x0008000A, 0x00000004, 0x10008000, 0xFFF0000A, 0x0000FFF4\n"
"	.4byte 0x10008000, 0xFFF0000A, 0x00000004, 0x00004000, 0xFFF80000, 0x0000FFEC\n"
"	.4byte 0x00000000, 0x0008002A, 0x0000FFEC, 0x10000000, 0xFFF0002A, 0x0000FFEC\n"
"	.4byte 0x00000001, 0x00000000, 0x00000000, 0x90004000, 0x00000043, 0x0000FFF0\n"
"	.4byte 0x10008000, 0xFFF80047, 0x0000FFF0, 0x10000000, 0xFFF00068, 0x0000FFF8\n"
"	.4byte 0x90004000, 0xFFF00043, 0x00000000, 0x10008000, 0xFFE80047, 0x00000000\n"
"	.4byte 0x10000000, 0xFFE00068, 0x00000008, 0x10004000, 0xFFE80060, 0x00000010\n"
"	.4byte 0x10000000, 0xFFE00062, 0x00000010, 0x10000000, 0xFFF80064, 0x00000010\n"
"	.4byte 0x10000000, 0x0018001F, 0x0000FFE8, 0x10004000, 0x00080040, 0x0000FFE8\n"
"	.4byte 0x10000000, 0x00000042, 0x0000FFE8, 0x10000000, 0x00200018, 0x0000FFE8\n"
"	.4byte 0x00000001, 0x00000000, 0x00000000\n"
);
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_009_5FF000\n"
"frontier_df4_banim_a_009_5FF000:\n"
"	.4byte frontier_df4_banim_a_008_5FE7D8 + 0x122, AnimSprite_EkrBaseKaiten_88 + 0x2, frontier_df4_banim_a_008_5FE7D8 + 0x13A, frontier_df4_banim_a_008_5FE7D8 + 0x175, AnimSprite_EkrBaseKaiten_89 + 0x1, frontier_df4_banim_a_008_5FE7D8 + 0x1ED\n"
"	.4byte AnimSprite_EkrBaseKaiten_81 + 0x1, AnimSprite_EkrBaseKaiten_82 + 0x1, 0x80000000, frontier_df4_banim_a_008_5FE7D8 + 0x122, AnimSprite_EkrBaseKaiten_88 + 0x2, AnimSprite_EkrBaseKaiten_83 + 0x2\n"
"	.4byte data_085FEC28 + 0x1, AnimSprite_EkrBaseKaiten_90 + 0x1, data_085FEC28 + 0x79, AnimSprite_EkrBaseKaiten_86 + 0x1, data_085FEDD8 + 0x1, 0x80000000\n"
"	.4byte AnimSprite_EkrBaseKaiten_82 + 0x1, AnimSprite_EkrBaseKaiten_81 + 0x1, frontier_df4_banim_a_008_5FE7D8 + 0x1ED, AnimSprite_EkrBaseKaiten_89 + 0x1, frontier_df4_banim_a_008_5FE7D8 + 0x175, frontier_df4_banim_a_008_5FE7D8 + 0x13A\n"
"	.4byte AnimSprite_EkrBaseKaiten_88 + 0x2, frontier_df4_banim_a_008_5FE7D8 + 0x122, 0x80000000, data_085FEDD8 + 0x1, AnimSprite_EkrBaseKaiten_86 + 0x1, data_085FEC28 + 0x79\n"
"	.4byte AnimSprite_EkrBaseKaiten_90 + 0x1, data_085FEC28 + 0x1, AnimSprite_EkrBaseKaiten_83 + 0x2, AnimSprite_EkrBaseKaiten_88 + 0x2, frontier_df4_banim_a_008_5FE7D8 + 0x122, 0x80000000\n"
"	.4byte StartSpellAnimDummy, StartSpellAnimHandAxe, StartSpellAnimBindingBlade, StartSpellAnimJavelin, StartSpellAnimJavelinCavalier, StartSpellAnimJavelinSoldier\n"
"	.4byte StartSpellAnimJavelinPaladin, StartSpellAnimJavelinPegasusKnight, StartSpellAnimJavelinFalcon, StartSpellAnimJavelinWyvernRider, StartSpellAnimJavelinWyvernLord, StartSpellAnimJavelinGenerial\n"
"	.4byte StartSpellAnimJavelinUnk, StartSpellAnimJavelinPaladinF, StartSpellAnimSong, StartSpellAnimDance, StartSpellAnimBallista, StartSpellAnimSilence\n"
"	.4byte sub_805DFC8, StartSpellAnimArrow, sub_805E488, sub_805E5D0, StartSpellAnimFire, StartSpellAnimElfire\n"
"	.4byte nullsub_55, StartSpellAnimThunder, StartSpellAnimLightning, sub_805F1E4, StartSpellAnimAircalibur, StartSpellAnimFlux\n"
"	.4byte StartSpellAnimFimbulvetr, StartSpellAnimBolting, StartSpellAnimPurge, nullsub_56, sub_8060F84, nullsub_57\n"
"	.4byte StartSpellAnimEclipse, StartSpellAnimNosferatu, StartSpellAnimHeal, StartSpellAnimMend, StartSpellAnimRecover, StartSpellAnimPhysic\n"
"	.4byte StartSpellAnimFortify, StartSpellAnimLatona, StartSpellAnimRestore, sub_80634E0, StartSpellAnimFenrir, StartSpellAnimShine\n"
"	.4byte sub_8063D14, sub_8064314, 0x00000000, StartSpellAnimSleep, StartSpellAnimHammerne, StartSpellAnimBerserk\n"
"	.4byte StartSpellAnimBarrier, StartSpellAnimLuna, StartSpellAnimExcalibur, StartSpellAnimIvaldi, StartSpellAnimFillasMight, StartSpellAnimThorsIre\n"
"	.4byte StartSpellAnimNinisGrace, StartSpellAnimSetsLitany, StartSpellAnimStone, StartSpellAnimAura, StartSpellAnimDemonLight, StartSpellAnimDarkBreath\n"
"	.4byte StartSpellAnimShadowshot, StartSpellAnimEvilEye, StartSpellAnimDemonSurge, StartSpellAnimCrimsonEye, StartSpellAnimNaglfar, StartSpellAnimFireBreath\n"
"	.4byte 0x00000000, 0x00000001, 0x00000000, 0x00000000\n"
"	.global data_085FF1C0\n"
"data_085FF1C0:\n"
"	.4byte gEkrSpellAnimLut + 0x125, 0x80000000\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.global data_085FF238\n"
"data_085FF238:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x34, 0x00000003, EfxRestWINH_Wait, 0x00000003, EfxRestWINHMain\n"
"	.4byte 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxALPHA[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x40)), PROC_REPEAT(EfxALPHAMain), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.global data_085FF270\n"
"data_085FF270:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x4C, 0x00000003, EfxCircleWINMain, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x5C, 0x00000003, Loop6C_efxMagicQUAKE, 0x00000000, 0x00000000\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.global data_085FF308\n"
"data_085FF308:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xA4, 0x00000004, DummvRST_OnEnd, 0x00000003, EfxTeonoSeMain\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xB0, 0x00000003, efxHurtmut_Loop_Main\n"
"	.4byte 0x00000000, 0x00000000\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.4byte Tsa_Song, Tsa_SongBg_0, Tsa_SongBg_1, Tsa_SongBg_2, Tsa_SongBg_3, Tsa_SongBg_4\n"
"	.4byte Tsa_SongBg_5, Tsa_SongBg_6, Tsa_SongBg_7, Tsa_SongBg_8, Tsa_SongBg_9, Tsa_SongBg_10\n"
"	.4byte Tsa_SongBg_11, Tsa_SongBg_12, Tsa_SongBg_13, Tsa_SongBg_14, Tsa_SongBg_15, Tsa_SongBg_16\n"
"	.4byte Tsa_SongBg_17, Tsa_SongBg_18, Tsa_SongBg_19, Tsa_SongBg_20, Tsa_SongBg_21, Tsa_SongBg_22\n"
"	.4byte Tsa_SongBg_23, Tsa_SongBg_24, Tsa_SongBg_25, Img_SongBg_0, Img_SongBg_0, Img_SongBg_0\n"
"	.4byte Img_SongBg_0, Img_SongBg_0, Img_SongBg_0, Img_SongBg_0, Img_SongBg_0, Img_SongBg_0\n"
"	.4byte Img_SongBg_0, Img_SongBg_1, Img_SongBg_1, Img_SongBg_1, Img_SongBg_1, Img_SongBg_1\n"
"	.4byte Img_SongBg_2, Img_SongBg_2, Img_SongBg_2, Img_SongBg_2, Img_SongBg_2, Img_SongBg_2\n"
"	.4byte Img_SongBg_2, Img_SongBg_3, Img_SongBg_3, Img_SongBg_3, Img_SongBg_3, Img_SongBg_3\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x164, 0x00000003, efxSongOBJ_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x170, 0x00000003, efxDance_Loop_Main, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxShooter[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x17C)), PROC_REPEAT(efxShooter_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x188, 0x00000003, efxShooterOBJ_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x198, 0x00000003, sub_805DC9C, 0x00000000, 0x00000000\n"
"	.global data_085FF508\n"
"data_085FF508:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x1A8, 0x00000003, sub_805DDF8, 0x00000000, 0x00000000\n"
"	.global data_085FF520\n"
"data_085FF520:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x1B8, 0x00000003, sub_805DE74, 0x00000000, 0x00000000\n"
"	.global data_085FF538\n"
"data_085FF538:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x1C8, 0x000A000F, 0x00000000, 0x00000003, efxDarkbreathBGCOL_Loop\n"
"	.4byte 0x00000000, 0x00000000\n"
"	.global data_085FF558\n"
"data_085FF558:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x1FC, 0x00000003, sub_805E004, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x208, 0x00000003, sub_805E130, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxArrow[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x218)), PROC_REPEAT(efxFirebreath_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x228, 0x00000003, efxFirebreathOBJ_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x23C, 0x00000003, efxFirebreathBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x24C, 0x000A000F, 0x00000000, 0x00000003, efxFirebreathBGCOL_Loop\n"
"	.4byte 0x00000000, 0x00000000\n"
"	.global data_085FF5F0\n"
"data_085FF5F0:\n"
"	.4byte 0x00000001, Frames_efxFirebreathBGCOL + 0xDC, 0x00000003, efxIcebreath_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, Frames_efxFirebreathBGCOL + 0xEC, 0x00000004, efxIcebreathOBJ_OnEnd, 0x0034000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000\n"
"	.global data_085FF628\n"
"data_085FF628:\n"
"	.4byte 0x00000001, Frames_efxFirebreathBGCOL + 0xFC, 0x00000003, efxDarkbreath_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, Frames_efxFirebreathBGCOL + 0x10C, 0x00000003, efxMshieldBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte Tsa_DarkBreathBg_0, Tsa_DarkBreathBg_1, Tsa_DarkBreathBg_2, Tsa_DarkBreathBg_3, Tsa_DarkBreathBg_4, Tsa_DarkBreathBg_5\n"
"	.4byte Tsa_DarkBreathBg_6, Tsa_DarkBreathBg_7, Tsa_DarkBreathBg_8, Tsa_DarkBreathBg_9, data_08613A6C, data_08613A6C + 0xFC\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x3C4, 0x000A000F, 0x00000000, 0x00000003, sub_805E780\n"
"	.4byte 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxDarkbreathOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x47C)), PROC_REPEAT(efxDarkbreathOBJ_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x490, 0x00000003, Loop6C_efxThunder, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxThunderBG[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((const void*)0x080E1D0C), PROC_REPEAT(EfxThunderBGMain), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap9, \"aw\", %progbits\n"
"	.4byte Tsa_EfxThuderBg1, Tsa_EfxThuderBg2, Tsa_EfxThuderBg1, Tsa_EfxThuderBg2\n"
);
struct ProcCmd ProcScr_efxThunderBGCOL[] __attribute__((section(".data.frontier_df4_banim_a.gap9"))) = {
    PROC_NAME((const void*)0x080E1D24), PROC_MARK(0xA), PROC_REPEAT(EfxThunderBGCOL_Loop), PROC_END,
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap10, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_010_5FF7C8\n"
"frontier_df4_banim_a_010_5FF7C8:\n"
);
struct ProcCmd ProcScr_efxFireOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((const void*)0x080E1DCC), PROC_REPEAT(EfxFireOBJ_Loop), PROC_END,
};
struct ProcCmd ProcScr_efxFireHITBG[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x568)), PROC_REPEAT(EfxFireHitBG_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap10, \"aw\", %progbits\n"
"	.4byte Img_Banim_0, Img_Banim_0, Img_Banim_0, Img_Banim_0, Img_Banim_0, Img_Banim_0\n"
"	.4byte Img_AnimaHitBG_0, Img_AnimaHitBG_0, Img_AnimaHitBG_0, Img_AnimaHitBG_1, Img_AnimaHitBG_1, Img_AnimaHitBG_2\n"
"	.4byte Img_AnimaHitBG_2, Img_AnimaHitBG_3, Img_AnimaHitBG_3, Img_AnimaHitBG_4, Img_AnimaHitBG_5, Img_AnimaHitBG_6\n"
"	.4byte Img_AnimaHitBG_7, Img_AnimaHitBG_8, Img_AnimaHitBG_9, frontier_df4_banim_b_015_62DC84, frontier_df4_banim_b_015b_62DD30, frontier_df4_banim_b_015c_62DDE8\n"
"	.4byte frontier_df4_banim_b_015d_62DEB4, Tsa_AnimaHitBG_3, Tsa_AnimaHitBG_4, Tsa_AnimaHitBG_5, Tsa_AnimaHitBG_6, Tsa_AnimaHitBG_7\n"
"	.4byte Tsa_AnimaHitBG_8, Tsa_AnimaHitBG_9, Tsa_AnimaHitBG_10, Tsa_AnimaHitBG_11, Tsa_AnimaHitBG_12, Tsa_AnimaHitBG_13\n"
"	.4byte frontier_df4_banim_b_016_62EDD8, frontier_df4_banim_b_016b_62EF78, frontier_df4_banim_b_016c_62F118, frontier_df4_banim_b_016d_62F2B8, frontier_df4_banim_b_016e_62F458, Tsa_AnimaHitBG_19\n"
);
struct ProcCmd ProcScr_efxElfireBG[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0x56)), PROC_REPEAT(EfxElfireBG_Loop), PROC_END,
};
struct ProcCmd ProcScr_efxElfireBGCOL[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0x62)), PROC_MARK(0xA), PROC_REPEAT(EfxElfireBGCOL_Loop), PROC_END,
};
struct ProcCmd ProcScr_efxElfireOBJ[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0xCA)), PROC_REPEAT(EfxElfireObj_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap10, \"aw\", %progbits\n"
"	.global data_085FF8F0\n"
"data_085FF8F0:\n"
"	.4byte 0x00000001, FrameConfig_AnimaHitBG + 0xDA, 0x00000003, efxFimbulvetr_Loop_Main, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxFimbulvetrBGTR[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)FrameConfig_AnimaHitBG + 0xEA)), PROC_REPEAT(efxHammarneBG_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap10, \"aw\", %progbits\n"
"	.4byte Tsa_FimbulvetrBg_Tornado_A, Tsa_FimbulvetrBg_Tornado_B, Tsa_FimbulvetrBg_Tornado_C, Tsa_FimbulvetrBg_Tornado_D, Tsa_FimbulvetrBg_Tornado_E, Tsa_FimbulvetrBg_Tornado_F\n"
"	.4byte Img_FimbulvetrBg_Tornado_A, Img_FimbulvetrBg_Tornado_B, Img_FimbulvetrBg_Tornado_C, Img_FimbulvetrBg_Tornado_D, Img_FimbulvetrBg_Tornado_E, Img_FimbulvetrBg_Tornado_F\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x6E0, 0x00000003, efxFimbulvetrBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte frontier_df4_banim_b_017_63CDD4, frontier_df4_banim_b_017b_63CE78, frontier_df4_banim_b_017c_63CF20, Tsa_FimbulvetrBg_D, Tsa_FimbulvetrBg_E, Tsa_FimbulvetrBg_F\n"
"	.4byte Tsa_FimbulvetrBg_G, Tsa_FimbulvetrBg_H, Tsa_FimbulvetrBg_I, frontier_df4_banim_b_018_63D868, frontier_df4_banim_b_018b_63DA88, Img_FimbulvetrBg_A\n"
"	.4byte Img_FimbulvetrBg_A, Img_FimbulvetrBg_A, Img_FimbulvetrBg_A, Img_FimbulvetrBg_A, Img_FimbulvetrBg_A, Img_FimbulvetrBg_B\n"
"	.4byte Img_FimbulvetrBg_B, Img_FimbulvetrBg_C, Img_FimbulvetrBg_D, Img_FimbulvetrBg_D, 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x720\n"
"	.4byte 0x00000003, efxFimbulvetrOBJ_Loop, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x734\n"
"	.4byte 0x00000003, efxFimbulvetrOBJ2_Loop, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x748\n"
"	.4byte 0x00000003, efxFimbulvetrOBJ2Fall_Loop, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxLightning[] __attribute__((section(".data.frontier_df4_banim_a.gap10"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x760)), PROC_REPEAT(efxThunderstorm_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap10, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x770, 0x00000003, efxThunderstormBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte Img_BoltingBg_A, Img_BoltingBg_A, Img_BoltingBg_A, Img_BoltingBg_A, Img_BoltingBg_B, Img_BoltingBg_B\n"
"	.4byte Img_BoltingBg_B, Img_BoltingBg_B, Img_BoltingBg_B, Img_BoltingBg_B, Img_BoltingBg_C, Tsa_BoltingBg_A\n"
"	.4byte Tsa_BoltingBg_B, Tsa_BoltingBg_C, Tsa_BoltingBg_D, Tsa_BoltingBg_E, Tsa_BoltingBg_F, Tsa_BoltingBg_G\n"
"	.4byte Tsa_BoltingBg_H, Tsa_BoltingBg_I, data_08636008, Tsa_BoltingBg_K, 0x00000001, Frames_efxThunderstormBG + 0x46\n"
"	.4byte 0x00000003, efxThunderstormOBJ_Loop, 0x0064000E, 0x00000000, 0x00000003, efxThunderstormOBJ_End\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, Frames_efxThunderstormBG + 0x5A, 0x005E000E, 0x00000000\n"
"	.4byte 0x00000003, efxThunderstormColor_Loop_A, 0x0003000E, 0x00000000, 0x00000003, efxThunderstormColor_Loop_B\n"
"	.4byte 0x0014000E, 0x00000000, 0x00000003, efxThunderstormColor_Loop_C, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, Frames_efxThunderstormBG + 0x72, 0x00000003, efxThunderstormDark_Loop_A, 0x00000003, efxThunderstormDark_Loop_B\n"
"	.4byte 0x00000000, 0x00000000\n"
);
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_banim_a.gap11, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_011_5FFBA0\n"
"frontier_df4_banim_a_011_5FFBA0:\n"
);
struct ProcCmd gProcScr_efxMistyrainBG[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x888)), PROC_REPEAT(efxMistyRainBg_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap11, \"aw\", %progbits\n"
"	.4byte Tsa_Flux_ClassReel_0, Tsa_Flux_ClassReel_1, Tsa_Flux_ClassReel_2, Tsa_Flux_ClassReel_3, Tsa_Flux_ClassReel_4, Tsa_Flux_ClassReel_5\n"
"	.4byte Tsa_Flux_ClassReel_6, Tsa_Flux_ClassReel_7, Tsa_Flux_ClassReel_8, Tsa_Flux_ClassReel_9, Tsa_Flux_ClassReel_10, Tsa_Flux_ClassReel_11\n"
"	.4byte frontier_df3_banim_mid_008_657A78, frontier_df3_banim_mid_008b_657B20, frontier_df3_banim_mid_008c_657BDC, frontier_df3_banim_mid_008d_657CB4, frontier_df3_banim_mid_008e_657D94, Tsa_Flux_ClassReel_17\n"
"	.4byte Tsa_Flux_ClassReel_18, Tsa_Flux_ClassReel_19, Tsa_Flux_ClassReel_20, Tsa_Flux_ClassReel_21, Tsa_Flux_ClassReel_22, Tsa_Flux_ClassReel_23\n"
"	.4byte Tsa_Flux_ClassReel_24, Tsa_Flux_ClassReel_25, Tsa_Flux_ClassReel_26, Tsa_Flux_ClassReel_27, frontier_df3_banim_mid_009_6587E0, frontier_df3_banim_mid_009b_658880\n"
"	.4byte frontier_df3_banim_mid_009c_658934, frontier_df3_banim_mid_009d_6589F0, frontier_df3_banim_mid_009e_658ACC, frontier_df3_banim_mid_009f_658BB4, frontier_df3_banim_mid_009g_658CD8, frontier_df3_banim_mid_009h_658DF8\n"
"	.4byte frontier_df3_banim_mid_009i_658F04, frontier_df3_banim_mid_009j_659010, frontier_df3_banim_mid_009k_65910C, frontier_df3_banim_mid_009l_65920C, frontier_df3_banim_mid_009m_659308, AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8\n"
"	.4byte AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, Img_Flux_ClassReel_0, Img_Flux_ClassReel_0, Img_Flux_ClassReel_0, frontier_df3_banim_mid_006_654DFC\n"
"	.4byte frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC, Img_Flux_ClassReel_2\n"
"	.4byte Img_Flux_ClassReel_2, Img_Flux_ClassReel_2, Img_Flux_ClassReel_2, Img_Flux_ClassReel_2, Img_Flux_ClassReel_2, Img_Flux_ClassReel_3\n"
"	.4byte Img_Flux_ClassReel_3, Img_Flux_ClassReel_3, Img_Flux_ClassReel_3, Img_Flux_ClassReel_4, Img_Flux_ClassReel_4, Img_Flux_ClassReel_4\n"
"	.4byte Img_Flux_ClassReel_4, Img_Flux_ClassReel_4, Img_Flux_ClassReel_4, Img_Flux_ClassReel_4, frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC\n"
"	.4byte frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC, frontier_df3_banim_mid_006_654DFC, Img_Flux_ClassReel_0, Img_Flux_ClassReel_0\n"
"	.4byte Img_Flux_ClassReel_0, AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8, AnimScr_EfxAlacaliburOBJ_LeftBack + 0xB8\n"
);
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
__asm__(
"	.section .data.frontier_df4_banim_a.gap11, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x970, 0x00000003, efxResireBG_Loop_A, 0x00000003, efxResireBG_Loop_B\n"
"	.4byte 0x00000003, efxResireBG_Loop_C, 0x00000003, efxResireBG_Loop_D, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0x97C, 0x00000003, efxResireBG2_Loop, 0x00000000, 0x00000000\n"
"	.4byte AnimScr_EfxMistyRainObj3 + 0x2C, AnimScr_EfxMistyRainObj3 + 0x2C, AnimScr_EfxMistyRainObj3 + 0x2C, AnimScr_EfxMistyRainObj3 + 0x2C, AnimScr_EfxMistyRainObj3 + 0x2C, AnimScr_EfxMistyRainObj3 + 0x2C\n"
"	.4byte AnimScr_EfxMistyRainObj3 + 0x2C, AnimScr_EfxMistyRainObj3 + 0x2C, Img_NosferatuBg_B, Img_NosferatuBg_B, Img_NosferatuBg_B, Img_NosferatuBg_C\n"
"	.4byte Img_NosferatuBg_C, Img_NosferatuBg_D, Img_NosferatuBg_D, Img_NosferatuBg_E, Img_NosferatuBg_E, Img_NosferatuBg_F\n"
"	.4byte Img_NosferatuBg_F, Img_NosferatuBg_F, Img_NosferatuBg_G, Img_NosferatuBg_G, Img_NosferatuBg_G, Img_NosferatuBg_H\n"
"	.4byte Img_NosferatuBg_H, Img_NosferatuBg_H, Img_NosferatuBg_H, Img_NosferatuBg_H, Img_NosferatuBg_I, Img_NosferatuBg_I\n"
"	.4byte Img_NosferatuBg_I, Img_NosferatuBg_I, Img_NosferatuBg_I, Img_NosferatuBg_I, Img_NosferatuBg_I, Img_NosferatuBg_I\n"
"	.4byte Img_NosferatuBg_J, Img_NosferatuBg_J, Img_NosferatuBg_J, Img_NosferatuBg_J, Img_NosferatuBg_K, Img_NosferatuBg_K\n"
"	.4byte Img_NosferatuBg_K, Img_NosferatuBg_L, Img_NosferatuBg_L, Img_NosferatuBg_L, Img_NosferatuBg_M, Img_NosferatuBg_M\n"
"	.4byte Img_NosferatuBg_M, Img_NosferatuBg_M, Img_NosferatuBg_M, Tsa_NosferatuBg_0, frontier_df4_banim_b_021_663368, frontier_df4_banim_b_021b_663414\n"
"	.4byte frontier_df4_banim_b_021c_6634C4, frontier_df4_banim_b_021d_66357C, frontier_df4_banim_b_021e_66363C, frontier_df4_banim_b_021f_663708, frontier_df4_banim_b_021g_6637E8, Tsa_NosferatuBg_8\n"
"	.4byte Tsa_NosferatuBg_9, Tsa_NosferatuBg_10, Tsa_NosferatuBg_11, Tsa_NosferatuBg_12, Tsa_NosferatuBg_13, Tsa_NosferatuBg_14\n"
"	.4byte Tsa_NosferatuBg_15, Tsa_NosferatuBg_16, Tsa_NosferatuBg_17, Tsa_NosferatuBg_18, Tsa_NosferatuBg_19, Tsa_NosferatuBg_20\n"
"	.4byte Tsa_NosferatuBg_21, Tsa_NosferatuBg_22, Tsa_NosferatuBg_23, Tsa_NosferatuBg_24, Tsa_NosferatuBg_25, Tsa_NosferatuBg_26\n"
"	.4byte Tsa_NosferatuBg_27, Tsa_NosferatuBg_28, Tsa_NosferatuBg_29, Tsa_NosferatuBg_30, Tsa_NosferatuBg_31, Tsa_NosferatuBg_32\n"
"	.4byte Tsa_NosferatuBg_33, Tsa_NosferatuBg_34, Tsa_NosferatuBg_35, Tsa_NosferatuBg_36, Tsa_NosferatuBg_37, Tsa_NosferatuBg_38\n"
"	.4byte Tsa_NosferatuBg_39, Tsa_NosferatuBg_40, Tsa_NosferatuBg_41, Tsa_NosferatuBg_42, Tsa_NosferatuBg_43, Tsa_NosferatuBg_44\n"
"	.4byte Tsa_NosferatuBg_45, Tsa_NosferatuBg_46, frontier_df4_banim_b_022_665FB0, frontier_df4_banim_b_022b_66608C, frontier_df4_banim_b_022c_666158, frontier_df4_banim_b_022d_666210\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xA5C, 0x00000003, efxResireRST_Loop, 0x00000000, 0x00000000\n"
);
struct ProcCmd gProcScr_efxThunderstorm[] __attribute__((section(".data.frontier_df4_banim_a.gap11"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0xA6C)), PROC_REPEAT(efxLightning_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap11, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xA7C, 0x00000003, efxLightningBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte Img_Banim_1, Img_Banim_1, Img_Banim_1, Img_Banim_2, Img_Banim_2, Img_Banim_2\n"
"	.4byte Img_Banim_3, Img_Banim_3, Img_Banim_3, Img_Banim_3, Img_Banim_4, Img_Banim_4\n"
"	.4byte Img_Banim_4, Img_Banim_5, Img_Banim_5, Img_Banim_5, Img_Light_0, Img_Light_0\n"
"	.4byte Img_Light_0, Img_Light_0, Img_Light_0, Img_Light_0, Img_Light_0, Img_Light_0\n"
"	.4byte Img_Light_0, Img_Light_1, Img_Light_1, Img_Light_1, Img_Light_2, Img_Light_2\n"
"	.4byte Img_Light_2, Img_Light_2, Img_Light_2, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Light, Pal_Light\n"
"	.4byte Pal_Light, Pal_Light, Pal_Light, Pal_Light, Pal_Light, Pal_Light\n"
"	.4byte Tsa_Light_0, Tsa_Light_1, frontier_df4_banim_b_019_64C610, frontier_df4_banim_b_019b_64C71C, Tsa_Light_4, Tsa_Light_5\n"
"	.4byte Tsa_Light_6, Tsa_Light_7, Tsa_Light_8, Tsa_Light_9, Tsa_Light_10, Tsa_Light_11\n"
"	.4byte Tsa_Light_12, Tsa_Light_13, Tsa_Light_14, frontier_df3_banim_mid_000_64D2B4, frontier_df3_banim_mid_000b_64D3C8, frontier_df3_banim_mid_000c_64D478\n"
"	.4byte frontier_df3_banim_mid_000d_64D580, frontier_df3_banim_mid_000e_64D6BC, frontier_df3_banim_mid_000f_64D830, frontier_df3_banim_mid_000g_64D9C8, frontier_df3_banim_mid_000h_64DB3C, frontier_df3_banim_mid_000i_64DC48\n"
"	.4byte frontier_df3_banim_mid_000j_64DD1C, Tsa_Light_25, Tsa_Light_26, Tsa_Light_27, Tsa_Light_28, Tsa_Light_29\n"
"	.4byte Tsa_Light_30, Tsa_Light_31, Tsa_Light_32, 0x00000001, Frames_efxLightningBG + 0x88, 0x00000003\n"
"	.4byte efxPurge_Loop_Main, 0x00000000, 0x00000000, 0x00000001, Frames_efxLightningBG + 0x94, 0x00000003\n"
"	.4byte efxPurgeBG_Loop, 0x00000000, 0x00000000, Img_Banim_1, Img_Banim_1, Img_Banim_1\n"
"	.4byte Img_Banim_2, Img_Banim_2, Img_Banim_2, Img_Banim_3, Img_Banim_3, Img_Banim_3\n"
"	.4byte Img_Banim_3, Img_Banim_4, Img_Banim_4, Img_Banim_4, Img_Banim_5, Img_Banim_5\n"
"	.4byte Img_Banim_5, Img_Banim_1, Img_Banim_1, Img_Banim_1, Img_Banim_2, Img_Banim_2\n"
"	.4byte Img_Banim_2, Img_Banim_3, Img_Banim_3, Img_Banim_3, Img_Banim_3, Img_Banim_4\n"
"	.4byte Img_Banim_4, Img_Banim_4, Img_Banim_5, Img_Banim_5, Img_Banim_5, Img_Banim_1\n"
"	.4byte Img_Banim_1, Img_Banim_1, Img_Banim_2, Img_Banim_2, Img_Banim_2, Img_Banim_3\n"
"	.4byte Img_Banim_3, Img_Banim_3, Img_Banim_3, Img_Banim_4, Img_Banim_4, Img_Banim_4\n"
"	.4byte Img_Banim_5, Img_Banim_5, Img_Banim_5, Img_Banim_7, Img_Banim_7, Img_PurgeBg_0\n"
"	.4byte Img_PurgeBg_0, Img_PurgeBg_1, Img_PurgeBg_1, Img_PurgeBg_2, Img_PurgeBg_2, Img_PurgeBg_3\n"
"	.4byte Img_PurgeBg_3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte Img_PurgeBg_4, Img_PurgeBg_5, Img_PurgeBg_6, Img_PurgeBg_7, Img_PurgeBg_8, Img_PurgeBg_9\n"
"	.4byte Img_PurgeBg_9, Img_PurgeBg_10, Img_PurgeBg_10, Img_PurgeBg_11, Img_PurgeBg_12, Img_PurgeBg_13\n"
"	.4byte Img_PurgeBg_14, Img_PurgeBg_15, Img_PurgeBg_16, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_0\n"
"	.4byte Pal_Banim_0, Pal_Banim_0, Pal_Banim_0, Pal_Banim_3, Pal_Banim_3, Pal_Banim_3\n"
"	.4byte Pal_Banim_3, Pal_Banim_3, Pal_Banim_3, Pal_Banim_3, Pal_Banim_3, Pal_Banim_3\n"
"	.4byte Pal_Banim_3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg\n"
"	.4byte Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg\n"
"	.4byte Pal_PurgeBg, Pal_PurgeBg, Pal_PurgeBg, Tsa_PurgeBg_0, Tsa_PurgeBg_1, Tsa_PurgeBg_2\n"
"	.4byte Tsa_PurgeBg_3, Tsa_PurgeBg_4, Tsa_PurgeBg_5, Tsa_PurgeBg_6, Tsa_PurgeBg_7, Tsa_PurgeBg_8\n"
"	.4byte Tsa_PurgeBg_9, Tsa_PurgeBg_10, Tsa_PurgeBg_11, Tsa_PurgeBg_12, Tsa_PurgeBg_13, Tsa_PurgeBg_14\n"
"	.4byte Tsa_PurgeBg_15, Tsa_PurgeBg_16, Tsa_PurgeBg_17, Tsa_PurgeBg_18, Tsa_PurgeBg_19, Tsa_PurgeBg_20\n"
"	.4byte Tsa_PurgeBg_21, Tsa_PurgeBg_22, Tsa_PurgeBg_23, Tsa_PurgeBg_24, Tsa_PurgeBg_25, Tsa_PurgeBg_26\n"
"	.4byte Tsa_PurgeBg_27, Tsa_PurgeBg_28, Tsa_PurgeBg_29, Tsa_PurgeBg_30, Tsa_PurgeBg_31, frontier_df4_banim_b_028_69697C\n"
"	.4byte frontier_df4_banim_b_028b_696AA0, frontier_df4_banim_b_028c_696BC0, frontier_df4_banim_b_028d_696CCC, frontier_df4_banim_b_028e_696DC8, frontier_df4_banim_b_028f_696EB0, frontier_df4_banim_b_028g_696F98\n"
"	.4byte frontier_df4_banim_b_028h_697078, frontier_df4_banim_b_028i_697154, frontier_df4_banim_b_028j_697234, frontier_df4_banim_b_028k_697328, frontier_df4_banim_b_028l_69741C, frontier_df4_banim_b_028m_697520\n"
"	.4byte frontier_df4_banim_b_028n_697628, frontier_df4_banim_b_028o_697740, frontier_df4_banim_b_028p_697864, Tsa_PurgeBg_48, Tsa_PurgeBg_49, Tsa_PurgeBg_50\n"
"	.4byte Tsa_PurgeBg_51, Tsa_PurgeBg_52, Tsa_PurgeBg_53, Tsa_PurgeBg_54, Tsa_PurgeBg_55, Tsa_PurgeBg_56\n"
"	.4byte Tsa_PurgeBg_57, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte Tsa_PurgeBg_58, Tsa_PurgeBg_59, Tsa_PurgeBg_60, Tsa_PurgeBg_61, Tsa_PurgeBg_62, Tsa_PurgeBg_63\n"
"	.4byte Tsa_PurgeBg_64, Tsa_PurgeBg_65, Tsa_PurgeBg_66, Tsa_PurgeBg_67, Tsa_PurgeBg_68, Tsa_PurgeBg_69\n"
"	.4byte Tsa_PurgeBg_70, Tsa_PurgeBg_71, Tsa_PurgeBg_72, 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xCA4, 0x00000003\n"
"	.4byte efxPurgeOBJRND_Loop, 0x0045000E, 0x00000000, 0x00000000, 0x00000000, 0x000000D0\n"
"	.4byte 0x00000030, 0x000000A0, 0x00000090, 0x00000040, 0x00000040, 0x000000C0\n"
"	.4byte 0x00000060, 0x00000080, 0x00000030, 0x00000020, 0x00000060, 0x00000050\n"
"	.4byte 0x00000080, 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xCB4, 0x00000004, efxMshieldBGOBJ_OnEnd, 0x0045000E\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000\n"
"	.global data_08600594\n"
"data_08600594:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xCC0, 0x00000003, efxDivine_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xCCC, 0x00000003, efxDivineBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg\n"
"	.4byte Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg\n"
"	.4byte Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg, Img_DivineBg\n"
"	.4byte Img_DivineBg, Img_DivineBg, frontier_df4_banim_b_023_6719A8, frontier_df4_banim_b_023b_671A48, frontier_df4_banim_b_023c_671AF0, frontier_df4_banim_b_023d_671B98\n"
"	.4byte frontier_df4_banim_b_023e_671C48, frontier_df4_banim_b_023f_671D00, frontier_df4_banim_b_023g_671DCC, frontier_df4_banim_b_023h_671E98, frontier_df4_banim_b_023i_671F6C, frontier_df4_banim_b_023j_672044\n"
"	.4byte frontier_df4_banim_b_023k_672120, Tsa_DivineBg_12, Tsa_DivineBg_13, Tsa_DivineBg_14, Tsa_DivineBg_15, data_086724CC\n"
"	.4byte data_086724CC + 0x9C, data_086724CC + 0x138, Tsa_DivineBg_19, Tsa_DivineBg_20, Img_DivineBg, Img_DivineBg\n"
"	.4byte Img_DivineBg, Tsa_DivineBg2_0, Tsa_DivineBg2_1, Tsa_DivineBg2_2, Img_DivineBg3_0, Img_DivineBg3_0\n"
"	.4byte Img_DivineBg3_1, Img_DivineBg3_2, Img_DivineBg3_3, Img_DivineBg3_4, Img_DivineBg3_5, Img_DivineBg3_6\n"
"	.4byte Img_DivineBg3_7, Img_DivineBg3_8, Img_DivineBg3_9, Img_DivineBg3_10, Img_DivineBg3_11, Img_DivineBg3_12\n"
"	.4byte Img_DivineBg3_13, Img_DivineBg3_14, Img_DivineBg3_15, Img_DivineBg3_16, Img_DivineBg3_16, Img_DivineBg3_17\n"
"	.4byte Img_DivineBg3_17, Tsa_DivineBg_0, Tsa_DivineBg3_0, Tsa_DivineBg3_1, Tsa_DivineBg3_2, Tsa_DivineBg3_3\n"
"	.4byte Tsa_DivineBg3_4, Tsa_DivineBg3_5, Tsa_DivineBg3_6, Tsa_DivineBg3_7, Tsa_DivineBg3_8, Tsa_DivineBg3_9\n"
"	.4byte Tsa_DivineBg3_10, Tsa_DivineBg3_11, Tsa_DivineBg3_12, Tsa_DivineBg3_13, Tsa_DivineBg3_14, Tsa_DivineBg3_15\n"
"	.4byte Tsa_DivineBg3_16, Tsa_DivineBg3_17, Tsa_DivineBg3_18, Tsa_DivineBg3_19, 0x00000001, frontier_df4_misc_lo_007_0E1870 + 0xDAC\n"
"	.4byte 0x00000003, efxDivineOBJ_Loop, 0x00000000, 0x00000000\n"
);
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_banim_a.gap12, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_012_600754\n"
"frontier_df4_banim_a_012_600754:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638, 0x00000003, sub_806166C, 0x00000000, 0x00000000\n"
"	.4byte Tsa_EclipseBg_A, data_0867B54C, data_0867B54C + 0xA0, Tsa_EclipseBg_D, Tsa_EclipseBg_E, Tsa_EclipseBg_F\n"
"	.4byte Tsa_EclipseBg_G, Tsa_EclipseBg_H, Tsa_EclipseBg_I, Tsa_EclipseBg_J, Tsa_EclipseBg_K, Tsa_EclipseBg_L\n"
"	.4byte Tsa_EclipseBg_M, Tsa_EclipseBg_N, Tsa_EclipseBg_O, Tsa_EclipseBg_P, Tsa_EclipseBg_Q, Tsa_EclipseBg_R\n"
"	.4byte Tsa_EclipseBg_S, Tsa_EclipseBg_T, Tsa_EclipseBg_U, Tsa_EclipseBg_V, Tsa_EclipseBg_W, Tsa_EclipseBg_X\n"
"	.4byte Tsa_EclipseBg_Y, Tsa_EclipseBg_Z, Tsa_EclipseBg_AA, Img_EclipseBg_A, Img_EclipseBg_B, Img_EclipseBg_B\n"
"	.4byte Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_B\n"
"	.4byte Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_B, Img_EclipseBg_C\n"
"	.4byte Img_EclipseBg_C, Img_EclipseBg_C, Img_EclipseBg_D, Img_EclipseBg_E, Img_EclipseBg_F, Img_EclipseBg_G\n"
"	.4byte Img_EclipseBg_H, Img_EclipseBg_I, Img_EclipseBg_J, Img_EclipseBg_K, Img_EclipseBg_L, Img_EclipseBg_M\n"
"	.4byte 0x00000001, Frames_efxHazymoonBG_C + 0x36, 0x00000004, efxHazymoonOBJ2_OnEnd, 0x00000003, efxHazymoonOBJ2_Loop_C\n"
"	.4byte 0x00000003, efxHazymoonOBJ2_Loop_A, 0x00000003, efxHazymoonOBJ2_Loop_B, 0x00000003, efxHazymoonOBJ2_Loop_C\n"
"	.4byte 0x00000003, efxHazymoonOBJ2_Loop_A, 0x00000003, efxHazymoonOBJ2_Loop_B, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, Frames_efxHazymoonBG_C + 0x46, 0x00000003, efxHazymoonOBJ3_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00380060, 0x00680030, 0x004000A0, 0x00880058, 0x008800A0, 0x006000C0\n"
);
struct ProcCmd ProcScr_efxHazymoonOBJ3RND[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)Frames_efxHazymoonBG_C + 0x56)), PROC_SET_END_CB(efxHazymoonOBJ3RND_OnEnd), PROC_SLEEP(0x2C), PROC_END,
};
struct ProcCmd ProcScr_efxResire[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)Frames_efxHazymoonBG_C + 0x6A)), PROC_REPEAT(efxFenrir_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap12, \"aw\", %progbits\n"
"	.4byte 0x00000001, Frames_efxHazymoonBG_C + 0x76, 0x00000004, efxFenrirBG_OnEnd, 0x00000003, efxFenrirBG_Loop\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, Frames_efxHazymoonBG_C + 0x82, 0x000A000F, 0x00000000\n"
"	.4byte 0x00000004, EfxTeonoSeCallBack, 0x00000003, efxLunaBGCOL_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x188, 0x00000003, efxFenrirOBJ_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x198, 0x00000003, efxFenrirBG2_Loop, 0x00000000, 0x00000000\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520, frontier_df4_banim_b_025_67F520\n"
"	.4byte Img_FenrirBg_1, Img_FenrirBg_2, Img_FenrirBg_3, Tsa_Banim_13, Tsa_FenrirBg_0, Tsa_FenrirBg_1\n"
"	.4byte Tsa_FenrirBg_2, Tsa_FenrirBg_3, Tsa_FenrirBg_4, Tsa_FenrirBg_5, Tsa_FenrirBg_6, Tsa_FenrirBg_7\n"
"	.4byte frontier_df4_banim_b_026_683C80, frontier_df4_banim_b_026b_683D84, frontier_df4_banim_b_026c_683E88, frontier_df4_banim_b_026d_683F8C, frontier_df4_banim_b_026e_6840CC, frontier_df4_banim_b_026f_684210\n"
"	.4byte frontier_df4_banim_b_026g_684354, frontier_df4_banim_b_026h_684498, frontier_df4_banim_b_026i_6845DC, frontier_df4_banim_b_026j_684720, frontier_df4_banim_b_026k_6848A0, frontier_df4_banim_b_026l_684A24\n"
"	.4byte frontier_df4_banim_b_026m_684BA8, frontier_df4_banim_b_026n_684D08, frontier_df4_banim_b_026o_684E68, frontier_df4_banim_b_026p_684FC8, frontier_df4_banim_b_026q_68516C, frontier_df4_banim_b_026r_685310\n"
"	.4byte frontier_df4_banim_b_026s_6854B4, frontier_df4_banim_b_026t_685624, frontier_df4_banim_b_026u_685794, frontier_df4_banim_b_026v_685904, frontier_df4_banim_b_026w_685AA8, frontier_df4_banim_b_026x_685C4C\n"
"	.4byte frontier_df4_banim_b_026y_685DF0, frontier_df4_banim_b_026z_685F64, frontier_df4_banim_b_026aa_6860D8, frontier_df4_banim_b_026ab_68624C, frontier_df4_banim_b_026ac_6863FC, frontier_df4_banim_b_026ad_6865AC\n"
"	.4byte frontier_df4_banim_b_026ae_68675C, frontier_df4_banim_b_026af_6868D0, frontier_df4_banim_b_026ag_686A44, Tsa_FenrirBg_41, Tsa_FenrirBg_42, Tsa_FenrirBg_43\n"
"	.4byte frontier_df4_banim_b_027_6870D4, frontier_df4_banim_b_027b_68724C, frontier_df4_banim_b_027c_6873C4, Tsa_FenrirBg_47, Tsa_FenrirBg_48, Tsa_FenrirBg_49\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x2A8, 0x00000003, efxFenrirOBJ2_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x2B8, 0x00000003, efxFenrirOBJ2Chiri_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x000000B8, 0x00000055, 0x00000042, 0x00000077, 0x0000009E, 0x00000027\n"
"	.4byte 0x00000087, 0x000000D2\n"
);
struct ProcCmd ProcScr_efxLive[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0x2CC)), PROC_REPEAT(efxLive_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap12, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x2D4, 0x00000003, efxRelive_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x2E0, 0x00000003, efxRecover_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x2EC, 0x00000003, efxReblow_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x2F8, 0x00000003, efxLiveBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, gEfxmagicHealstaves_3 + 0x8, 0x000A000F, 0x00000000, 0x00000003, efxLiveBGCOL_Loop\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, gEfxmagicHealstaves_7 + 0x44, 0x00000003, efxLiveALPHA_Loop_A\n"
"	.4byte 0x00000003, efxLiveALPHA_Loop_B, 0x00000000, 0x00000000, 0x00000001, gEfxmagicHealstaves_7 + 0x54\n"
"	.4byte 0x00000003, efxLiveOBJ_Loop, 0x00000000, 0x00000000, 0x00000001, gEfxmagicHealstaves_7 + 0x60\n"
"	.4byte 0x00000003, efxReserveOBJ_Loop_A, 0x00000003, efxReserveOBJ_Loop_B, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, gEfxmagicHealstaves_7 + 0x70, 0x00000003, efxReblowOBJ_Loop_A, 0x00000003, sub_8062CE4\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, gEfxmagicHealstaves_7 + 0x80, 0x00000003, efxReserve_Loop_Main\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, gEfxmagicHealstaves_7 + 0x8C, 0x00000003, efxReserveBG_Loop\n"
"	.4byte 0x00000000, 0x00000000, Tsa_Banim_14, Tsa_Fortify_0, Tsa_Fortify_1, Tsa_Fortify_2\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x49C, 0x000A000F, 0x00000000, 0x00000003, efxReserveBGCOL_Loop\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x5B0, 0x00000003, efxReserveBG2_Loop\n"
"	.4byte 0x00000000, 0x00000000, Tsa_FortifyBg2, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x5C4, 0x000A000F\n"
"	.4byte 0x00000000, 0x00000003, efxReserveBGCOL2_Loop, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte frontier_df4_misc_lo_008_0E2638 + 0x6B4, 0x00000003, efxRest_Loop_Main, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte frontier_df4_misc_lo_008_0E2638 + 0x6BC, 0x00000003, efxRestBG_Loop, 0x00000000, 0x00000000, frontier_df4_banim_b_033_6A819C\n"
"	.4byte frontier_df4_banim_b_033b_6A8248, frontier_df4_banim_b_033c_6A82FC, frontier_df4_banim_b_033d_6A83BC, frontier_df4_banim_b_033e_6A8484, frontier_df4_banim_b_033f_6A8560, Tsa_RestoreBg_5\n"
"	.4byte Tsa_RestoreBg_6, Tsa_RestoreBg_7, Tsa_RestoreBg_8, Tsa_RestoreBg_9, Tsa_RestoreBg_10, Tsa_RestoreBg_11\n"
"	.4byte Img_Banim_8, Img_Banim_8, Img_Banim_8, Img_Banim_8, Img_Banim_8, Img_Banim_8\n"
"	.4byte Img_Banim_9, Img_Banim_9, Img_Banim_9, Img_Banim_10, Img_Banim_10, Img_Banim_11\n"
"	.4byte Img_Banim_11, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x6FC, 0x00000004, efxFenrirBGCOL_OnEnd, 0x0050000E\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000\n"
"	.global data_08600DB8\n"
"data_08600DB8:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x708, 0x00000003, efxSilence_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x714, 0x00000003, efxDarkbreathBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte data_086AC554, data_086AC554 + 0xFC, Tsa_SilenceBg_2, frontier_df4_banim_b_037_6AC820, frontier_df4_banim_b_037b_6AC908, frontier_df4_banim_b_037c_6ACA04\n"
"	.4byte frontier_df4_banim_b_037d_6ACAEC, frontier_df4_banim_b_037e_6ACB84, frontier_df4_banim_b_037f_6ACC6C, frontier_df4_banim_b_037g_6ACD04, frontier_df4_banim_b_037h_6ACDEC, frontier_df4_banim_b_037i_6ACEE8\n"
"	.4byte frontier_df4_banim_b_037j_6ACF80, frontier_df4_banim_b_037k_6AD068, frontier_df4_banim_b_037l_6AD100, frontier_df4_banim_b_037m_6AD1FC, Tsa_SilenceBg_16, Tsa_SilenceBg_17\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x76C, 0x00000004, efxSilenceOBJ_OnEnd, 0x0028000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxFenrir[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0x77C)), PROC_REPEAT(efxSleep_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap12, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x788, 0x00000003, sub_8063940, 0x00000000, 0x00000000\n"
"	.4byte Tsa_SleepBg_0, Tsa_SleepBg_1, Tsa_SleepBg_2, Tsa_SleepBg_3, Tsa_SleepBg_4, Tsa_SleepBg_5\n"
"	.4byte Tsa_SleepBg_6, Tsa_SleepBg_7, Tsa_SleepBg_8, Tsa_SleepBg_9, Tsa_SleepBg_10, Tsa_SleepBg_11\n"
"	.4byte Tsa_SleepBg_12, Tsa_SleepBg_13, Tsa_SleepBg_14, Tsa_SleepBg_15, 0x00000001, Frames_efxSleepBG + 0x104\n"
"	.4byte 0x00000004, efxRestOBJ_Loop, 0x0050000E, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, Frames_efxSleepBG + 0x110, 0x00000004, efxRestOBJ_Loop, 0x00C8000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, Frames_efxSleepBG + 0x120, 0x00000004, efxSleepOBJ_OnEnd\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, efxSleepSE_PlaySE, 0x0036000E, 0x00000000\n"
"	.4byte 0x00000002, efxSleepSE_PlaySE, 0x0041000E, 0x00000000, 0x00000002, efxSleepSE_PlaySE\n"
"	.4byte 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxShine[] __attribute__((section(".data.frontier_df4_banim_a.gap12"))) = {
    PROC_NAME((void*)((u8*)Frames_efxSleepBG + 0x12C)), PROC_REPEAT(efxHammarne_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap12, \"aw\", %progbits\n"
"	.4byte 0x00000001, Frames_efxSleepBG + 0x138, 0x00000003, efxFimbulvetrBGTR_Loop, 0x00000000, 0x00000000\n"
"	.4byte Pal_HammerneBg + 0x20, Pal_HammerneBg + 0xCC, Pal_HammerneBg + 0x17C, Pal_HammerneBg + 0x23C, Pal_HammerneBg + 0x304, Pal_HammerneBg + 0x3DC\n"
"	.4byte Tsa_HammerneBg_6, Tsa_HammerneBg_7, Tsa_HammerneBg_8, Tsa_HammerneBg_9, Tsa_HammerneBg_10, Tsa_HammerneBg_11\n"
"	.4byte Tsa_HammerneBg_12, Img_Banim_8, Img_Banim_8, Img_Banim_8, Img_Banim_8, Img_Banim_8\n"
"	.4byte Img_Banim_8, Img_Banim_9, Img_Banim_9, Img_Banim_9, Img_Banim_10, Img_Banim_10\n"
"	.4byte Img_Banim_11, Img_Banim_11, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x910, 0x00000004, efxSleepSE_OnEnd\n"
"	.4byte 0x0050000E, 0x00000000, 0x00000000, 0x00000000\n"
"	.global data_08601000\n"
"data_08601000:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x920, 0x00000003, efxBerserk_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x92C, 0x00000003, efxBerserkBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x93C, 0x00000004, efxHammarneOBJ_OnEnd, 0x00000003, efxBerserkCLONE_Loop\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x94C, 0x00000004, efxBerserkOBJ_OnEnd\n"
"	.4byte 0x00000003, efxBerserkOBJ_Loop_A, 0x0007000E, 0x00000000, 0x00000003, efxBerserkOBJ_Loop_B\n"
"	.4byte 0x0003000E, 0x00000000, 0x00000003, efxBerserkOBJ_Loop_C, 0x0007000E, 0x00000000\n"
"	.4byte 0x00000003, efxBerserkOBJ_Loop_D, 0x0003000E, 0x00000000, 0x00000003, efxBerserkOBJ_Loop_E\n"
"	.4byte 0x0007000E, 0x00000000, 0x00000003, efxBerserkOBJ_Loop_F, 0x0003000E, 0x00000000\n"
"	.4byte 0x00000003, efxBerserkOBJ_Loop_G, 0x0007000E, 0x00000000, 0x00000003, efxBerserkOBJ_Loop_H\n"
"	.4byte 0x0003000E, 0x00000000, 0x00000003, efxBerserkOBJ_Loop_I, 0x0007000E, 0x00000000\n"
"	.4byte 0x00000003, efxBerserkOBJ_Loop_J, 0x0011000E, 0x00000000, 0x00000000, 0x00000000\n"
"	.global data_08601108\n"
"data_08601108:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x95C, 0x00000003, efxMshield_Loop_Main, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x968, 0x00000003, efxSilenceBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte data_086BAB74, data_086BAB74 + 0xB8, Tsa_BarrierBg_2, Tsa_BarrierBg_3, Tsa_BarrierBg_4, 0x00000001\n"
"	.4byte frontier_df4_misc_lo_008_0E2638 + 0xA40, 0x00000004, sub_8064568, 0x00DC000E, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xA50, 0x00000004, sub_8064568, 0x006E000E\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xA60, 0x00000003\n"
"	.4byte efxShine_Loop_Main, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xA6C, 0x00000003\n"
"	.4byte efxShineBG_Loop, 0x00000000, 0x00000000, Tsa_ShineBg1_Left, Tsa_ShineBg1_Right, Img_ShineBg1\n"
"	.4byte 0x00000001, Frames_efxShineBG + 0x8, 0x00000003, efxShineBG2_Loop, 0x00000000, 0x00000000\n"
"	.4byte frontier_df3_banim_aura_003_754840, data_087548F0, data_087549F8, data_08754B34, data_08754CA8, data_08754E40\n"
"	.4byte data_08754FB4, data_087550C0, data_08755194, 0x00000001, Frames_efxShineBG2 + 0x28, 0x000A000F\n"
"	.4byte 0x00000000, 0x00000003, efxExcaliburBGCOL2_Loop, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte Frames_efxShineBGCOL + 0x1A, 0x00000003, efxShineOBJRND_Loop, 0x00000000, 0x00000000, 0xFFCAFFFC\n"
"	.4byte 0xFFE8FFD8, 0x00040004, 0xFFEC0014, 0x00000001, Frames_efxShineBGCOL + 0x2A, 0x00000003\n"
"	.4byte efxShineOBJ_Loop, 0x00000000, 0x00000000, 0x00000001, Frames_efxShineBGCOL + 0x36, 0x00000003\n"
"	.4byte efxLuna_Loop_Main, 0x00000000, 0x00000000, 0x00000001, Frames_efxShineBGCOL + 0x3E, 0x00000003\n"
"	.4byte efxSleepBG_Loop, 0x00000000, 0x00000000, Tsa_LunaBg1_A, 0x00000001, Frames_efxLunaBG + 0x6\n"
"	.4byte 0x00000003, efxLunaSCR_Loop, 0x00000000, 0x00000000, 0x00000001, Frames_efxLunaBG + 0x12\n"
"	.4byte 0x00000003, EfxSRankWeaponEffectSCR2Main, 0x00000000, 0x00000000\n"
);
/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_banim_a.gap13, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_013_601630\n"
"frontier_df4_banim_a_013_601630:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xC64, 0x00000004, efxExcaliburBG2_OnEnd, 0x00000003, sub_8065A44\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xC74, 0x000A000F, 0x00000000\n"
"	.4byte 0x00000003, sub_8065AA8, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xC9C\n"
"	.4byte 0x00000004, efxExcaliburBG3_OnEnd, 0x00000003, sub_8065BF0, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xCAC, 0x000A000F, 0x00000000, 0x00000003, sub_8065C54\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xCD4, 0x00000003, efxExcaliburOBJ_Loop\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xCE4, 0x00000003, efxExcaliburBG0_Loop\n"
"	.4byte 0x00000000, 0x00000000, AnimScr_DarkBreath_Far + 0x6C, Pal_efxExcaliburBG0 + 0x20, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xCFC\n"
"	.4byte 0x00000003, sub_8065E44, 0x00000000, 0x00000000\n"
"	.global data_08601700\n"
"data_08601700:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xD08, 0x00000003, efxGespenstBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte data_0875F138 + 0x20, data_0875F138 + 0x114, data_0875F138 + 0x208, data_0875F138 + 0x2FC, data_0875F138 + 0x474, data_0875F138 + 0x5EC\n"
"	.4byte data_0875F138 + 0x764, data_0875F138 + 0x940, data_0875F138 + 0xB1C, data_0875F138 + 0xCF8, data_0875F138 + 0xE94, data_0875F138 + 0x1030\n"
"	.global data_08601748\n"
"data_08601748:\n"
"	.4byte 0x00000001, 0x080E33A4, 0x00000004, sub_80661D0, 0x00000003, sub_80661EC\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xD7C, 0x00000004, efxGespenstBG4_OnEnd\n"
"	.4byte 0x00000003, efxGespenstBG4_Loop, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xD8C\n"
"	.4byte 0x000A000F, 0x00000000, 0x00000003, efxGespenstBGCOL2_Loop, 0x00000000, 0x00000000\n"
"	.global data_086017A8\n"
"data_086017A8:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xDF0, 0x00000003, sub_8066410, 0x00000000, 0x00000000\n"
"	.global data_086017C0\n"
"data_086017C0:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xE00, 0x00000004, sub_80664B8, 0x00000003, sub_80664D0\n"
"	.4byte 0x0013000E, 0x00000000, 0x00000003, sub_80664EC, 0x0018000E, 0x00000000\n"
"	.4byte 0x00000003, sub_8066508, 0x0013000E, 0x00000000, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_efxLuna[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0xE10)), PROC_REPEAT(efxOura_Loop_Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap13, \"aw\", %progbits\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xE18, 0x00000003, efxOuraBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte Tsa_AuraBg1_0, Tsa_AuraBg1_1, Tsa_AuraBg1_2, Tsa_AuraBg1_3, Tsa_AuraBg1_4, Tsa_AuraBg1_5\n"
"	.4byte Tsa_AuraBg1_6, Tsa_AuraBg1_7, Tsa_AuraBg1_8, Tsa_AuraBg1_9, Tsa_AuraBg1_10, data_08764BF4\n"
"	.4byte Tsa_AuraBg1_12, Tsa_AuraBg1_13, Tsa_AuraBg1_14, Tsa_AuraBg1_15, Tsa_AuraBg1_16, Tsa_AuraBg1_17\n"
"	.4byte Tsa_AuraBg1_18, Tsa_AuraBg1_19, Tsa_AuraBg1_20, Tsa_AuraBg1_21, Tsa_AuraBg1_22, Tsa_AuraBg1_23\n"
"	.4byte Tsa_AuraBg1_24, frontier_df4_banim_b_056_7657CC, frontier_df4_banim_b_056b_7658D0, frontier_df4_banim_b_056c_7659D4, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xE9C\n"
"	.4byte 0x00000004, efxOuraBG2_OnEnd, 0x00000003, efxOuraBG2_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xEA8, 0x000A000F, 0x00000000, 0x00000003, efxOuraBGCOL_Loop\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xEC8, 0x00000003, efxOuraBG3_Loop\n"
"	.4byte 0x00000000, 0x00000000, frontier_banim_aurabg3_005_774CB8, frontier_banim_aurabg3_006_774F30, frontier_banim_aurabg3_007_7751A8, frontier_banim_aurabg3_008_775420\n"
"	.4byte frontier_banim_aurabg3_009_775698, frontier_banim_aurabg3_010_775908, frontier_banim_aurabg3_011_775B64, frontier_banim_aurabg3_012_775DDC, frontier_banim_aurabg3_013_776054, frontier_banim_aurabg3_014_7762CC\n"
"	.4byte frontier_banim_aurabg3_015_776544, frontier_banim_aurabg3_016_7767BC, Img_AuraBg3_0, Img_AuraBg3_1, Img_AuraBg3_2, Img_AuraBg3_3\n"
"	.4byte Img_AuraBg3_4, Img_AuraBg3_5, Img_AuraBg3_6, frontier_banim_aurabg3_000_76E98C, frontier_banim_aurabg3_001_76FE78, frontier_banim_aurabg3_002_771224\n"
"	.4byte frontier_banim_aurabg3_003_7725D4, frontier_banim_aurabg3_004_7738F0\n"
);
struct ProcCmd ProcScr_efxExcalibur[] __attribute__((section(".data.frontier_df4_banim_a.gap13"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_008_0E2638 + 0xF48)), PROC_REPEAT(sub_8066B7C), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_banim_a.gap13, \"aw\", %progbits\n"
"	.global data_08601978\n"
"data_08601978:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xF50, 0x00000003, efxLunaBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte frontier_banim_aurabg3_017_777118, frontier_banim_aurabg3_018_7771B8, frontier_banim_aurabg3_019_777264, frontier_banim_aurabg3_020_777308, frontier_banim_aurabg3_021_7773B4, frontier_banim_aurabg3_022_777468\n"
"	.4byte frontier_banim_aurabg3_023_777520, frontier_banim_aurabg3_024_7775CC, frontier_banim_aurabg3_025_777674, frontier_banim_aurabg3_026_77771C, frontier_banim_aurabg3_027_7777BC, frontier_banim_aurabg3_028_777858\n"
"	.global data_086019C0\n"
"data_086019C0:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0xF8C, 0x00000004, sub_8066E24, 0x00000003, sub_8066E40\n"
"	.4byte 0x00000000, 0x00000000\n"
"	.global data_086019E0\n"
"data_086019E0:\n"
"	.4byte 0x00000001, 0x080E35D0, 0x00000003, efxReblowOBJ_Loop_B, 0x00000000, 0x00000000\n"
"	.global data_086019F8\n"
"data_086019F8:\n"
"	.4byte 0x00000001, 0x080E35DC, 0x00000003, efxIvaldiWOUT_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, 0x080E35E8, 0x00000003, efxLuceBGCOL_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, FrameConf_efxLuceBGCOL + 0x3E, 0x00000003, efxEreshkigal_Loop_Main, 0x00000000, 0x00000000\n"
"	.global data_08601A40\n"
"data_08601A40:\n"
"	.4byte 0x00000001, FrameConf_efxLuceBGCOL + 0x4E, 0x00000003, sub_806749C, 0x0045000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x000000D0, 0x00000030, 0x00000003, 0x00000400\n"
"	.4byte 0x000000A0, 0x00000090, 0x00000001, 0x00000800, 0x00000040, 0x00000040\n"
"	.4byte 0x00000003, 0x00000400, 0x000000C0, 0x00000060, 0x00000001, 0x00000800\n"
"	.4byte 0x00000080, 0x00000030, 0x00000005, 0x00000400, 0x00000020, 0x00000060\n"
"	.4byte 0x00000000, 0x00000800, 0x00000050, 0x00000080, 0x00000005, 0x00000400\n"
"	.4byte 0x000000A0, 0x00000060, 0x00000001, 0x00000800, 0x000000D0, 0x00000030\n"
"	.4byte 0x00000003, 0x00000400, 0x00000010, 0x00000040, 0x00000000, 0x00000800\n"
"	.4byte 0x00000040, 0x00000070, 0x00000005, 0x00000400, 0x00000090, 0x00000060\n"
"	.4byte 0x00000001, 0x00000800, 0x00000050, 0x00000020, 0x00000003, 0x00000400\n"
"	.4byte data_087A0EF4 + 0xB18, data_087A0EF4 + 0xBF0, data_087A0EF4 + 0xC88, data_087A1C24 + 0x10, data_087A1C24 + 0x80, data_087A1C24 + 0xD0\n"
"	.4byte 0x00000001, FrameConf_efxLuceBGCOL + 0x62, 0x00000004, efxGorgonOBJ_OnEnd, 0x003B000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000\n"
"	.global data_08601B68\n"
"data_08601B68:\n"
"	.4byte 0x00000001, FrameConf_efxLuceBGCOL + 0x76, 0x00000004, sub_8067600, 0x000D000E, 0x00000000\n"
"	.4byte 0x00000003, sub_8067618, 0x006E000E, 0x00000000, 0x00000000, 0x00000000\n"
"	.global data_08601B98\n"
"data_08601B98:\n"
"	.4byte 0x00000001, FrameConf_efxLuceBGCOL + 0x8A, 0x00000003, efxHazymoonBG_Loop, 0x00000000, 0x00000000\n"
"	.4byte frontier_banim_dracozombie_018_781CBC, frontier_banim_dracozombie_018_781CBC, frontier_banim_dracozombie_019_7832B4, frontier_banim_dracozombie_020_7844F0, frontier_banim_dracozombie_021_785C08, frontier_banim_dracozombie_022_7875A0\n"
"	.4byte frontier_banim_dracozombie_023_788CC4, frontier_banim_dracozombie_024_78A0D0, frontier_banim_dracozombie_025_78AF74, frontier_banim_dracozombie_026_78BE1C, frontier_banim_dracozombie_027_78CEA8, frontier_banim_dracozombie_028_78D004\n"
"	.4byte frontier_banim_dracozombie_029_78D354, frontier_banim_dracozombie_030_78D6A4, frontier_banim_dracozombie_031_78DAB4, frontier_banim_dracozombie_032_78DF08, frontier_banim_dracozombie_033_78E33C, frontier_banim_dracozombie_034_78E750\n"
"	.4byte frontier_banim_dracozombie_035_78EAE0, frontier_banim_dracozombie_036_78EE00, 0x00000001, FrameConf_efxLuceBGCOL + 0x14A, 0x00000003, efxSuperdruidBG3_Loop\n"
"	.4byte 0x00000000, 0x00000000, frontier_banim_dracozombie_040b_7959D8, Img_EreshkigalBg3_0, Img_EreshkigalBg3_1, Img_EreshkigalBg3_2\n"
"	.4byte Img_EreshkigalBg3_3, frontier_df4_banim_b_057_79A108, Img_EreshkigalBg3_5, Img_EreshkigalBg3_6, Img_EreshkigalBg3_7, Img_EreshkigalBg3_8\n"
"	.4byte Tsa_EreshkigalBg3_0, Tsa_EreshkigalBg3_1, frontier_df4_banim_b_058_79F83C, Tsa_EreshkigalBg3_3, frontier_df4_banim_b_059_79FCB0, data_0879FF00\n"
"	.4byte data_087A0174, data_087A03A0, data_087A05E4, data_087A083C\n"
"	.global data_08601C68\n"
"data_08601C68:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x1144, 0x00000003, sub_8067884, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x1158, 0x00000004, efxExcaliburBGCOL_OnEnd, 0x000D000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000\n"
"	.global data_08601CA0\n"
"data_08601CA0:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_008_0E2638 + 0x116C, 0x00000004, efxSuperdruidOBJ2_OnEnd, 0x000D000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000\n"
);
/* frontier_df4_banim_a_014_601CD8: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_banim_a.gap14, \"aw\", %progbits\n"
"	.global frontier_df4_banim_a_014_601CD8\n"
"frontier_df4_banim_a_014_601CD8:\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0x3, 0x00000003, efxIvaldi_Loop_Main + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xF, 0x00000003, efxIvaldiBG2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_IvaldiBg1_0, Tsa_IvaldiBg1_1, Tsa_IvaldiBg1_2, Tsa_IvaldiBg1_3, Tsa_IvaldiBg1_4, Tsa_IvaldiBg1_5\n"
"	.4byte Tsa_IvaldiBg1_6, Tsa_IvaldiBg1_7, Tsa_IvaldiBg1_8, Tsa_IvaldiBg1_9, Tsa_IvaldiBg1_10, Tsa_IvaldiBg1_11\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0x4F, 0x00000003, sub_8067EA4 + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_IvaldiBg2_0, Tsa_IvaldiBg2_1, Tsa_IvaldiBg2_2, Tsa_IvaldiBg2_3, Tsa_IvaldiBg2_4, 0x00000001\n"
"	.4byte frontier_df4_misc_lo_009_0E37C5 + 0x7B, 0x00000003, sub_8067F68 + 0x1, 0x00000000, 0x00000000, Tsa_IvaldiBg3_0\n"
"	.4byte Tsa_IvaldiBg3_1, Tsa_IvaldiBg3_2, Tsa_IvaldiBg3_3, Tsa_IvaldiBg3_4, Tsa_IvaldiBg3_5, Tsa_IvaldiBg3_6\n"
"	.4byte Tsa_IvaldiBg3_7, Tsa_IvaldiBg3_8, Tsa_IvaldiBg3_9, Tsa_IvaldiBg3_10, Img_IvaldiBg3_0, Img_IvaldiBg3_1\n"
"	.4byte Img_IvaldiBg3_2, Img_IvaldiBg3_3, Img_IvaldiBg3_4, Img_IvaldiBg3_5, Img_IvaldiBg3_6, Img_IvaldiBg3_7\n"
"	.4byte Img_IvaldiBg3_8, Img_IvaldiBg3_9, Img_IvaldiBg3_10, Pal_IvaldiBg3_0, Pal_IvaldiBg3_1, Pal_IvaldiBg3_2\n"
"	.4byte Pal_IvaldiBg3_3, Pal_IvaldiBg3_4, Pal_IvaldiBg3_5, Pal_IvaldiBg3_6, Pal_IvaldiBg3_7, Pal_IvaldiBg3_8\n"
"	.4byte Pal_IvaldiBg3_9, Pal_IvaldiBg3_10, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xB7, 0x00000003, efxIvaldiBG4_Loop + 0x1\n"
"	.4byte 0x00000000, 0x00000000, Tsa_IvaldiBg4, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xCB, 0x00000003\n"
"	.4byte efxIvaldiOBJFall_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xDF, 0x00000003\n"
"	.4byte efxIvaldiOBJSideWash_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0xF7, 0x00000003\n"
"	.4byte efxIvaldiOBJUprise_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009_0E37C5 + 0x10B, 0x00000003\n"
"	.4byte efxIvaldiOBJ1_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009aa_0E3910, 0x00000003\n"
"	.4byte efxIvaldiOBJ2_Loop + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928, 0x00000003\n"
"	.4byte sub_8068850 + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x10, 0x00000003\n"
"	.4byte efxMaohFlash_Loop_Main + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x20, 0x00000003\n"
"	.4byte efxIvaldiBG3_Loop + 0x1, 0x00000000, 0x00000000, Tsa_DemonLightBg_Close_1, Tsa_DemonLightBg_Close_2, Tsa_DemonLightBg_Close_3\n"
"	.4byte Tsa_DemonLightBg_Close_4, Tsa_DemonLightBg_Close_5, Tsa_DemonLightBg_Close_6, Tsa_DemonLightBg_Close_7, Tsa_DemonLightBg_Close_8, Tsa_DemonLightBg_Close_9\n"
"	.4byte Tsa_DemonLightBg_Close_10, Tsa_DemonLightBg_Close_11, Tsa_DemonLightBg_Close_12, Tsa_DemonLightBg_Close_13, Tsa_DemonLightBg_Close_14, Tsa_DemonLightBg_Close_15\n"
"	.4byte Tsa_DemonLightBg_Close_16, Tsa_DemonLightBg_Close_17, Tsa_DemonLightBg_Close_18, Tsa_DemonLightBg_Close_19, Tsa_DemonLightBg_Close_20, Tsa_DemonLightBg_Close_21\n"
"	.4byte Tsa_DemonLightBg_Close_22, Tsa_DemonLightBg_Close_23, Tsa_DemonLightBg_Close_24, Tsa_DemonLightBg_Close_25, Tsa_DemonLightBg_Close_26, Tsa_DemonLightBg_Close_27\n"
"	.4byte Tsa_DemonLightBg_Close_28, Tsa_DemonLightBg_Close_29, Tsa_DemonLightBg_Close_30, Tsa_DemonLightBg_Close_31, Tsa_DemonLightBg_Close_32, Img_DemonLightBg_Close_1\n"
"	.4byte Img_DemonLightBg_Close_2, Img_DemonLightBg_Close_3, Img_DemonLightBg_Close_4, Img_DemonLightBg_Close_5, Img_DemonLightBg_Close_6, Img_DemonLightBg_Close_7\n"
"	.4byte Img_DemonLightBg_Close_8, Img_DemonLightBg_Close_9, Img_DemonLightBg_Close_10, Img_DemonLightBg_Close_11, Img_DemonLightBg_Close_12, Img_DemonLightBg_Close_13\n"
"	.4byte Img_DemonLightBg_Close_14, Img_DemonLightBg_Close_15, Img_DemonLightBg_Close_16, Img_DemonLightBg_Close_17, Img_DemonLightBg_Close_18, Img_DemonLightBg_Close_19\n"
"	.4byte Img_DemonLightBg_Close_20, Img_DemonLightBg_Close_21, Img_DemonLightBg_Close_22, Img_DemonLightBg_Close_23, Img_DemonLightBg_Close_24, Img_DemonLightBg_Close_25\n"
"	.4byte Img_DemonLightBg_Close_26, Img_DemonLightBg_Close_27, Img_DemonLightBg_Close_28, Img_DemonLightBg_Close_29, Img_DemonLightBg_Close_30, Img_DemonLightBg_Close_31\n"
"	.4byte Img_DemonLightBg_Close_32, Pal_DemonLightBg_Close_1, Pal_DemonLightBg_Close_2, Pal_DemonLightBg_Close_3, Pal_DemonLightBg_Close_4, Pal_DemonLightBg_Close_5\n"
"	.4byte Pal_DemonLightBg_Close_6, Pal_DemonLightBg_Close_7, Pal_DemonLightBg_Close_8, Pal_DemonLightBg_Close_9, Pal_DemonLightBg_Close_10, Pal_DemonLightBg_Close_11\n"
"	.4byte Pal_DemonLightBg_Close_12, Pal_DemonLightBg_Close_13, Pal_DemonLightBg_Close_14, Pal_DemonLightBg_Close_15, Pal_DemonLightBg_Close_16, Pal_DemonLightBg_Close_17\n"
"	.4byte Pal_DemonLightBg_Close_18, Pal_DemonLightBg_Close_19, Pal_DemonLightBg_Close_20, Pal_DemonLightBg_Close_21, Pal_DemonLightBg_Close_22, Pal_DemonLightBg_Close_23\n"
"	.4byte Pal_DemonLightBg_Close_24, Pal_DemonLightBg_Close_25, Pal_DemonLightBg_Close_26, Pal_DemonLightBg_Close_27, Pal_DemonLightBg_Close_28, Pal_DemonLightBg_Close_29\n"
"	.4byte Pal_DemonLightBg_Close_30, Pal_DemonLightBg_Close_31, Pal_DemonLightBg_Close_32, Tsa_DemonLightBg_Far_1, Tsa_DemonLightBg_Far_2, Tsa_DemonLightBg_Far_3\n"
"	.4byte Tsa_DemonLightBg_Far_4, Tsa_DemonLightBg_Far_5, Tsa_DemonLightBg_Far_6, Tsa_DemonLightBg_Far_7, Tsa_DemonLightBg_Far_8, Tsa_DemonLightBg_Far_9\n"
"	.4byte Tsa_DemonLightBg_Far_10, Tsa_DemonLightBg_Far_11, Tsa_DemonLightBg_Far_12, Tsa_DemonLightBg_Far_13, Tsa_DemonLightBg_Far_14, Tsa_DemonLightBg_Far_15\n"
"	.4byte Tsa_DemonLightBg_Far_16, Tsa_DemonLightBg_Far_17, Tsa_DemonLightBg_Far_18, Tsa_DemonLightBg_Far_19, Tsa_DemonLightBg_Far_20, Tsa_DemonLightBg_Far_21\n"
"	.4byte Tsa_DemonLightBg_Far_22, Tsa_DemonLightBg_Far_23, Tsa_DemonLightBg_Far_24, Tsa_DemonLightBg_Far_25, Tsa_DemonLightBg_Far_26, Tsa_DemonLightBg_Far_27\n"
"	.4byte Tsa_DemonLightBg_Far_28, Tsa_DemonLightBg_Far_29, Tsa_DemonLightBg_Far_30, Tsa_DemonLightBg_Far_31, Tsa_DemonLightBg_Far_32, Img_DemonLightBg_Far_1\n"
"	.4byte Img_DemonLightBg_Far_2, Img_DemonLightBg_Far_3, Img_DemonLightBg_Far_4, Img_DemonLightBg_Far_5, Img_DemonLightBg_Far_6, Img_DemonLightBg_Far_7\n"
"	.4byte Img_DemonLightBg_Far_8, Img_DemonLightBg_Far_9, Img_DemonLightBg_Far_10, Img_DemonLightBg_Far_11, Img_DemonLightBg_Far_12, Img_DemonLightBg_Far_13\n"
"	.4byte Img_DemonLightBg_Far_14, Img_DemonLightBg_Far_15, Img_DemonLightBg_Far_16, Img_DemonLightBg_Far_17, Img_DemonLightBg_Far_18, Img_DemonLightBg_Far_19\n"
"	.4byte Img_DemonLightBg_Far_20, Img_DemonLightBg_Far_21, Img_DemonLightBg_Far_22, Img_DemonLightBg_Far_23, Img_DemonLightBg_Far_24, Img_DemonLightBg_Far_25\n"
"	.4byte Img_DemonLightBg_Far_26, Img_DemonLightBg_Far_27, Img_DemonLightBg_Far_28, Img_DemonLightBg_Far_29, Img_DemonLightBg_Far_30, Img_DemonLightBg_Far_31\n"
"	.4byte Img_DemonLightBg_Far_32, Pal_DemonLightBg_Far_1, Pal_DemonLightBg_Far_2, Pal_DemonLightBg_Far_3, Pal_DemonLightBg_Far_4, Pal_DemonLightBg_Far_5\n"
"	.4byte Pal_DemonLightBg_Far_6, Pal_DemonLightBg_Far_7, Pal_DemonLightBg_Far_8, Pal_DemonLightBg_Far_9, Pal_DemonLightBg_Far_10, Pal_DemonLightBg_Far_11\n"
"	.4byte Pal_DemonLightBg_Far_12, Pal_DemonLightBg_Far_13, Pal_DemonLightBg_Far_14, Pal_DemonLightBg_Far_15, Pal_DemonLightBg_Far_16, Pal_DemonLightBg_Far_17\n"
"	.4byte Pal_DemonLightBg_Far_18, Pal_DemonLightBg_Far_19, Pal_DemonLightBg_Far_20, Pal_DemonLightBg_Far_21, Pal_DemonLightBg_Far_22, Pal_DemonLightBg_Far_23\n"
"	.4byte Pal_DemonLightBg_Far_24, Pal_DemonLightBg_Far_25, Pal_DemonLightBg_Far_26, Pal_DemonLightBg_Far_27, Pal_DemonLightBg_Far_28, Pal_DemonLightBg_Far_29\n"
"	.4byte Pal_DemonLightBg_Far_30, Pal_DemonLightBg_Far_31, Pal_DemonLightBg_Far_32, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0xB4, 0x00000003\n"
"	.4byte efxMaohFlashBG2_Loop + 0x1, 0x00000000, 0x00000000, Tsa_DemonLightBg_0, Tsa_DemonLightBg_1, Tsa_DemonLightBg_2\n"
"	.4byte Img_DemonLightBg_2, Img_DemonLightBg_3, Img_DemonLightBg_4, Pal_DemonLightBg_0, Pal_DemonLightBg_1, Pal_Ekrdragonfx_2\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0xD4, 0x00000003, efxMaohFlashBG3_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_DemonLightBg3_Close_0, Tsa_DemonLightBg3_Close_1, Tsa_DemonLightBg3_Close_2, Tsa_DemonLightBg3_Close_3, Tsa_DemonLightBg3_Close_4, Img_DemonLightBg3_Close_0\n"
"	.4byte Img_DemonLightBg3_Close_1, Img_DemonLightBg3_Close_2, Img_DemonLightBg3_Close_3, Img_DemonLightBg3_Close_4, Pal_DemonLightBg3_Close_0, Pal_DemonLightBg3_Close_1\n"
"	.4byte Pal_DemonLightBg3_Close_2, Pal_DemonLightBg3_Close_3, Pal_DemonLightBg3_Close_4, Tsa_DemonLightBg3_Far_0, Tsa_DemonLightBg3_Far_1, Tsa_DemonLightBg3_Far_2\n"
"	.4byte Tsa_DemonLightBg3_Far_3, Tsa_DemonLightBg3_Far_4, Img_DemonLightBg3_Far_0, Img_DemonLightBg3_Far_1, Img_DemonLightBg3_Far_2, Img_DemonLightBg3_Far_3\n"
"	.4byte Img_DemonLightBg3_Far_4, Pal_DemonLightBg3_Far_0, Pal_DemonLightBg3_Far_1, Pal_DemonLightBg3_Far_2, Pal_DemonLightBg3_Far_3, Pal_DemonLightBg3_Far_4\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x10C, 0x00000003, sub_8068E34 + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Tsa_DemonLightBg4_Close_0, Tsa_DemonLightBg4_Close_1, Tsa_DemonLightBg4_Close_2, Tsa_DemonLightBg4_Close_3, Tsa_DemonLightBg4_Close_4, Tsa_DemonLightBg4_Close_5\n"
"	.4byte Tsa_DemonLightBg4_Close_6, Tsa_DemonLightBg4_Close_7, Img_DemonLightBg_0, Img_DemonLightBg4_Close_0, Img_DemonLightBg4_Close_1, Img_DemonLightBg4_Close_2\n"
"	.4byte Img_DemonLightBg4_Close_3, Img_DemonLightBg4_Close_4, Img_DemonLightBg4_Close_5, Img_DemonLightBg4_Close_6, Pal_DemonLightBg4_Close_0, Pal_DemonLightBg4_Close_1\n"
"	.4byte Pal_DemonLightBg4_Close_2, Pal_DemonLightBg4_Close_3, Pal_DemonLightBg4_Close_4, Pal_DemonLightBg4_Close_5, Pal_DemonLightBg4_Close_6, Pal_DemonLightBg4_Close_7\n"
"	.4byte Tsa_DemonLightBg4_Far_0, Tsa_DemonLightBg4_Far_1, Tsa_DemonLightBg4_Far_2, Tsa_DemonLightBg4_Far_3, Tsa_DemonLightBg4_Far_4, Tsa_DemonLightBg4_Far_5\n"
"	.4byte Tsa_DemonLightBg4_Far_6, Tsa_DemonLightBg4_Far_7, Img_DemonLightBg_1, Img_DemonLightBg4_Far_0, Img_DemonLightBg4_Far_1, Img_DemonLightBg4_Far_2\n"
"	.4byte Img_DemonLightBg4_Far_3, Img_DemonLightBg4_Far_4, Img_DemonLightBg4_Far_5, Img_DemonLightBg4_Far_6, Pal_DemonLightBg4_Far_0, Pal_DemonLightBg4_Far_1\n"
"	.4byte Pal_DemonLightBg4_Far_2, Pal_DemonLightBg4_Far_3, Pal_DemonLightBg4_Far_4, Pal_DemonLightBg4_Far_5, Pal_DemonLightBg4_Far_6, Pal_DemonLightBg4_Far_7\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x140, 0x00000003, efxMaohFlashWOUT_Loop_A + 0x1, 0x0020000E, 0x00000000\n"
"	.4byte 0x00000003, efxMaohFlashWOUT_Loop_B + 0x1, 0x00000000, 0x00000000, 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x154\n"
"	.4byte 0x0004000E, 0x00000000, 0x00000003, efxMaohFlashBGCOL_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009ab_0E3928 + 0x25C, 0x00000003, efxMaohFlashEyeLOBJ2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009b_0E3BA4, 0x00000003, efxMaohFlashEyeOBJ1_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009c_0E3BC4, 0x00000003, efxMaohFlashEyeFire1OBJ1_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009d_0E3BE0, 0x00000003, efxMaohFlashEyeFire2OBJ1_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009e_0E3C04, 0x00000003, efxMaohFlashThunderOBJ2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28, 0x00000003, gap_000695C4 + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x18, 0x00000003, efxMaohFlashEyeROBJ2_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x30, 0x00000003, efxStone_Loop_Main + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x3C, 0x00000003, efxStoneBG_Loop + 0x1, 0x00000000, 0x00000000\n"
"	.4byte Img_Banim_14, Img_Stone_0, Img_Stone_1, Img_Stone_2, Img_Stone_3, Img_Stone_4\n"
"	.4byte Img_Stone_5, Img_Stone_6, Img_Stone_7, Img_Stone_8, Img_Stone_9, Img_Stone_10\n"
"	.4byte Img_Stone_11, Img_Stone_12, Img_Stone_13, Img_Stone_14, Img_Stone_15, Img_Stone_16\n"
"	.4byte Img_Stone_17, Tsa_Stone_0, Tsa_Stone_1, Tsa_Stone_2, Tsa_Stone_3, Tsa_Stone_4\n"
"	.4byte Tsa_Stone_5, Tsa_Stone_6, Tsa_Stone_7, Tsa_Stone_8, Tsa_Stone_9, Tsa_Stone_10\n"
"	.4byte Tsa_Stone_11, Tsa_Stone_12, Tsa_Stone_13, Tsa_Stone_14, Tsa_Stone_15, Tsa_Stone_16\n"
"	.4byte Tsa_Stone_17, Tsa_Stone_18, 0x00000001, frontier_df4_misc_lo_009f_0E3C28 + 0x98, 0x00000003, efxStoneOBJ_Loop + 0x1\n"
"	.4byte 0x00000000, 0x00000000\n"
);