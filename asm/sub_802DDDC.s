	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_802DDDC, "ax", %progbits
@ sub_802DDDC @ JP 0x0802DDDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DDDC
	.thumb_func
sub_802DDDC:
	push {lr}
	ldr r0, _0802DDE8 @ =0x085C40EC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0802DDE8: .4byte 0x085C40EC

