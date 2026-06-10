	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80315D4, 0x080315D4 + 1
	.section .text.sub_80332E4, "ax", %progbits
@ sub_80332E4 @ JP 0x080332E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80332E4
	.thumb_func
sub_80332E4:
	push {r4, r5, lr}
	bl sub_80315D4
	adds r5, r0, #0
	cmp r5, #0
	beq _08033320
	ldr r0, [r5, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r4, _08033328 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x84
	ldrb r0, [r0]
	strb r0, [r5, #0x11]
	bl RefreshEntityBmMaps
	bl sub_8027144
_08033320:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033328: .4byte 0x0202BCEC

