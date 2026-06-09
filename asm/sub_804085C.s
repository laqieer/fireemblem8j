	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803BF60, 0x0803BF60 + 1
	.set sub_8040AB8, 0x08040AB8 + 1
	.section .text.sub_804085C, "ax", %progbits
@ sub_804085C @ JP 0x0804085C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804085C
	.thumb_func
sub_804085C:
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, _080408E4 @ =0x0203AA00
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, _080408E8 @ =0x80000001
	ands r0, r1
	cmp r0, #0
	beq _080408DC
	ldr r0, _080408EC @ =0x03004DF0
	ldr r0, [r0]
	add r5, sp, #0xc
	adds r1, r5, #0
	bl sub_8040AB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080408DC
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl sub_803BA10
	ldr r4, _080408F0 @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _080408DC
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	movs r5, #0
	str r5, [sp]
	bl sub_803BF60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080408DC
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_080408DC:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080408E4: .4byte 0x0203AA00
_080408E8: .4byte 0x80000001
_080408EC: .4byte 0x03004DF0
_080408F0: .4byte 0x0203AA90

