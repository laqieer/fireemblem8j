	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetTrapAt, 0x0802E128 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803CF44, 0x0803CF44 + 1
	.set sub_803D0B4, 0x0803D0B4 + 1
	.set sub_8040FA0, 0x08040FA0 + 1
	.section .text.sub_803D1B8, "ax", %progbits
@ sub_803D1B8 @ JP 0x0803D1B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803D1B8
	.thumb_func
sub_803D1B8:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _0803D228 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8040FA0
	ldr r0, _0803D22C @ =0x085D2054
	add r4, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl sub_803D0B4
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _0803D244
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	add r5, sp, #0x14
	adds r2, r5, #0
	add r3, sp, #0xc
	bl sub_803CF44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D230
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl GetTrapAt
	cmp r0, #0
	beq _0803D258
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	ldrb r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0
	bl AiSetDecision
	b _0803D252
	.align 2, 0
_0803D228: .4byte 0x03004DF0
_0803D22C: .4byte 0x085D2054
_0803D230:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
	b _0803D252
_0803D244:
	ldr r0, _0803D260 @ =0x0203AA00
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D264 @ =0x030017C0
	strb r2, [r0]
_0803D252:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_0803D258:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D260: .4byte 0x0203AA00
_0803D264: .4byte 0x030017C0

