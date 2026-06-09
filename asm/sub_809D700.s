	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_809D700, "ax", %progbits
@ sub_809D700 @ JP 0x0809D700 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D700
	.thumb_func
sub_809D700:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

