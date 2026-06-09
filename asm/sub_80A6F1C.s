	.syntax unified
	.set sub_80A6AA8, 0x080A6AA8 + 1
	.set sub_80A6C20, 0x080A6C20 + 1
	.set sub_80A6D34, 0x080A6D34 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_80A6F1C, "ax", %progbits
@ sub_80A6F1C @ JP 0x080A6F1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6F1C
	.thumb_func
sub_80A6F1C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	movs r0, #0
	str r0, [sp, #4]
	bl sub_80A6D34
	ldr r1, _080A6FC8 @ =0x02014F24
	ldr r4, _080A6FCC @ =0x02014FC8
	ldrh r0, [r4]
	str r0, [r1]
	ldr r0, _080A6FD0 @ =0x02014EF4
	ldr r0, [r0]
	ldr r7, _080A6FD4 @ =0x02014F28
	adds r0, r0, r7
	ldrh r1, [r4, #6]
	bl sub_80A6C20
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_80A6AA8
	mov r1, sp
	strh r0, [r1]
	movs r5, #0
	add r0, sp, #4
	mov r8, r0
	ldrh r4, [r4, #6]
	cmp r5, r4
	bge _080A6F82
	adds r4, r7, #0
_080A6F60:
	bl sub_80A6AA8
	ldr r1, _080A6FD0 @ =0x02014EF4
	ldr r2, [r1]
	adds r2, r5, r2
	adds r2, r2, r4
	ldrb r1, [r2]
	subs r1, r1, r0
	ldr r0, _080A6FD8 @ =0x02014EF0
	ldr r0, [r0]
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	ldr r0, _080A6FCC @ =0x02014FC8
	ldrh r0, [r0, #6]
	cmp r5, r0
	blt _080A6F60
_080A6F82:
	bl sub_80A6AA8
	mov r1, sp
	strh r0, [r1, #2]
	ldr r5, _080A6FD0 @ =0x02014EF4
	ldr r1, [r5]
	ldr r4, _080A6FD4 @ =0x02014F28
	adds r1, r1, r4
	mov r0, r8
	bl sub_80D65E0
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r4, _080A6FCC @ =0x02014FC8
	ldrh r1, [r4, #6]
	bl sub_80A6C20
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _080A6FDC @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	mov r1, sp
	ldrh r1, [r1, #2]
	adds r6, r6, r1
	ands r6, r2
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _080A6FC4
	ldrh r0, [r4, #4]
	cmp r0, r6
	beq _080A6FE0
_080A6FC4:
	movs r0, #0
	b _080A6FE2
	.align 2, 0
_080A6FC8: .4byte 0x02014F24
_080A6FCC: .4byte 0x02014FC8
_080A6FD0: .4byte 0x02014EF4
_080A6FD4: .4byte 0x02014F28
_080A6FD8: .4byte 0x02014EF0
_080A6FDC: .4byte 0x000003FF
_080A6FE0:
	movs r0, #1
_080A6FE2:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

