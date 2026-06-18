	.syntax unified
	.set GMapScreenVSync_AddCopyRequest, 0x080BF578 + 1
	.set GMapScreen_ApplyTilePalettes, 0x080BF368 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_80BF6B4, 0x080BF6B4 + 1
	.section .text.sub_80BF73C, "ax", %progbits
@ GMapScreen_UpdateScroll @ JP 0x080BF73C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GMapScreen_UpdateScroll
	.thumb_func
GMapScreen_UpdateScroll:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x2b
	adds r4, r6, #0
	adds r4, #0x2d
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _080BF828
	adds r0, r6, #0
	bl GMapScreen_ApplyTilePalettes
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BF778
	cmp r1, #1
	bgt _080BF77E
	b _080BF7A6
_080BF778:
	subs r0, r0, r2
	cmp r0, #1
	ble _080BF7A6
_080BF77E:
	ldr r0, [r6, #0x48]
	adds r4, r6, #0
	adds r4, #0x2d
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r5, r6, #0
	adds r5, #0x2e
	movs r2, #0
	ldrsb r2, [r5, r2]
	bl sub_80BF6B4
	ldrb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldrb r1, [r5]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _080BF940
_080BF7A6:
	adds r2, r6, #0
	adds r2, #0x2d
	adds r0, r6, #0
	adds r0, #0x2b
	movs r3, #0
	ldrsb r3, [r2, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	adds r4, r2, #0
	cmp r3, r1
	ble _080BF7D6
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r5, r0, #0
	adds r5, #0x1e
	adds r0, r5, #0
	movs r1, #0x3c
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	b _080BF7DC
_080BF7D6:
	movs r5, #0
	ldrsb r5, [r4, r5]
	mov r8, r5
_080BF7DC:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	adds r0, r7, #0
	adds r0, #0x15
	cmp r0, #0x27
	bgt _080BF7FC
	movs r2, #0x15
	b _080BF804
_080BF7FC:
	movs r0, #0x28
	subs r0, r0, r7
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
_080BF804:
	ldr r0, [r6, #0x48]
	adds r1, r6, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl GMapScreenVSync_AddCopyRequest
	ldrb r0, [r4]
	mov r1, sb
	strb r0, [r1]
_080BF828:
	adds r2, r6, #0
	adds r2, #0x2c
	adds r0, r6, #0
	adds r0, #0x2e
	movs r3, #0
	ldrsb r3, [r2, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r0
	str r2, [sp, #0xc]
	cmp r3, r1
	bne _080BF842
	b _080BF940
_080BF842:
	adds r0, r6, #0
	bl GMapScreen_ApplyTilePalettes
	mov r3, sl
	movs r2, #0
	ldrsb r2, [r3, r2]
	ldr r1, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BF860
	cmp r1, #1
	bgt _080BF866
	b _080BF88C
_080BF860:
	subs r0, r0, r2
	cmp r0, #1
	ble _080BF88C
_080BF866:
	ldr r0, [r6, #0x48]
	adds r4, r6, #0
	adds r4, #0x2d
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r3, sl
	movs r2, #0
	ldrsb r2, [r3, r2]
	bl sub_80BF6B4
	ldrb r1, [r4]
	adds r0, r6, #0
	adds r0, #0x2b
	strb r1, [r0]
	mov r1, sl
	ldrb r0, [r1]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	b _080BF940
_080BF88C:
	mov r3, sl
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r2, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _080BF8B2
	adds r0, r1, #0
	adds r7, r0, #0
	adds r7, #0x14
	mov sb, r7
	mov r0, sb
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	b _080BF8BA
_080BF8B2:
	mov r3, sl
	movs r7, #0
	ldrsb r7, [r3, r7]
	mov sb, r7
_080BF8BA:
	adds r0, r6, #0
	adds r0, #0x2d
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _080BF8CA
	adds r0, #0x1f
_080BF8CA:
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	adds r0, r1, #0
	movs r1, #0x3c
	bl __modsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	cmp r5, #0
	bgt _080BF900
	ldr r0, [r6, #0x48]
	mov r1, sb
	str r1, [sp]
	movs r1, #0x1f
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl GMapScreenVSync_AddCopyRequest
	b _080BF938
_080BF900:
	movs r4, #0x20
	subs r4, r4, r5
	ldr r0, [r6, #0x48]
	mov r2, sb
	str r2, [sp]
	str r4, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl GMapScreenVSync_AddCopyRequest
	movs r2, #0x1f
	subs r2, r2, r4
	ldr r0, [r6, #0x48]
	mov r3, r8
	adds r1, r3, r4
	adds r4, r5, r4
	mov r3, sb
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	bl GMapScreenVSync_AddCopyRequest
_080BF938:
	mov r3, sl
	ldrb r0, [r3]
	ldr r1, [sp, #0xc]
	strb r0, [r1]
_080BF940:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

