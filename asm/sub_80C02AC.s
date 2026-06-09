	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C02AC, "ax", %progbits
@ sub_80C02AC @ JP 0x080C02AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C02AC
	.thumb_func
sub_80C02AC:
	push {lr}
	ldr r0, _080C02B8 @ =0x08AC18EC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C02B8: .4byte 0x08AC18EC

