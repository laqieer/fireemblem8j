	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8083510, "ax", %progbits
@ sub_8083510 @ JP 0x08083510 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083510
	.thumb_func
sub_8083510:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08083528 @ =0x08A14DBC
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r0, #0x42
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083528: .4byte 0x08A14DBC

