	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C17B0, "ax", %progbits
@ sub_80C17B0 @ JP 0x080C17B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C17B0
	.thumb_func
sub_80C17B0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	ldr r2, _080C1844 @ =0x0500003A
	mov r0, sp
	bl sub_80D6370
	movs r2, #0
	adds r0, r4, #0
	adds r0, #0xa4
	adds r4, #0xc4
	movs r1, #0
	ldrsb r1, [r4, r1]
	cmp r2, r1
	bge _080C1834
	mov sb, r0
	ldr r3, _080C1848 @ =0x081F6340
	mov sl, r3
	mov ip, r1
_080C17E4:
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r5, #0
	adds r7, r2, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	adds r6, r0, #4
	adds r4, r0, #5
_080C17FA:
	adds r0, r6, r5
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	mov r1, r8
	adds r3, r1, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r3, r0
	ldrb r1, [r4]
	strb r1, [r0, #1]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	cmp r2, #0
	bne _080C1824
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r3, r0
	ldrb r1, [r4]
	strb r1, [r0, #1]
_080C1824:
	subs r4, #1
	adds r5, #1
	cmp r5, #1
	ble _080C17FA
	adds r2, r7, #0
	mov r0, sb
	cmp r2, ip
	blt _080C17E4
_080C1834:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1844: .4byte 0x0500003A
_080C1848: .4byte 0x081F6340

