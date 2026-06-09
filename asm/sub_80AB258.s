	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AB258, "ax", %progbits
@ sub_80AB258 @ JP 0x080AB258 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB258
	.thumb_func
sub_80AB258:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov sl, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r5, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r6, r0, #0
	ldr r0, _080AB2E4 @ =0x03006790
	mov sb, r0
	movs r4, #0xc4
	mov r7, r8
	muls r7, r4, r7
	adds r0, r5, r7
	mov r1, sb
	ldr r3, [r1]
	ldr r1, _080AB2E8 @ =0x0203EDB8
	movs r2, #0xc4
	bl sub_80D65C8
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	adds r5, r5, r4
	ldr r1, _080AB2EC @ =0x0203EE7C
	mov r8, r1
	mov r0, sb
	ldr r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc4
	bl sub_80D65C8
	adds r4, r6, r4
	ldr r0, _080AB2E8 @ =0x0203EDB8
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	adds r6, r6, r7
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080AB2F0 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_80A79D8
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB2E4: .4byte 0x03006790
_080AB2E8: .4byte 0x0203EDB8
_080AB2EC: .4byte 0x0203EE7C
_080AB2F0: .4byte 0x00020112

