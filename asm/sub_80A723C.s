	.syntax unified
	.set GetSavedRankData, 0x080A8428 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A723C, "ax", %progbits
@ sub_80A723C @ JP 0x080A723C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A723C
	.thumb_func
sub_80A723C:
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	add r0, sp, #0x18
	movs r1, #0
	strh r1, [r0]
	ldr r4, _080A72F4 @ =0x02014FD0
	ldr r2, _080A72F8 @ =0x0100000A
	adds r1, r4, #0
	bl sub_80D6370
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl GetSavedRankData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A7300
	strb r5, [r4]
	strb r6, [r4, #2]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	strb r0, [r4, #5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsrs r0, r0, #7
	strb r0, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r4, #8]
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	strb r0, [r4, #1]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	strh r0, [r4, #0xc]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xe]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0xf]
	mov r0, sp
	ldrb r2, [r0, #7]
	lsrs r2, r2, #5
	ldr r0, [sp, #8]
	ldr r1, _080A72FC @ =0x001FFFFF
	ands r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	str r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x17]
	strb r0, [r4, #0xa]
	mov r0, sp
	ldrb r2, [r0, #3]
	lsrs r2, r2, #7
	ldrb r0, [r0, #4]
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #1
	orrs r0, r2
	strb r0, [r4, #0xb]
	movs r0, #1
	b _080A7302
	.align 2, 0
_080A72F4: .4byte 0x02014FD0
_080A72F8: .4byte 0x0100000A
_080A72FC: .4byte 0x001FFFFF
_080A7300:
	movs r0, #0
_080A7302:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

