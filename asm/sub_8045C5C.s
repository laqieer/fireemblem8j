	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8045C5C, "ax", %progbits
@ sub_8045C5C @ JP 0x08045C5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045C5C
	.thumb_func
sub_8045C5C:
	push {lr}
	ldr r0, _08045C74 @ =0x085D325C
	bl Proc_EndEach
	ldr r0, _08045C78 @ =0x085D3284
	bl Proc_EndEach
	ldr r0, _08045C7C @ =0x085D3234
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08045C74: .4byte 0x085D325C
_08045C78: .4byte 0x085D3284
_08045C7C: .4byte 0x085D3234

