	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80759F4, "ax", %progbits
@ sub_80759F4 @ JP 0x080759F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80759F4
	.thumb_func
sub_80759F4:
	push {lr}
	ldr r0, _08075A04 @ =0x020200B4
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08075A04: .4byte 0x020200B4

