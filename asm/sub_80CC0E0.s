	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80CC0E0, "ax", %progbits
@ sub_80CC0E0 @ JP 0x080CC0E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC0E0
	.thumb_func
sub_80CC0E0:
	push {lr}
	ldr r0, _080CC0EC @ =0x08B3F2F8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080CC0EC: .4byte 0x08B3F2F8

