	.syntax unified
	.set GetTacticianTextConf, 0x080444E4 + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_8044694, 0x08044694 + 1
	.set sub_80449D4, 0x080449D4 + 1
	.section .text.sub_8044B14, "ax", %progbits
@ sub_8044B14 @ JP 0x08044B14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8044B14
	.thumb_func
sub_8044B14:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov sb, r2
	adds r7, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bls _08044B40
	cmp r7, #0
	bne _08044B40
	movs r0, #2
	bl sub_8043190
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80449D4
	b _08044BE2
_08044B40:
	adds r6, r5, #0
	adds r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _08044BD8
	lsrs r2, r0, #1
	lsls r0, r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r0, r4, r0
	ldrh r1, [r0]
	ldr r3, _08044BC8 @ =0x00003FFF
	adds r0, r3, #0
	ands r0, r1
	movs r1, #1
	mov r8, r1
	cmp r0, #0
	beq _08044B68
	movs r0, #0
	mov r8, r0
_08044B68:
	mov r1, r8
	subs r0, r2, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	bl GetTacticianTextConf
	ldrb r1, [r6]
	lsrs r1, r1, #1
	mov r2, r8
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r2, [r1]
	lsrs r2, r2, #0xe
	lsls r1, r2, #1
	adds r1, r1, r2
	add r1, sb
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044BCC
	movs r0, #2
	bl sub_8043190
	ldr r0, [r4]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	mov r3, r8
	lsls r2, r3, #1
	subs r1, r1, r2
	bl SioStrCpy
	adds r0, r5, #0
	bl sub_8044694
	adds r0, r5, #0
	adds r0, #0x39
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	b _08044BE4
	.align 2, 0
_08044BC8: .4byte 0x00003FFF
_08044BCC:
	cmp r7, #0
	bne _08044BE2
	movs r0, #0
	bl sub_8043190
	b _08044BE2
_08044BD8:
	cmp r7, #0
	bne _08044BE2
	movs r0, #0
	bl sub_8043190
_08044BE2:
	movs r0, #0
_08044BE4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

