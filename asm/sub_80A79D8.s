	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80AAE6C, 0x080AAE6C + 1
	.section .text.sub_80A79D8, "ax", %progbits
@ sub_80A79D8 @ JP 0x080A79D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A79D8
	.thumb_func
sub_80A79D8:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r5, #0
	ldr r0, _080A7A08 @ =0x0000200A
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl GetSaveWriteAddr
	strh r0, [r4, #8]
	cmp r6, #6
	bgt _080A7A5E
	ldrb r0, [r4, #6]
	cmp r0, #2
	beq _080A7A2C
	cmp r0, #2
	bgt _080A7A0C
	cmp r0, #0
	beq _080A7A16
	cmp r0, #1
	beq _080A7A20
	b _080A7A5E
	.align 2, 0
_080A7A08: .4byte 0x0000200A
_080A7A0C:
	cmp r0, #3
	beq _080A7A38
	cmp r0, #0xff
	beq _080A7A40
	b _080A7A5E
_080A7A16:
	ldr r0, _080A7A1C @ =0x00000DC8
	strh r0, [r4, #0xa]
	b _080A7A46
	.align 2, 0
_080A7A1C: .4byte 0x00000DC8
_080A7A20:
	ldr r0, _080A7A28 @ =0x00001F78
	strh r0, [r4, #0xa]
	b _080A7A46
	.align 2, 0
_080A7A28: .4byte 0x00001F78
_080A7A2C:
	ldr r0, _080A7A34 @ =0x00000874
	strh r0, [r4, #0xa]
	b _080A7A46
	.align 2, 0
_080A7A34: .4byte 0x00000874
_080A7A38:
	movs r0, #0xc0
	lsls r0, r0, #4
	strh r0, [r4, #0xa]
	b _080A7A46
_080A7A40:
	strh r5, [r4, #0xa]
	strh r5, [r4, #8]
	strh r5, [r4, #4]
_080A7A46:
	adds r0, r4, #0
	bl sub_80AAE6C
	ldr r0, _080A7A64 @ =0x08A9CA20
	lsls r2, r6, #4
	adds r2, #0x64
	ldr r1, [r0]
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
_080A7A5E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A64: .4byte 0x08A9CA20

