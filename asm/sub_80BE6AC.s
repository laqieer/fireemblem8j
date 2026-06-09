	.syntax unified
	.set ClearWmHblank, 0x080C6B2C + 1
	.set Proc_EndEachMarked, 0x08002F90 + 1
	.section .text.sub_80BE6AC, "ax", %progbits
@ sub_80BE6AC @ JP 0x080BE6AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE6AC
	.thumb_func
sub_80BE6AC:
	push {lr}
	bl ClearWmHblank
	movs r0, #8
	bl Proc_EndEachMarked
	pop {r0}
	bx r0

