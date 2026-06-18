	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.section .text.sub_80108E4, "ax", %progbits
@ Event3B_DisplayCursor @ JP 0x080108E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event3B_DisplayCursor
	.thumb_func
Event3B_DisplayCursor:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08010900
	ldr r0, _080108FC @ =0x085B9CEC
	bl Proc_EndEach
	b _08010988
	.align 2, 0
_080108FC: .4byte 0x085B9CEC
_08010900:
	ldr r1, [r6, #0x38]
	ldrb r0, [r1]
	movs r7, #0xf
	ands r7, r0
	movs r0, #3
	ands r0, r7
	cmp r0, #1
	beq _08010944
	cmp r0, #1
	bgt _0801091A
	cmp r0, #0
	beq _08010920
	b _0801096C
_0801091A:
	cmp r0, #2
	beq _0801095E
	b _0801096C
_08010920:
	ldrh r0, [r1, #2]
	movs r5, #2
	ldrsb r5, [r1, r5]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x18
	cmp r5, #0
	blt _08010932
	cmp r4, #0
	bge _0801096C
_08010932:
	ldr r0, _08010940 @ =0x030004DC
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r4, #2
	ldrsb r4, [r0, r4]
	b _0801096C
	.align 2, 0
_08010940: .4byte 0x030004DC
_08010944:
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl sub_800BF3C
	cmp r0, #0
	bne _08010954
	movs r0, #6
	b _0801098A
_08010954:
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	b _0801096C
_0801095E:
	ldr r0, _08010968 @ =0x085B9CEC
	bl Proc_EndEach
	movs r0, #2
	b _0801098A
	.align 2, 0
_08010968: .4byte 0x085B9CEC
_0801096C:
	ldr r0, _08010990 @ =0x085B9CEC
	adds r1, r6, #0
	bl sub_8002BCC
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r5, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r7, [r0]
	adds r0, #2
	strh r1, [r0]
_08010988:
	movs r0, #0
_0801098A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010990: .4byte 0x085B9CEC

