	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802F584, 0x0802F584 + 1
	.section .text.sub_80D2AEC, "ax", %progbits
@ sub_80D2AEC @ JP 0x080D2AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2AEC
	.thumb_func
sub_80D2AEC:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r7, [r5, #0x14]
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r6, r0, #0
	cmp r6, #0
	bne _080D2B0C
	adds r0, r4, #0
	bl Proc_End
	b _080D2B66
_080D2B0C:
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	ldr r2, _080D2B54 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r6, #0
	movs r3, #0
	bl sub_802F584
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #2
	beq _080D2B5C
	ldr r1, _080D2B58 @ =0x0203A4D0
	movs r0, #0x88
	lsls r0, r0, #1
	b _080D2B60
	.align 2, 0
_080D2B54: .4byte 0x03003020
_080D2B58: .4byte 0x0203A4D0
_080D2B5C:
	ldr r1, _080D2B6C @ =0x0203A4D0
	movs r0, #0x10
_080D2B60:
	strh r0, [r1]
	bl sub_802C94C
_080D2B66:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D2B6C: .4byte 0x0203A4D0

