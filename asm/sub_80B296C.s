	.syntax unified
	.section .text.sub_80B296C, "ax", %progbits
@ BgAffinAnchoring @ JP 0x080B296C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BgAffinAnchoring
	.thumb_func
BgAffinAnchoring:
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r5, r3, #0x10
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	movs r4, #0
	cmp r0, #2
	bne _080B298C
	ldr r4, _080B29C0 @ =0x03003068
_080B298C:
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r3, r1, #0
	adds r1, r0, #0
	muls r1, r3, r1
	movs r7, #2
	ldrsh r0, [r4, r7]
	rsbs r2, r2, #0
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r5, #8
	adds r1, r1, r0
	str r1, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	muls r0, r3, r0
	movs r3, #6
	ldrsh r1, [r4, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B29C0: .4byte 0x03003068

