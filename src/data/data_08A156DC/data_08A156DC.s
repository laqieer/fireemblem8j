/* byte-neutral SPLIT of data_08A156DC into 2 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A156DC, "aw", %progbits
	.global ProcScr_SpellAssocUnused
ProcScr_SpellAssocUnused:
	.4byte 0x00000002
	.4byte MapAnim_MoveCameraOnTarget + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte MapAnim_PoisonEffectOnTarget + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x005E000E
	.4byte 0x00000000
	.4byte 0x000A000E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.section .data.residue.08A15714, "aw", %progbits
	.global ProcScr_PoisonDmgMapEffect
ProcScr_PoisonDmgMapEffect:
	.4byte 0x00000002
	.4byte MapAnim_MoveCameraOnTarget + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte MapAnim_PoisonEffectOnTarget + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x0032000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte MapAnim_BeginRoundSpecificAnims + 0x1
	.4byte 0x001E000E
	.4byte 0x00000000
	.4byte 0x00000003
	.4byte MapAnim_WaitForHPToEndChangingMaybe + 0x1
	.4byte 0x002C000E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice data_08A156DC: ptr=6 data=28 skip=0 */
