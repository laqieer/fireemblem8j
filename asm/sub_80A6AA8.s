	.syntax unified
	.section .text.sub_80A6AA8, "ax", %progbits
@ sub_80A6AA8 @ JP 0x080A6AA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6AA8
	.thumb_func
sub_80A6AA8:
	ldr r2, _080A6ABC @ =0x02014F24
	ldr r1, [r2]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_080A6ABC: .4byte 0x02014F24

