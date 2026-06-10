	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_800D48C, "ax", %progbits
@ sub_800D48C @ JP 0x0800D48C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D48C
	.thumb_func
sub_800D48C:
	push {lr}
	ldr r0, _0800D4A0 @ =0x085B98A0
	bl Proc_EndEach
	ldr r0, _0800D4A4 @ =0x085B98D8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0800D4A0: .4byte 0x085B98A0
_0800D4A4: .4byte 0x085B98D8

