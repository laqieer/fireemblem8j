	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80A6A7C, 0x080A6A7C + 1
	.set sub_80A6AA8, 0x080A6AA8 + 1
	.set sub_80A6C20, 0x080A6C20 + 1
	.set sub_80A6C60, 0x080A6C60 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A6E4C, "ax", %progbits
@ sub_80A6E4C @ JP 0x080A6E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6E4C
	.thumb_func
sub_80A6E4C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r6, _080A6F04 @ =0x02014F28
	ldr r5, _080A6F08 @ =0x02014EF4
	adds r2, r6, #0
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0x9f
_080A6E62:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _080A6E62
	ldr r1, [r5]
	adds r1, r1, r6
	mov r0, sp
	bl sub_80D65C8
	ldr r0, [sp]
	bl sub_80A6A7C
	ldr r4, _080A6F0C @ =0x02014FC8
	strh r0, [r4, #6]
	ldr r0, [r5]
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	bl sub_80A6C20
	strh r0, [r4, #2]
	bl sub_8000CD8
	lsrs r0, r0, #3
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldr r5, _080A6F10 @ =0x000003FF
	ands r0, r5
	strh r0, [r4]
	ldr r1, _080A6F14 @ =0x02014F24
	ldrh r0, [r4]
	str r0, [r1]
	bl sub_80A6AA8
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ands r0, r5
	strh r0, [r4, #2]
	movs r5, #0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _080A6ED8
	adds r4, r6, #0
_080A6EB6:
	bl sub_80A6AA8
	ldr r1, _080A6F08 @ =0x02014EF4
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	adds r0, r0, r1
	ldr r1, _080A6F18 @ =0x02014EF0
	ldr r1, [r1]
	ands r1, r0
	strb r1, [r2]
	adds r5, #1
	ldr r0, _080A6F0C @ =0x02014FC8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _080A6EB6
_080A6ED8:
	ldr r0, _080A6F08 @ =0x02014EF4
	ldr r0, [r0]
	ldr r1, _080A6F04 @ =0x02014F28
	adds r0, r0, r1
	ldr r5, _080A6F0C @ =0x02014FC8
	ldrh r1, [r5, #6]
	bl sub_80A6C20
	adds r4, r0, #0
	bl sub_80A6AA8
	adds r4, r4, r0
	ldr r1, _080A6F10 @ =0x000003FF
	adds r0, r1, #0
	ands r4, r0
	strh r4, [r5, #4]
	bl sub_80A6C60
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6F04: .4byte 0x02014F28
_080A6F08: .4byte 0x02014EF4
_080A6F0C: .4byte 0x02014FC8
_080A6F10: .4byte 0x000003FF
_080A6F14: .4byte 0x02014F24
_080A6F18: .4byte 0x02014EF0

