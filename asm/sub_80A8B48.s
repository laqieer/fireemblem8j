	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A8B48, "ax", %progbits
@ sub_80A8B48 @ JP 0x080A8B48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8B48
	.thumb_func
sub_80A8B48:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, _080A8BC8 @ =0x0203E890
	ldr r2, _080A8BCC @ =0x01000230
	adds r1, r5, #0
	bl sub_80D6370
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _080A8BD0 @ =0x0203ECF0
	ldr r2, _080A8BD4 @ =0x01000060
	bl sub_80D6370
	adds r7, r5, #0
	ldr r6, _080A8BD8 @ =0x0000084C
	add r6, r8
	adds r4, r7, #0
	movs r5, #0x45
_080A8B7A:
	ldr r0, [r4]
	ldr r1, _080A8BDC @ =0xFF0000FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r6, #0x10
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _080A8B7A
	ldr r4, _080A8BE0 @ =0x00000CAC
	add r4, r8
	movs r5, #0x2f
_080A8BA2:
	ldr r0, _080A8BD0 @ =0x0203ECF0
	adds r1, r4, #0
	movs r2, #4
	bl WriteAndVerifySramFast
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080A8BA2
	ldr r1, _080A8BE4 @ =0x0203E88C
	ldr r0, _080A8BD8 @ =0x0000084C
	add r0, r8
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8BC8: .4byte 0x0203E890
_080A8BCC: .4byte 0x01000230
_080A8BD0: .4byte 0x0203ECF0
_080A8BD4: .4byte 0x01000060
_080A8BD8: .4byte 0x0000084C
_080A8BDC: .4byte 0xFF0000FF
_080A8BE0: .4byte 0x00000CAC
_080A8BE4: .4byte 0x0203E88C

