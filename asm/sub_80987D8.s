	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802F4B8, 0x0802F4B8 + 1
	.section .text.sub_80987D8, "ax", %progbits
@ sub_80987D8 @ JP 0x080987D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80987D8
	.thumb_func
sub_80987D8:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _080987F2
	adds r0, r4, #0
	bl Proc_End
	b _0809883A
_080987F2:
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, _08098840 @ =0x03003020
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
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl sub_802F4B8
	ldr r1, _08098844 @ =0x0203A4D0
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _08098848 @ =0x0203A4E8
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, _0809884C @ =0x0203A568
	adds r0, #0x4a
	strh r4, [r0]
	bl sub_802C94C
_0809883A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098840: .4byte 0x03003020
_08098844: .4byte 0x0203A4D0
_08098848: .4byte 0x0203A4E8
_0809884C: .4byte 0x0203A568

