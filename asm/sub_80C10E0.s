	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C10E0, "ax", %progbits
@ sub_80C10E0 @ JP 0x080C10E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C10E0
	.thumb_func
sub_80C10E0:
	push {lr}
	adds r2, r0, #0
	cmp r1, #1
	bgt _080C1100
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r1, [r3]
	movs r0, #3
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	b _080C111A
_080C1100:
	movs r0, #0
	strh r1, [r2, #0x3c]
	strh r0, [r2, #0x3e]
	adds r3, r2, #0
	adds r3, #0x32
	ldrb r1, [r3]
	movs r0, #1
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_080C111A:
	pop {r0}
	bx r0
	.align 2, 0

