	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80326C0, "ax", %progbits
@ sub_80326C0 @ JP 0x080326C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80326C0
	.thumb_func
sub_80326C0:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080326F4 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080326E8
	ldr r0, _080326F8 @ =0x0203A4E8
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080326F0
	ldr r0, _080326FC @ =0x0203A568
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080326F0
_080326E8:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_080326F0:
	pop {r0}
	bx r0
	.align 2, 0
_080326F4: .4byte 0x0203A4D0
_080326F8: .4byte 0x0203A4E8
_080326FC: .4byte 0x0203A568

