	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetUnit, 0x08019108 + 1
	.set MarkMovementMapEdges, 0x0801A5C0 + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_803C420, 0x0803C420 + 1
	.set sub_803FA68, 0x0803FA68 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_80400E4, "ax", %progbits
@ sub_80400E4 @ JP 0x080400E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80400E4
	.thumb_func
sub_80400E4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r0, _08040214 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08040202
	ldr r0, _08040218 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
	bl MarkMovementMapEdges
	ldr r0, _0804021C @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _080401E2
_08040132:
	ldr r0, _0804021C @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt _080401DC
	lsls r1, r7, #2
	mov r8, r1
_08040146:
	ldr r0, _08040220 @ =0x0202E4DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080401D6
	ldr r0, _08040224 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080401D6
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _08040214 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0804018E
	mov r2, sb
	cmp r2, #0
	beq _0804018E
	adds r0, r5, #0
	bl sub_80D65E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080401D6
_0804018E:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080401D6
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _080401D6
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_803FA68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080401D6
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _08040224 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_080401D6:
	subs r4, #1
	cmp r4, #0
	bge _08040146
_080401DC:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _08040132
_080401E2:
	mov r2, sl
	cmp r2, #0
	beq _08040202
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_08040202:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040214: .4byte 0x0203AA00
_08040218: .4byte 0x03004DF0
_0804021C: .4byte 0x0202E4D0
_08040220: .4byte 0x0202E4DC
_08040224: .4byte 0x0202E4D4

