	.syntax unified
	.set PutNumber, 0x08004A90 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.section .text.sub_80A73D4, "ax", %progbits
@ sub_80A73D4 @ JP 0x080A73D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A73D4
	.thumb_func
sub_80A73D4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r4, r6, #6
	ldr r7, _080A74CC @ =0x02023CAC
	adds r0, r4, r7
	ldr r5, _080A74D0 @ =0x02014FD0
	ldrb r2, [r5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #6
	mov r8, r0
	adds r0, r4, r0
	ldrb r2, [r5, #2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0x14
	adds r1, r1, r7
	mov sl, r1
	adds r0, r4, r1
	ldrb r2, [r5, #0xb]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #0x1e
	adds r0, r0, r7
	mov sb, r0
	add r4, sb
	ldrb r2, [r5, #0xa]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, r6, #2
	lsls r4, r4, #6
	adds r0, r4, r7
	ldrb r2, [r5, #3]
	movs r1, #2
	bl PutNumberOrBlank
	add r8, r4
	ldrb r2, [r5, #4]
	mov r0, r8
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0xc
	adds r1, r1, r7
	mov r8, r1
	adds r0, r4, r1
	ldrb r2, [r5, #5]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x12
	adds r0, r4, r0
	ldrb r2, [r5, #6]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r4, r0
	ldrb r2, [r5, #7]
	movs r1, #2
	bl PutNumberOrBlank
	add sb, r4
	ldrb r2, [r5, #9]
	mov r0, sb
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x24
	adds r4, r4, r0
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	adds r6, #4
	lsls r6, r6, #6
	add r8, r6
	ldr r2, [r5, #0x10]
	mov r0, r8
	movs r1, #2
	bl PutNumber
	add sl, r6
	ldrh r2, [r5, #0xc]
	mov r0, sl
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x1a
	adds r0, r6, r0
	ldrb r2, [r5, #0xe]
	movs r1, #2
	bl PutNumber
	adds r0, r7, #0
	adds r0, #0x20
	adds r6, r6, r0
	ldrb r2, [r5, #0xf]
	adds r0, r6, #0
	movs r1, #2
	bl PutNumber
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A74CC: .4byte 0x02023CAC
_080A74D0: .4byte 0x02014FD0

