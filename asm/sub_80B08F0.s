	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80B08F0, "ax", %progbits
@ sub_80B08F0 @ JP 0x080B08F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B08F0
	.thumb_func
sub_80B08F0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0x10
	ble _080B0912
	movs r0, #0xf
	ands r0, r5
	movs r1, #0x10
	subs r5, r1, r0
_080B0912:
	movs r2, #0
_080B0914:
	ldr r1, _080B0944 @ =0x02000940
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	adds r1, r2, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _080B09D6
	lsls r0, r2, #6
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080B0948 @ =0x02022ABA
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [sp]
	cmp r2, r0
	bne _080B0954
	ldr r1, _080B094C @ =0x08A79BA2
	mov ip, r1
	ldr r6, _080B0950 @ =0x08A79CA2
	b _080B095A
	.align 2, 0
_080B0944: .4byte 0x02000940
_080B0948: .4byte 0x02022ABA
_080B094C: .4byte 0x08A79BA2
_080B0950: .4byte 0x08A79CA2
_080B0954:
	ldr r0, _080B09F0 @ =0x08A79BC2
	mov ip, r0
	ldr r6, _080B09F4 @ =0x08A79CC2
_080B095A:
	adds r2, #1
	str r2, [sp, #4]
	movs r0, #0x10
	subs r7, r0, r5
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	movs r0, #6
	mov sb, r0
_080B096C:
	mov r1, ip
	ldrh r4, [r1]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r6]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r6, #2
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r0, sb
	cmp r0, #0
	bge _080B096C
_080B09D6:
	ldr r2, [sp, #4]
	cmp r2, #2
	ble _080B0914
	bl sub_8001EE4
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B09F0: .4byte 0x08A79BC2
_080B09F4: .4byte 0x08A79CC2

