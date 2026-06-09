	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AB1E0, "ax", %progbits
@ sub_80AB1E0 @ JP 0x080AB1E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB1E0
	.thumb_func
sub_80AB1E0:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	ldr r1, _080AB24C @ =0x03006790
	movs r0, #0xc4
	mov r8, r0
	mov r0, r8
	muls r0, r6, r0
	adds r4, r4, r0
	ldr r6, _080AB250 @ =0x0203EDB8
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xc4
	bl sub_80D65C8
	mov r1, r8
	mov r0, sb
	muls r0, r1, r0
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080AB254 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_80A79D8
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB24C: .4byte 0x03006790
_080AB250: .4byte 0x0203EDB8
_080AB254: .4byte 0x00020112

