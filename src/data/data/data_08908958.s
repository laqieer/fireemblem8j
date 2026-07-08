/* Byte-neutral SPLIT of the former data_08908958 residue (420 B) into 25 named sub-objects. The .4byte
 * directive stream is preserved verbatim; only .section/.global/label
 * markers are inserted at word boundaries (NO .align). make compare is the oracle. */
	.section .data.residue.08908958, "aw", %progbits
	.global UnitDef_LordSplitAlly
UnitDef_LordSplitAlly:
	.4byte 0x08004806
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x006C1C15
	.4byte 0x00000000
	.4byte 0x18004505
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00006C4B
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.08908994, "aw", %progbits
	.global UnitDef_Ch2Ally
UnitDef_Ch2Ally:
	.4byte 0x08004806
	.4byte 0x01000040
	.4byte REDA_Ch2Ally_VANESSA
	.4byte 0x006C1C15
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.089089BC, "aw", %progbits
	.global UnitDef_Ch2NPC
UnitDef_Ch2NPC:
	.4byte 0x0A003D07
	.4byte 0x0100008B
	.4byte REDA_Ch2NPC_ROSS
	.4byte 0x00006C2C
	.4byte 0x00000A00
	.4byte 0x22003F0A
	.4byte 0x0100008B
	.4byte REDA_Ch2NPC_GARCIA
	.4byte 0x006C281F
	.4byte 0x00000300
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.089089F8, "aw", %progbits
	.global UnitDef_Ch2Enemy_1
UnitDef_Ch2Enemy_1:
	.4byte 0x1500418E
	.4byte 0x01000240
	.4byte REDA_Ch2Enemy_1_0
	.4byte 0x0000001F
	.4byte 0x00090400
	.4byte 0x1D00418E
	.4byte 0x01000240
	.4byte REDA_Ch2Enemy_1_1
	.4byte 0x0000001F
	.4byte 0x00090400
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.08908A34, "aw", %progbits
	.global UnitDef_Ch2Enemy_2
UnitDef_Ch2Enemy_2:
	.4byte 0x35004148
	.4byte 0x0100020E
	.4byte REDA_Ch2Enemy_2_BAZBA
	.4byte 0x00000020
	.4byte 0x00090400
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.08908A5C, "aw", %progbits
	.global REDA_Event_Ch3Ally_EIRIKA
REDA_Event_Ch3Ally_EIRIKA:
	.4byte 0x000002C2
	.4byte 0x0000FFFF
	.section .data.residue.08908A64, "aw", %progbits
	.global REDA_Event_Ch3Ally_MOULDER
REDA_Event_Ch3Ally_MOULDER:
	.4byte 0x00000303
	.4byte 0x0000FFFF
	.section .data.residue.08908A6C, "aw", %progbits
	.global REDA_Event_Ch3Ally_ROSS
REDA_Event_Ch3Ally_ROSS:
	.4byte 0x00000283
	.4byte 0x0000FFFF
	.section .data.residue.08908A74, "aw", %progbits
	.global REDA_Event_Ch3Ally_VANESSA
REDA_Event_Ch3Ally_VANESSA:
	.4byte 0x00000342
	.4byte 0x0000FFFF
	.section .data.residue.08908A7C, "aw", %progbits
	.global REDA_Event_Ch3Ally_GILLIAM
REDA_Event_Ch3Ally_GILLIAM:
	.4byte 0x00000201
	.4byte 0x0000FFFF
	.section .data.residue.08908A84, "aw", %progbits
	.global REDA_Event_Ch3Ally_FRANZ
REDA_Event_Ch3Ally_FRANZ:
	.4byte 0x000002C0
	.4byte 0x0000FFFF
	.section .data.residue.08908A8C, "aw", %progbits
	.global REDA_Event_Ch3Ally_NEIMI
REDA_Event_Ch3Ally_NEIMI:
	.4byte 0x00000281
	.4byte 0x0000FFFF
	.section .data.residue.08908A94, "aw", %progbits
	.global REDA_Event_Ch3Ally_SETH
REDA_Event_Ch3Ally_SETH:
	.4byte 0x00000301
	.4byte 0x0000FFFF
	.section .data.residue.08908A9C, "aw", %progbits
	.global REDA_Event_Ch3Ally_GARCIA
REDA_Event_Ch3Ally_GARCIA:
	.4byte 0x00000242
	.4byte 0x0000FFFF
	.section .data.residue.08908AA4, "aw", %progbits
	.global REDA_Ch3Enemy_0_0
REDA_Ch3Enemy_0_0:
	.4byte 0x0000004E
	.4byte 0x0000FFFF
	.section .data.residue.08908AAC, "aw", %progbits
	.global REDA_Ch3Enemy_0_1
REDA_Ch3Enemy_0_1:
	.4byte 0x00000087
	.4byte 0x0000FFFF
	.section .data.residue.08908AB4, "aw", %progbits
	.global REDA_Ch3Enemy_0_2
REDA_Ch3Enemy_0_2:
	.4byte 0x00000209
	.4byte 0x0000FFFF
	.section .data.residue.08908ABC, "aw", %progbits
	.global REDA_Ch3Enemy_0_3
REDA_Ch3Enemy_0_3:
	.4byte 0x0000008F
	.4byte 0x0000FFFF
	.section .data.residue.08908AC4, "aw", %progbits
	.global REDA_Ch3Enemy_0_4
REDA_Ch3Enemy_0_4:
	.4byte 0x0000024C
	.4byte 0x0000FFFF
	.section .data.residue.08908ACC, "aw", %progbits
	.global REDA_Ch3Enemy_0_5
REDA_Ch3Enemy_0_5:
	.4byte 0x0000018E
	.4byte 0x0000FFFF
	.section .data.residue.08908AD4, "aw", %progbits
	.global REDA_Ch3Enemy_0_6
REDA_Ch3Enemy_0_6:
	.4byte 0x000002C9
	.4byte 0x0000FFFF
	.section .data.residue.08908ADC, "aw", %progbits
	.global REDA_Ch3Enemy_0_7
REDA_Ch3Enemy_0_7:
	.4byte 0x000002CE
	.4byte 0x0000FFFF
	.section .data.residue.08908AE4, "aw", %progbits
	.global REDA_Ch3Enemy_0_8
REDA_Ch3Enemy_0_8:
	.4byte 0x00000245
	.4byte 0x0000FFFF
	.section .data.residue.08908AEC, "aw", %progbits
	.global REDA_Ch3Enemy_0_9
REDA_Ch3Enemy_0_9:
	.4byte 0x000002C7
	.4byte 0x0000FFFF
	.section .data.residue.08908AF4, "aw", %progbits
	.global REDA_Ch3NPC_COLM
REDA_Ch3NPC_COLM:
	.4byte 0x00000140
	.4byte 0x0000FFFF
