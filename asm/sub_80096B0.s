	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80096B0, "ax", %progbits
@ sub_80096B0 @ JP 0x080096B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80096B0
	.thumb_func
sub_80096B0:
	push {lr}
	ldr r0, _080096BC @ =0x085B9424
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080096BC: .4byte 0x085B9424

