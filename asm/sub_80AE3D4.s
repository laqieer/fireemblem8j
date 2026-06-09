	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80AE3D4, "ax", %progbits
@ sub_80AE3D4 @ JP 0x080AE3D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE3D4
	.thumb_func
sub_80AE3D4:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0x24
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080AE416
	adds r0, r5, #0
	bl sub_8002DE4
_080AE416:
	pop {r4, r5}
	pop {r0}
	bx r0

