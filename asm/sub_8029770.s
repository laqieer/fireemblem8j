	.syntax unified
	.set ResetTextFont, 0x08003C50 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_8035848, 0x08035848 + 1
	.section .text.sub_8029770, "ax", %progbits
@ sub_8029770 @ JP 0x08029770 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029770
	.thumb_func
sub_8029770:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ResetTextFont
	bl sub_801D730
	bl sub_8035848
	ldr r4, _080297A8 @ =0x03004DF0
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_8015E18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080297A8: .4byte 0x03004DF0

