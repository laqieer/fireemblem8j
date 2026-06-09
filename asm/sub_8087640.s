	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8087640, "ax", %progbits
@ sub_8087640 @ JP 0x08087640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087640
	.thumb_func
sub_8087640:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08087650 @ =0x08A600B0
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08087650: .4byte 0x08A600B0

