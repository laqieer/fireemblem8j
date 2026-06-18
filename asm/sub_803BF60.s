	.syntax unified
	.section .text.sub_803BF60, "ax", %progbits
@ AiIsWithinRectDistance @ JP 0x0803BF60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiIsWithinRectDistance
	.thumb_func
AiIsWithinRectDistance:
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	adds r7, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r1, r5, r2
	cmp r1, #0
	bge _0803BF84
	subs r1, r2, r5
_0803BF84:
	subs r0, r0, r3
	cmp r0, #0
	bge _0803BF8C
	subs r0, r6, r7
_0803BF8C:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bls _0803BF9A
	movs r0, #0
	b _0803BF9C
_0803BF9A:
	movs r0, #1
_0803BF9C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

