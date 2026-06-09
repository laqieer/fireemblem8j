	.syntax unified
	.set ClearTraps, 0x0802E100 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8019194, 0x08019194 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_804A4A0, "ax", %progbits
@ sub_804A4A0 @ JP 0x0804A4A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A4A0
	.thumb_func
sub_804A4A0:
	push {r4, r5, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _0804A4FC @ =0x0202BCAC
	ldr r2, _0804A500 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl sub_80D6370
	ldrb r1, [r4, #4]
	movs r0, #0x40
	movs r5, #0
	orrs r0, r1
	strb r0, [r4, #4]
	bl ClearTraps
	ldr r4, _0804A504 @ =0x0202BCEC
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r0, #0x3a
	strb r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	movs r0, #0x3a
	bl sub_8019194
	bl sub_8000CD8
	str r0, [r4, #4]
	adds r4, #0x48
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A4FC: .4byte 0x0202BCAC
_0804A500: .4byte 0x01000020
_0804A504: .4byte 0x0202BCEC

