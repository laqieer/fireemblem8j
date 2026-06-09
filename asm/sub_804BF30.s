	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set StartAiTargetCursor, 0x08039F44 + 1
	.section .text.sub_804BF30, "ax", %progbits
@ sub_804BF30 @ JP 0x0804BF30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BF30
	.thumb_func
sub_804BF30:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BF5C @ =0x0300182C
	ldrb r0, [r0, #1]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl StartAiTargetCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF5C: .4byte 0x0300182C

