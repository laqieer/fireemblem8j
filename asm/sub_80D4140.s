	.syntax unified
	.set EndMenuScrollBar, 0x08099968 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8089078, 0x08089078 + 1
	.section .text.sub_80D4140, "ax", %progbits
@ sub_80D4140 @ JP 0x080D4140 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D4140
	.thumb_func
sub_80D4140:
	push {lr}
	bl sub_8089078
	ldr r0, _080D4154 @ =0x08BABB6C
	bl Proc_EndEach
	bl EndMenuScrollBar
	pop {r0}
	bx r0
	.align 2, 0
_080D4154: .4byte 0x08BABB6C

