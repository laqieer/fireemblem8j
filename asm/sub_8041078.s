	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_802CC14, 0x0802CC14 + 1
	.section .text.sub_8041078, "ax", %progbits
@ sub_8041078 @ JP 0x08041078 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041078
	.thumb_func
sub_8041078:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	str r0, [r7]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	ldr r0, _08041164 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08041152
_080410A8:
	ldr r0, _08041164 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r1, #1
	mov sl, r0
	cmp r5, #0
	blt _0804114C
	lsls r6, r1, #2
_080410BA:
	ldr r0, _08041168 @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08041146
	ldr r4, _0804116C @ =0x0202E4D4
	ldr r0, [r4]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08041146
	ldr r0, _08041170 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08041146
	ldr r0, [r4]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08041146
	adds r0, r1, #0
	cmp r0, #0xb
	beq _08041146
	cmp r0, #0xd
	beq _08041146
	mov r1, r8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08041174 @ =0x03004DF0
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_802CC14
	ldr r2, [sp]
	cmp r0, r2
	blt _08041146
	mov r0, sb
	cmp r0, #0
	bge _08041140
	ldrb r4, [r4, #0xb]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov sb, r4
_08041140:
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
_08041146:
	subs r5, #1
	cmp r5, #0
	bge _080410BA
_0804114C:
	mov r1, sl
	cmp r1, #0
	bge _080410A8
_08041152:
	mov r0, sb
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041164: .4byte 0x0202E4D0
_08041168: .4byte 0x0202E4E0
_0804116C: .4byte 0x0202E4D4
_08041170: .4byte 0x0202BE40
_08041174: .4byte 0x03004DF0

