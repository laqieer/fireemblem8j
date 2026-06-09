	.syntax unified
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C009C, 0x080C009C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C0178, "ax", %progbits
@ sub_80C0178 @ JP 0x080C0178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0178
	.thumb_func
sub_80C0178:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	ldr r6, _080C01C8 @ =0x02022BE8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _080C01CC
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	movs r2, #0
	bl _DivArm1
	mov r8, r0
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0x29
	adds r5, #0x2a
_080C01A8:
	movs r0, #0
	ldrsb r0, [r7, r0]
	movs r2, #0
	ldrsb r2, [r5, r2]
	mov r1, r8
	str r1, [sp]
	adds r1, r4, #0
	adds r3, r4, #0
	bl sub_80C009C
	strh r0, [r6]
	adds r6, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080C01A8
	b _080C0204
	.align 2, 0
_080C01C8: .4byte 0x02022BE8
_080C01CC:
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080C01F0
	lsls r0, r0, #5
	ldr r2, _080C01EC @ =0xFFFFFEC0
	adds r1, r6, r2
	adds r0, r0, r1
	adds r1, r6, #0
	movs r2, #0x10
	bl sub_80D6370
	b _080C01FE
	.align 2, 0
_080C01EC: .4byte 0xFFFFFEC0
_080C01F0:
	add r0, sp, #4
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080C0214 @ =0x01000010
	adds r1, r6, #0
	bl sub_80D6370
_080C01FE:
	adds r0, r5, #0
	bl sub_8002DE4
_080C0204:
	bl sub_8001EE4
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0214: .4byte 0x01000010

