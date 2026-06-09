	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.section .text.sub_80AB41C, "ax", %progbits
@ sub_80AB41C @ JP 0x080AB41C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB41C
	.thumb_func
sub_80AB41C:
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r0, #0xf5
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r0, _080AB454 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_80A79D8
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB454: .4byte 0x00020112

