	.syntax unified
	.set GmBuildSkirmishNodeList, 0x080C1894 + 1
	.set sub_80C18F8, 0x080C18F8 + 1
	.set sub_80C19D4, 0x080C19D4 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C1B20, "ax", %progbits
@ sub_80C1B20 @ JP 0x080C1B20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1B20
	.thumb_func
sub_80C1B20:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	str r7, [sp, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sb, r1
	mov sl, sb
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	ldr r0, _080C1BA0 @ =0x0201B100
	bl GmBuildSkirmishNodeList
	mov r0, r8
	cmp r0, #0
	beq _080C1B52
	ldr r1, _080C1BA4 @ =0x0201B0D8
	movs r0, #0x10
	str r0, [r1, #0x24]
_080C1B52:
	ldr r6, _080C1BA4 @ =0x0201B0D8
	movs r0, #0x10
	str r0, [r6, #0x20]
	movs r4, #0
	str r4, [sp, #0xc]
	ldr r5, _080C1BA8 @ =0x05000004
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80D6370
	str r4, [sp, #0x10]
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r1, #0x10
	adds r2, r5, #0
	bl sub_80D6370
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r6]
	strb r0, [r6, #0x10]
	mov r0, r8
	cmp r0, #0
	beq _080C1BB0
	ldr r1, _080C1BAC @ =0x0201AFF0
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sb
	str r0, [sp]
	movs r4, #1
	str r4, [sp, #4]
	str r2, [sp, #8]
	adds r0, r6, #0
	adds r3, r7, #0
	bl sub_80C19D4
	b _080C1BC6
	.align 2, 0
_080C1BA0: .4byte 0x0201B100
_080C1BA4: .4byte 0x0201B0D8
_080C1BA8: .4byte 0x05000004
_080C1BAC: .4byte 0x0201AFF0
_080C1BB0:
	ldr r1, _080C1BD4 @ =0x0201AFF0
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sl
	str r0, [sp]
	movs r4, #1
	str r4, [sp, #4]
	adds r0, r6, #0
	ldr r3, [sp, #0x14]
	bl sub_80C18F8
_080C1BC6:
	cmp r0, #0
	beq _080C1BD8
	ldrb r0, [r6, #0x11]
	strb r0, [r6, #1]
	str r4, [r6, #0x20]
	movs r0, #1
	b _080C1BE6
	.align 2, 0
_080C1BD4: .4byte 0x0201AFF0
_080C1BD8:
	movs r1, #0
	ldr r0, _080C1BF8 @ =0x0201B0D8
	ldr r0, [r0, #0x20]
	cmp r0, #0xf
	bgt _080C1BE4
	movs r1, #1
_080C1BE4:
	adds r0, r1, #0
_080C1BE6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C1BF8: .4byte 0x0201B0D8

