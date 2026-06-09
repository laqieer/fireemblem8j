	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80974AC, "ax", %progbits
@ sub_80974AC @ JP 0x080974AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80974AC
	.thumb_func
sub_80974AC:
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #2
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

