	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8099D84, "ax", %progbits
@ sub_8099D84 @ JP 0x08099D84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099D84
	.thumb_func
sub_8099D84:
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	asrs r4, r4, #0x18
	ldr r0, _08099DA0 @ =0x08A94584
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08099DA0: .4byte 0x08A94584

