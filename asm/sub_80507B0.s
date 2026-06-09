	.syntax unified
	.set GetLinkedTargets, 0x08050A84 + 1
	.set LockGame, 0x08015384 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80507B0, "ax", %progbits
@ sub_80507B0 @ JP 0x080507B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80507B0
	.thumb_func
sub_80507B0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl LockGame
	ldr r0, _08050810 @ =0x085E073C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x34
	movs r6, #0
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x2c]
	bl GetLinkedTargets
	str r0, [r5, #0x30]
	str r6, [r5, #0x38]
	ldr r0, [r5, #0x2c]
	ldr r1, [r0]
	cmp r1, #0
	beq _080507E4
	adds r0, r5, #0
	bl sub_80D65C0
_080507E4:
	ldr r0, [r5, #0x2c]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _080507F2
	adds r0, r5, #0
	bl sub_80D65C0
_080507F2:
	ldr r0, [r5, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _08050802
	ldr r1, [r5, #0x30]
	adds r0, r5, #0
	bl sub_80D65C4
_08050802:
	ldr r0, _08050814 @ =0x085775CC
	ldr r0, [r0]
	strh r6, [r0, #8]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08050810: .4byte 0x085E073C
_08050814: .4byte 0x085775CC

