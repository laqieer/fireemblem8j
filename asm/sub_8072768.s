	.syntax unified
	.set AddEkrDragonStatusAttr, 0x08072004 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8071FD8, 0x08071FD8 + 1
	.section .text.sub_8072768, "ax", %progbits
@ sub_8072768 @ JP 0x08072768 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072768
	.thumb_func
sub_8072768:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8071FD8
	adds r6, r0, #0
	ldr r0, _08072794 @ =0x087A8BA4
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r4, [r6, #4]
	adds r0, r5, #0
	movs r1, #1
	bl AddEkrDragonStatusAttr
	str r5, [r6, #0xc]
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072794: .4byte 0x087A8BA4

