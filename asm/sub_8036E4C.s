	.syntax unified
	.set GetFactionBattleForecastFramePalette, 0x08036E0C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8036E4C, "ax", %progbits
@ sub_8036E4C @ JP 0x08036E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036E4C
	.thumb_func
sub_8036E4C:
	push {r4, lr}
	ldr r0, _08036E80 @ =0x0203A4E8
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0xc0
	ands r0, r4
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x20
	movs r2, #0x20
	bl sub_8000D68
	ldr r1, _08036E84 @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08036E88
	ands r0, r4
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	b _08036E96
	.align 2, 0
_08036E80: .4byte 0x0203A4E8
_08036E84: .4byte 0x0203A568
_08036E88:
	movs r0, #0xc0
	bl GetFactionBattleForecastFramePalette
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
_08036E96:
	pop {r4}
	pop {r0}
	bx r0

