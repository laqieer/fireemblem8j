	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_80B75A0, 0x080B75A0 + 1
	.section .text.sub_80B87C0, "ax", %progbits
@ sub_80B87C0 @ JP 0x080B87C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B87C0
	.thumb_func
sub_80B87C0:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2c]
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B87F0
	bl sub_80B75A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B87E8
	movs r0, #0x3c
	bl sub_800226C
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080B87F0
_080B87E8:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080B87F0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

