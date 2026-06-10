	.syntax unified
	.set ForceScreenToBlack, 0x08014268 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_800D74C, "ax", %progbits
@ sub_800D74C @ JP 0x0800D74C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D74C
	.thumb_func
sub_800D74C:
	push {lr}
	bl ForceScreenToBlack
	ldr r0, _0800D75C @ =0x085B92D8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800D75C: .4byte 0x085B92D8

