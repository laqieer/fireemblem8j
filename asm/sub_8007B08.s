	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8007B08, "ax", %progbits
@ sub_8007B08 @ JP 0x08007B08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007B08
	.thumb_func
sub_8007B08:
	push {lr}
	ldr r0, _08007B1C @ =0x085B90D8
	bl Proc_EndEach
	ldr r0, _08007B20 @ =0x085B9208
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08007B1C: .4byte 0x085B90D8
_08007B20: .4byte 0x085B9208

