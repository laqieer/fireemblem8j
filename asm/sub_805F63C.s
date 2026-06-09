	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.set memset, 0x080D6968 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8073BA4, 0x08073BA4 + 1
	.section .text.sub_805F63C, "ax", %progbits
@ sub_805F63C @ JP 0x0805F63C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F63C
	.thumb_func
sub_805F63C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r1, _0805F6CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F6D0 @ =0x085FF9F0
	movs r1, #3
	bl sub_8002BCC
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	strh r5, [r7, #0x2c]
	movs r0, #0x64
	strh r0, [r7, #0x2e]
	movs r0, #7
	mov r1, r8
	ands r0, r1
	mov r2, sp
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x29
	strb r0, [r1]
	ldr r0, _0805F6D4 @ =0x086478FC
	movs r1, #0x78
	bl AnimCreate
	str r0, [r7, #0x60]
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r5, _0805F6D8 @ =0x0000FFFF
	adds r0, r5, #0
	bl sub_8073BA4
	strh r0, [r7, #0x32]
	adds r0, r5, #0
	bl sub_8073BA4
	strh r0, [r7, #0x3a]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805F6E0
	adds r0, r5, #0
	bl sub_8073BA4
	ldr r2, _0805F6DC @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _0805F6F2
	.align 2, 0
_0805F6CC: .4byte 0x0201774C
_0805F6D0: .4byte 0x085FF9F0
_0805F6D4: .4byte 0x086478FC
_0805F6D8: .4byte 0x0000FFFF
_0805F6DC: .4byte 0x000001FF
_0805F6E0:
	adds r0, r5, #0
	bl sub_8073BA4
	ldr r2, _0805F73C @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_0805F6F2:
	adds r0, r0, r1
	strh r0, [r7, #0x34]
	ldr r4, _0805F740 @ =0x0000FF0F
	adds r0, r4, #0
	bl sub_8073BA4
	ldr r2, _0805F744 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _0805F748 @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl sub_8073BA4
	strh r0, [r7, #0x36]
	adds r0, r4, #0
	bl sub_8073BA4
	strh r0, [r7, #0x3e]
	movs r0, #7
	mov r2, r8
	ands r0, r2
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805F74C
	adds r0, r4, #0
	bl sub_8073BA4
	ldr r2, _0805F73C @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _0805F75E
	.align 2, 0
_0805F73C: .4byte 0x000001FF
_0805F740: .4byte 0x0000FF0F
_0805F744: .4byte 0x000003FF
_0805F748: .4byte 0xFFFFFF00
_0805F74C:
	adds r0, r4, #0
	bl sub_8073BA4
	ldr r2, _0805F784 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_0805F75E:
	adds r0, r0, r1
	strh r0, [r7, #0x38]
	ldr r0, _0805F788 @ =0x0000FF0F
	bl sub_8073BA4
	ldr r2, _0805F78C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _0805F790 @ =0xFFFFFF00
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F784: .4byte 0x000001FF
_0805F788: .4byte 0x0000FF0F
_0805F78C: .4byte 0x000003FF
_0805F790: .4byte 0xFFFFFF00

