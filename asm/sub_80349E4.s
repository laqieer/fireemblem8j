	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetUnitAidIconId, 0x08018804 + 1
	.section .text.sub_80349E4, "ax", %progbits
@ sub_80349E4 @ JP 0x080349E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80349E4
	.thumb_func
sub_80349E4:
	push {r4, lr}
	lsls r4, r2, #5
	adds r4, #4
	adds r4, r4, r1
	lsls r4, r4, #1
	ldr r1, _08034A14 @ =0x02022CA8
	adds r4, r4, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034A14: .4byte 0x02022CA8

