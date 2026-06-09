	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A984C, "ax", %progbits
@ sub_80A984C @ JP 0x080A984C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A984C
	.thumb_func
sub_80A984C:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov sb, r1
	bl GetSaveReadAddr
	adds r6, r0, #0
	mov r0, sb
	bl GetSaveWriteAddr
	mov r8, r0
	ldr r0, _080A98A4 @ =0x03006790
	ldr r4, _080A98A8 @ =0x02020188
	ldr r5, _080A98AC @ =0x00000DC8
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D65C8
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A98B0 @ =0x00040624
	str r0, [sp]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, sb
	bl sub_80A79D8
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A98A4: .4byte 0x03006790
_080A98A8: .4byte 0x02020188
_080A98AC: .4byte 0x00000DC8
_080A98B0: .4byte 0x00040624

