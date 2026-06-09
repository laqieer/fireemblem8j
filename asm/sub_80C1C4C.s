	.syntax unified
	.set GetGmPathBetweenNodes, 0x080C1BFC + 1
	.set GetGmPathWaypointCount, 0x080C1218 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C1C4C, "ax", %progbits
@ sub_80C1C4C @ JP 0x080C1C4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1C4C
	.thumb_func
sub_80C1C4C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r3, #0
	ldr r5, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	mov sb, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r2, sp
	bl GetGmPathBetweenNodes
	mov sl, r0
	cmp r0, #0
	bge _080C1C76
	movs r0, #0
	b _080C1DA6
_080C1C76:
	movs r0, #0
	strh r0, [r7]
	mov r0, sl
	lsls r4, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #2
	ldr r1, _080C1D14 @ =0x081F6340
	adds r0, r0, r1
	mov r8, r0
	adds r0, #4
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #5
	ldr r0, _080C1D18 @ =0x081F5D7C
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	mov r3, sb
	lsls r0, r3
	str r0, [r5]
	movs r2, #0x1a
	ldrsh r0, [r1, r2]
	lsls r0, r3
	str r0, [r5, #4]
	adds r7, #2
	adds r5, #8
	mov r0, sl
	bl GetGmPathWaypointCount
	adds r3, r0, #0
	ldr r0, [sp]
	str r4, [sp, #0xc]
	cmp r0, #0
	bne _080C1D1C
	movs r6, #0
	adds r0, r3, #2
	str r0, [sp, #8]
	cmp r6, r3
	bge _080C1D6C
	mov r2, r8
_080C1CCC:
	ldr r0, [r2, #8]
	lsls r4, r6, #3
	adds r0, r4, r0
	ldr r0, [r0]
	mov r8, r0
	ldr r0, [sp, #4]
	mov r1, r8
	muls r1, r0, r1
	mov r8, r1
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	bl sub_80D6378
	strh r0, [r7]
	ldr r2, [sp, #0x10]
	ldr r0, [r2, #8]
	adds r4, r4, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	mov r1, sb
	lsls r0, r1
	str r0, [r5]
	movs r1, #6
	ldrsh r0, [r4, r1]
	mov r1, sb
	lsls r0, r1
	str r0, [r5, #4]
	adds r7, #2
	adds r5, #8
	adds r6, #1
	ldr r3, [sp, #0x14]
	cmp r6, r3
	blt _080C1CCC
	b _080C1D6C
	.align 2, 0
_080C1D14: .4byte 0x081F6340
_080C1D18: .4byte 0x081F5D7C
_080C1D1C:
	subs r6, r3, #1
	adds r3, #2
	str r3, [sp, #8]
	cmp r6, #0
	blt _080C1D6C
	mov r2, r8
_080C1D28:
	ldr r0, [r2, #8]
	lsls r4, r6, #3
	adds r0, r4, r0
	ldr r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	subs r0, r3, r0
	ldr r3, [sp, #4]
	adds r1, r3, #0
	muls r1, r0, r1
	mov r8, r1
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp, #0x10]
	bl sub_80D6378
	strh r0, [r7]
	ldr r2, [sp, #0x10]
	ldr r0, [r2, #8]
	adds r4, r4, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	mov r3, sb
	lsls r0, r3
	str r0, [r5]
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r3
	str r0, [r5, #4]
	adds r7, #2
	adds r5, #8
	subs r6, #1
	cmp r6, #0
	bge _080C1D28
_080C1D6C:
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r7]
	ldr r0, [sp, #0xc]
	add r0, sl
	lsls r0, r0, #2
	ldr r1, _080C1DB8 @ =0x081F6340
	adds r0, r0, r1
	ldr r2, [sp]
	movs r1, #1
	subs r1, r1, r2
	adds r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #5
	ldr r0, _080C1DBC @ =0x081F5D7C
	adds r1, r1, r0
	movs r3, #0x18
	ldrsh r0, [r1, r3]
	mov r2, sb
	lsls r0, r2
	str r0, [r5]
	movs r3, #0x1a
	ldrsh r0, [r1, r3]
	lsls r0, r2
	str r0, [r5, #4]
	ldr r0, [sp, #8]
_080C1DA6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C1DB8: .4byte 0x081F6340
_080C1DBC: .4byte 0x081F5D7C

