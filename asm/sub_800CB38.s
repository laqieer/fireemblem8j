	.syntax unified
	.set StartGmPalFade_, 0x080C456C + 1
	.section .text.sub_800CB38, "ax", %progbits
@ sub_800CB38 @ JP 0x0800CB38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CB38
	.thumb_func
sub_800CB38:
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CB50
	movs r0, #0
	adds r1, r2, #0
	b _0800CB54
_0800CB50:
	movs r0, #0
	movs r1, #0
_0800CB54:
	bl StartGmPalFade_
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

