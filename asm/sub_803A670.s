	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_803A670, "ax", %progbits
@ sub_803A670 @ JP 0x0803A670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A670
	.thumb_func
sub_803A670:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_80D65C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803A694
	adds r0, r4, #0
	bl sub_8002DE4
_0803A694:
	ldr r3, _0803A6AC @ =0x03004DF0
	ldr r1, [r3]
	ldr r2, _0803A6B0 @ =0x0203AA90
	ldrb r0, [r2, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r3]
	ldrb r0, [r2, #3]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A6AC: .4byte 0x03004DF0
_0803A6B0: .4byte 0x0203AA90

