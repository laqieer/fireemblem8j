	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A9C44, "ax", %progbits
@ sub_80A9C44 @ JP 0x080A9C44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9C44
	.thumb_func
sub_80A9C44:
	push {r4, lr}
	adds r4, r1, #0
	bl GetSaveReadAddr
	ldr r1, _080A9C60 @ =0x03006790
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x4c
	bl sub_80D65C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C60: .4byte 0x03006790

