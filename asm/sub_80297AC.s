	.syntax unified
	.set ResetTextFont, 0x08003C50 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_8035848, 0x08035848 + 1
	.section .text.sub_80297AC, "ax", %progbits
@ sub_80297AC @ JP 0x080297AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80297AC
	.thumb_func
sub_80297AC:
	push {lr}
	bl ResetTextFont
	bl sub_801D730
	bl sub_8035848
	ldr r0, _080297D8 @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r0, _080297DC @ =0x085C3AE0
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080297D8: .4byte 0x03004DF0
_080297DC: .4byte 0x085C3AE0

