	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8073B80, 0x08073B80 + 1
	.section .text.sub_8078A04, "ax", %progbits
@ sub_8078A04 @ JP 0x08078A04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078A04
	.thumb_func
sub_8078A04:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0x10
	bl sub_8012E84
	bl sub_8073B80
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08078A38
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
_08078A38:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

