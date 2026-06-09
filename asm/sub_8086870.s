	.syntax unified
	.set memset, 0x080D6968 + 1
	.section .text.sub_8086870, "ax", %progbits
@ sub_8086870 @ JP 0x08086870 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086870
	.thumb_func
sub_8086870:
	push {lr}
	ldr r0, _08086880 @ =0x03001C78
	movs r1, #0
	movs r2, #0x40
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08086880: .4byte 0x03001C78

