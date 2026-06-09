	.syntax unified
	.set j_Checksum32, 0x080DC0FC + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AAE20, "ax", %progbits
@ sub_80AAE20 @ JP 0x080AAE20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AAE20
	.thumb_func
sub_80AAE20:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _080AAE40 @ =0x03006790
	ldr r4, _080AAE44 @ =0x02020188
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D65C8
	adds r0, r4, #0
	adds r1, r5, #0
	bl j_Checksum32
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AAE40: .4byte 0x03006790
_080AAE44: .4byte 0x02020188

