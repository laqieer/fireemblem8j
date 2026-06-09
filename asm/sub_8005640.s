	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8005640, "ax", %progbits
@ sub_8005640 @ JP 0x08005640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005640
	.thumb_func
sub_8005640:
	push {lr}
	ldr r2, _0800565C @ =0x03004920
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	str r2, [r1]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0800565C: .4byte 0x03004920

