	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8073820, 0x08073820 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_806ADC4, "ax", %progbits
@ sub_806ADC4 @ JP 0x0806ADC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806ADC4
	.thumb_func
sub_806ADC4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0806AE04
	ldr r0, [r4, #0x4c]
	ldr r4, _0806AE00 @ =0x020165C8
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl sub_8073820
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80567E0
	b _0806AE1A
	.align 2, 0
_0806AE00: .4byte 0x020165C8
_0806AE04:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0806AE1A
	ldr r1, _0806AE20 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806AE1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AE20: .4byte 0x0201774C

