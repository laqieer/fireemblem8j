	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567B8, 0x080567B8 + 1
	.section .text.sub_8070390, "ax", %progbits
@ sub_8070390 @ JP 0x08070390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070390
	.thumb_func
sub_8070390:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080703D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080703D8 @ =0x0860390C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080703DC @ =0x080E4842
	str r1, [r0, #0x48]
	ldr r1, _080703E0 @ =0x08603924
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _080703E4 @ =0x0875B570
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080703D4: .4byte 0x0201774C
_080703D8: .4byte 0x0860390C
_080703DC: .4byte 0x080E4842
_080703E0: .4byte 0x08603924
_080703E4: .4byte 0x0875B570

