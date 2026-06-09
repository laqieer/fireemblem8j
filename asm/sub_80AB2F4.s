	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80A9D54, 0x080A9D54 + 1
	.section .text.sub_80AB2F4, "ax", %progbits
@ sub_80AB2F4 @ JP 0x080AB2F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB2F4
	.thumb_func
sub_80AB2F4:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	movs r0, #0xc4
	muls r4, r0, r4
	adds r1, r5, r4
	adds r0, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r4, #0x10
	adds r5, r5, r4
	mov r4, r8
	movs r6, #4
_080AB320:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A9D54
	adds r5, #0x24
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _080AB320
	ldr r0, _080AB350 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_80A79D8
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB350: .4byte 0x00020112

