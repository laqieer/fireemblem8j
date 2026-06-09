	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_80A6AA8, 0x080A6AA8 + 1
	.section .text.sub_80A6AFC, "ax", %progbits
@ sub_80A6AFC @ JP 0x080A6AFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6AFC
	.thumb_func
sub_80A6AFC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sl, r1
	mov r8, r2
	mov sb, r3
	bl sub_80A6AA8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r8, r0
	movs r0, #1
	mov r1, sb
	lsls r0, r1
	subs r0, #1
	mov r1, r8
	ands r1, r0
	mov r8, r1
	movs r2, #0
	cmp r2, sb
	bge _080A6B7C
_080A6B2E:
	ldr r0, _080A6B8C @ =0x02014EEC
	mov r1, sl
	ldr r6, [r1]
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	str r2, [sp, #4]
	bl __divsi3
	ldr r1, [sp]
	adds r7, r1, r0
	movs r5, #1
	ldr r2, [sp, #4]
	lsls r5, r2
	mov r0, r8
	ands r5, r0
	asrs r5, r2
	adds r0, r6, #0
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	ldr r2, [sp, #4]
	cmp r1, #0
	bge _080A6B62
	adds r0, r1, #7
_080A6B62:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r5, r0
	ldrb r0, [r7]
	orrs r5, r0
	strb r5, [r7]
	adds r0, r6, #1
	mov r1, sl
	str r0, [r1]
	adds r2, #1
	cmp r2, sb
	blt _080A6B2E
_080A6B7C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6B8C: .4byte 0x02014EEC

