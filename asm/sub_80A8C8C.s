	.syntax unified
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A8C8C, "ax", %progbits
@ sub_80A8C8C @ JP 0x080A8C8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8C8C
	.thumb_func
sub_80A8C8C:
	push {lr}
	ldr r2, _080A8CA0 @ =0x03006790
	ldr r1, _080A8CA4 @ =0x0203ECF0
	ldr r3, [r2]
	movs r2, #0xc0
	bl sub_80D65C8
	pop {r0}
	bx r0
	.align 2, 0
_080A8CA0: .4byte 0x03006790
_080A8CA4: .4byte 0x0203ECF0

