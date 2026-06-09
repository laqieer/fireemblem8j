	.syntax unified
	.set sub_8031F58, 0x08031F58 + 1
	.section .text.sub_803A3D0, "ax", %progbits
@ sub_803A3D0 @ JP 0x0803A3D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A3D0
	.thumb_func
sub_803A3D0:
	push {r4, lr}
	ldr r2, _0803A3F8 @ =0x0203A954
	ldr r1, _0803A3FC @ =0x0202BE40
	ldrb r1, [r1]
	strb r1, [r2, #0xc]
	movs r1, #8
	strb r1, [r2, #0x11]
	ldr r4, _0803A400 @ =0x03004DF0
	ldr r2, [r4]
	ldr r3, _0803A404 @ =0x0203AA90
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	bl sub_8031F58
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A3F8: .4byte 0x0203A954
_0803A3FC: .4byte 0x0202BE40
_0803A400: .4byte 0x03004DF0
_0803A404: .4byte 0x0203AA90

