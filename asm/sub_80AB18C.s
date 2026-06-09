	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80AB18C, "ax", %progbits
@ sub_80AB18C @ JP 0x080AB18C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB18C
	.thumb_func
sub_80AB18C:
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r1, #0
	strh r1, [r0]
	ldr r5, _080AB1D4 @ =0x0203EDB8
	ldr r2, _080AB1D8 @ =0x01000062
	adds r1, r5, #0
	bl sub_80D6370
	movs r0, #0xc4
	muls r0, r6, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080AB1DC @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl sub_80A79D8
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB1D4: .4byte 0x0203EDB8
_080AB1D8: .4byte 0x01000062
_080AB1DC: .4byte 0x00020112

