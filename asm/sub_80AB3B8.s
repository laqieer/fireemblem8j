	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.section .text.sub_80AB3B8, "ax", %progbits
@ sub_80AB3B8 @ JP 0x080AB3B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB3B8
	.thumb_func
sub_80AB3B8:
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r0, _080AB3EC @ =0x000007AC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080AB3F0 @ =0x00020112
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
_080AB3EC: .4byte 0x000007AC
_080AB3F0: .4byte 0x00020112

