	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.section .text.sub_80434CC, "ax", %progbits
@ sub_80434CC @ JP 0x080434CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80434CC
	.thumb_func
sub_80434CC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, _0804350C @ =0x085D33A8
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r7, [r1]
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge _08043558
	ldr r0, _08043510 @ =0x0203DA20
	adds r5, r0, #0
	adds r5, #0xc
	ldr r0, _08043514 @ =0x0203DB78
	mov r8, r0
	movs r3, #0
_080434F4:
	ldr r0, _08043514 @ =0x0203DB78
	adds r2, r3, r0
	ldrb r1, [r2, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043518
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #4]
	b _08043520
	.align 2, 0
_0804350C: .4byte 0x085D33A8
_08043510: .4byte 0x0203DA20
_08043514: .4byte 0x0203DB78
_08043518:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #5]
_08043520:
	strb r0, [r2, #0x10]
	ldrh r1, [r5]
	ldr r2, _0804356C @ =0x00000FFF
	adds r0, r2, #0
	ands r1, r0
	mov r0, r8
	ldrb r2, [r0, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, _08043570 @ =0x020234BE
	adds r1, r1, r0
	adds r0, r5, #0
	str r3, [sp]
	bl PutText
	adds r5, #8
	movs r2, #0x14
	add r8, r2
	ldr r3, [sp]
	adds r3, #0x14
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt _080434F4
_08043558:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804356C: .4byte 0x00000FFF
_08043570: .4byte 0x020234BE

