	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetNextGameActionId, 0x08009EB0 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_80B74B8, "ax", %progbits
@ sub_80B74B8 @ JP 0x080B74B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B74B8
	.thumb_func
sub_80B74B8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B7510 @ =0x08A9DD0C
	bl Proc_Find
	bl Proc_End
	ldr r0, _080B7514 @ =0x08A9DD34
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	bl sub_80B2874
	movs r0, #1
	bl sub_800226C
	ldr r2, _080B7518 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetNextGameActionId
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7510: .4byte 0x08A9DD0C
_080B7514: .4byte 0x08A9DD34
_080B7518: .4byte 0x03003020

