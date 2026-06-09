	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80974C0, "ax", %progbits
@ sub_80974C0 @ JP 0x080974C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80974C0
	.thumb_func
sub_80974C0:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x33
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #1
	str r1, [sp]
	movs r0, #0x37
	adds r1, r2, #0
	movs r3, #0x20
	bl ChangeBgm
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

