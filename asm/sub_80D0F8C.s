	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80D0F8C, "ax", %progbits
@ OpAnimHS_FadeToBlackLoop @ JP 0x080D0F8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global OpAnimHS_FadeToBlackLoop
	.thumb_func
OpAnimHS_FadeToBlackLoop:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x34]
	subs r0, #1
	str r0, [r7, #0x34]
	cmp r0, #0
	ble _080D1010
	movs r6, #0
	ldr r0, _080D1004 @ =0x020228A8
	mov sb, r0
	movs r3, #0x1f
	mov r8, r3
	ldr r4, _080D1008 @ =0x02000000
	mov ip, r4
_080D0FB0:
	lsls r2, r6, #1
	mov r0, ip
	ldrh r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	ldr r1, [r7, #0x34]
	muls r0, r1, r0
	cmp r0, #0
	bge _080D0FC4
	adds r0, #3
_080D0FC4:
	asrs r5, r0, #2
	lsls r3, r3, #0x10
	lsrs r0, r3, #0x15
	mov r4, r8
	ands r0, r4
	muls r0, r1, r0
	cmp r0, #0
	bge _080D0FD6
	adds r0, #3
_080D0FD6:
	asrs r4, r0, #2
	lsrs r0, r3, #0x1a
	mov r3, r8
	ands r0, r3
	muls r0, r1, r0
	cmp r0, #0
	bge _080D0FE6
	adds r0, #3
_080D0FE6:
	asrs r1, r0, #2
	add r2, sb
	lsls r0, r4, #5
	orrs r0, r5
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r2]
	movs r4, #2
	add ip, r4
	adds r6, #1
	ldr r0, _080D100C @ =0x000001FF
	cmp r6, r0
	ble _080D0FB0
	b _080D1024
	.align 2, 0
_080D1004: .4byte 0x020228A8
_080D1008: .4byte 0x02000000
_080D100C: .4byte 0x000001FF
_080D1010:
	movs r0, #0
	str r0, [sp]
	ldr r1, _080D1038 @ =0x020228A8
	ldr r2, _080D103C @ =0x01000100
	mov r0, sp
	bl sub_80D636C
	adds r0, r7, #0
	bl sub_8002DE4
_080D1024:
	bl sub_8001EE4
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D1038: .4byte 0x020228A8
_080D103C: .4byte 0x01000100

