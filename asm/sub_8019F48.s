	.syntax unified
	.set sub_80011F0, 0x080011F0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_800D4CC, 0x0800D4CC + 1
	.section .text.sub_8019F48, "ax", %progbits
@ sub_8019F48 @ JP 0x08019F48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019F48
	.thumb_func
sub_8019F48:
	push {r4, r5, r6, lr}
	ldr r6, _08019FAC @ =0x02030B88
	bl sub_800D4CC
	cmp r0, #0
	beq _08019F60
	ldr r0, _08019FB0 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019F9C
_08019F60:
	ldrh r1, [r6]
	ldr r4, _08019FB4 @ =0x000003FF
	adds r0, r4, #0
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r0, r5
	adds r6, #2
	bl sub_80011F0
	ldrh r1, [r6]
	adds r0, r4, #0
	ands r0, r1
	adds r0, r0, r5
	adds r6, #2
	bl sub_80011F0
	ldrh r1, [r6]
	adds r0, r4, #0
	ands r0, r1
	adds r0, r0, r5
	adds r6, #2
	bl sub_80011F0
	ldrh r0, [r6]
	ands r4, r0
	adds r4, r4, r5
	adds r0, r4, #0
	bl sub_80011F0
_08019F9C:
	ldr r1, _08019FB8 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019FAC: .4byte 0x02030B88
_08019FB0: .4byte 0x0202BCAC
_08019FB4: .4byte 0x000003FF
_08019FB8: .4byte 0x020228A8

