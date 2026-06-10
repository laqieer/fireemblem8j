	.syntax unified
	.set BMapDispSuspend, 0x080300D4 + 1
	.set sub_807B4F4, 0x0807B4F4 + 1
	.section .text.sub_800F338, "ax", %progbits
@ sub_800F338 @ JP 0x0800F338 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F338
	.thumb_func
sub_800F338:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0800F352
	bl BMapDispSuspend
	bl sub_807B4F4
_0800F352:
	ldrh r1, [r4, #0x3c]
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

