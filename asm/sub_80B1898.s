	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80B1898, "ax", %progbits
@ sub_80B1898 @ JP 0x080B1898 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1898
	.thumb_func
sub_80B1898:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _080B18B2
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x34]
	bl sub_80D65C0
	adds r0, r4, #0
	bl sub_8002DE4
_080B18B2:
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

