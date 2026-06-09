	.syntax unified
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A8C60, "ax", %progbits
@ sub_80A8C60 @ JP 0x080A8C60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8C60
	.thumb_func
sub_80A8C60:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8C80 @ =0x03006790
	ldr r1, _080A8C84 @ =0x0203E890
	movs r2, #0x8c
	lsls r2, r2, #3
	ldr r3, [r0]
	adds r0, r4, #0
	bl sub_80D65C8
	ldr r0, _080A8C88 @ =0x0203E88C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8C80: .4byte 0x03006790
_080A8C84: .4byte 0x0203E890
_080A8C88: .4byte 0x0203E88C

