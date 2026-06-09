	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_804F0EC, "ax", %progbits
@ sub_804F0EC @ JP 0x0804F0EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804F0EC
	.thumb_func
sub_804F0EC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp]
	adds r5, r1, #0
	ldr r4, [sp, #0x68]
	ldr r1, _0804F33C @ =0x085E0610
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov ip, r0
	ldr r0, [sp]
	adds r2, r0, r2
	subs r2, #1
	str r2, [sp, #4]
	adds r3, r5, r3
	subs r3, #1
	str r3, [sp, #8]
	cmp r4, #3
	bne _0804F11C
	b _0804F348
_0804F11C:
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	ldr r1, [sp]
	adds r1, #1
	str r1, [sp, #0x18]
	lsls r5, r5, #5
	str r5, [sp, #0x24]
	lsls r2, r3, #5
	str r2, [sp, #0x2c]
	cmp r0, r3
	bge _0804F212
	movs r3, #0
	mov sl, r3
	ldr r4, _0804F340 @ =0x020234A8
	mov r8, r4
_0804F13A:
	ldr r7, [sp, #0x18]
	lsls r5, r0, #5
	adds r1, r0, #1
	mov sb, r1
	adds r0, #2
	str r0, [sp, #0x20]
	ldr r2, [sp, #4]
	cmp r7, r2
	bge _0804F1B6
	ldr r3, _0804F344 @ =0x02022CA8
	movs r2, #0
	ldr r6, _0804F340 @ =0x020234A8
_0804F152:
	adds r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, r1, r6
	str r1, [sp, #0x40]
	mov r1, ip
	ldrh r0, [r1, #0xc]
	ldr r1, [sp, #0x40]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, r1, r6
	str r1, [sp, #0x40]
	mov r1, ip
	ldrh r0, [r1, #0xc]
	ldr r1, [sp, #0x40]
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, r1, r6
	str r1, [sp, #0x40]
	mov r1, ip
	ldrh r0, [r1, #0x12]
	ldr r1, [sp, #0x40]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r1, r0, r3
	strh r2, [r1]
	adds r0, r0, r6
	mov r4, ip
	ldrh r1, [r4, #0x14]
	strh r1, [r0]
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804F152
_0804F1B6:
	ldr r2, [sp]
	adds r1, r5, r2
	lsls r1, r1, #1
	ldr r3, _0804F344 @ =0x02022CA8
	adds r0, r1, r3
	mov r4, sl
	strh r4, [r0]
	add r1, r8
	mov r2, ip
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	ldr r3, [sp, #4]
	adds r1, r5, r3
	lsls r1, r1, #1
	ldr r4, _0804F344 @ =0x02022CA8
	adds r0, r1, r4
	mov r5, sl
	strh r5, [r0]
	add r1, r8
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	mov r0, sb
	lsls r2, r0, #5
	ldr r3, [sp]
	adds r1, r2, r3
	lsls r1, r1, #1
	adds r0, r1, r4
	strh r5, [r0]
	add r1, r8
	mov r4, ip
	ldrh r0, [r4, #0x10]
	strh r0, [r1]
	ldr r5, [sp, #4]
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r1, _0804F344 @ =0x02022CA8
	adds r0, r2, r1
	mov r3, sl
	strh r3, [r0]
	add r2, r8
	ldrh r0, [r4, #0x16]
	strh r0, [r2]
	ldr r0, [sp, #0x20]
	ldr r4, [sp, #8]
	cmp r0, r4
	blt _0804F13A
_0804F212:
	ldr r7, [sp, #0x18]
	ldr r5, [sp, #4]
	cmp r7, r5
	bge _0804F2B2
	ldr r6, _0804F344 @ =0x02022CA8
	ldr r4, _0804F340 @ =0x020234A8
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x2c]
	adds r3, #1
	lsls r2, r7, #1
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #1
	adds r1, r0, r4
	adds r1, r2, r1
	str r1, [sp, #0x30]
	adds r0, r0, r6
	adds r0, r2, r0
	str r0, [sp, #0x34]
	ldr r5, [sp, #0x24]
	lsls r0, r5, #1
	adds r1, r0, r4
	adds r1, r1, r2
	mov sl, r1
	adds r0, r0, r6
	adds r0, r0, r2
	mov sb, r0
	lsls r3, r3, #1
	adds r0, r3, r4
	adds r0, r0, r2
	mov r8, r0
	adds r3, r3, r6
	adds r3, r2, r3
	ldr r0, [sp, #0xc]
	lsls r0, r0, #1
	str r0, [sp, #0x38]
	adds r4, r0, r4
	adds r1, r2, r4
	adds r6, r0, r6
	adds r2, r2, r6
_0804F264:
	movs r5, #0
	mov r4, sb
	strh r5, [r4]
	mov r4, ip
	ldrh r0, [r4, #4]
	mov r5, sl
	strh r0, [r5]
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r4, #4]
	strh r0, [r1]
	movs r5, #0
	ldr r4, [sp, #0x34]
	strh r5, [r4]
	mov r4, ip
	ldrh r0, [r4, #0x1a]
	ldr r5, [sp, #0x30]
	strh r0, [r5]
	movs r0, #0
	strh r0, [r3]
	ldrh r0, [r4, #0x1c]
	mov r4, r8
	strh r0, [r4]
	adds r5, #4
	str r5, [sp, #0x30]
	ldr r5, [sp, #0x34]
	adds r5, #4
	str r5, [sp, #0x34]
	movs r0, #4
	add sl, r0
	add sb, r0
	add r8, r0
	adds r3, #4
	adds r1, #4
	adds r2, #4
	adds r7, #2
	ldr r4, [sp, #4]
	cmp r7, r4
	blt _0804F264
_0804F2B2:
	ldr r5, [sp, #0x24]
	ldr r0, [sp]
	adds r2, r5, r0
	lsls r2, r2, #1
	ldr r1, _0804F344 @ =0x02022CA8
	adds r0, r2, r1
	movs r1, #0
	strh r1, [r0]
	ldr r3, [sp, #4]
	adds r3, r5, r3
	str r3, [sp, #0x10]
	lsls r6, r3, #1
	ldr r4, _0804F344 @ =0x02022CA8
	adds r0, r6, r4
	strh r1, [r0]
	ldr r5, [sp, #0x2c]
	ldr r0, [sp]
	adds r4, r5, r0
	lsls r4, r4, #1
	ldr r3, _0804F344 @ =0x02022CA8
	adds r0, r4, r3
	strh r1, [r0]
	ldr r0, [sp, #4]
	adds r3, r5, r0
	lsls r3, r3, #1
	ldr r5, _0804F344 @ =0x02022CA8
	adds r0, r3, r5
	strh r1, [r0]
	ldr r0, _0804F340 @ =0x020234A8
	adds r2, r2, r0
	mov r1, ip
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r0, [sp, #0x24]
	adds r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r5, _0804F340 @ =0x020234A8
	adds r0, r0, r5
	ldrh r1, [r1, #2]
	strh r1, [r0]
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #5
	adds r1, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	mov r5, ip
	ldrh r2, [r5, #8]
	strh r2, [r1]
	adds r0, #1
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _0804F340 @ =0x020234A8
	adds r0, r0, r2
	ldrh r1, [r5, #0xa]
	strh r1, [r0]
	adds r6, r6, r2
	ldrh r0, [r5, #6]
	strh r0, [r6]
	adds r4, r4, r2
	ldrh r0, [r5, #0x18]
	strh r0, [r4]
	adds r3, r3, r2
	ldrh r0, [r5, #0x1e]
	strh r0, [r3]
	b _0804F4F4
	.align 2, 0
_0804F33C: .4byte 0x085E0610
_0804F340: .4byte 0x020234A8
_0804F344: .4byte 0x02022CA8
_0804F348:
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	ldr r3, [sp]
	adds r3, #1
	str r3, [sp, #0x18]
	ldr r4, [sp, #8]
	lsls r4, r4, #5
	str r4, [sp, #0x2c]
	b _0804F470
_0804F35A:
	movs r1, #0
	ldr r2, [sp, #0x1c]
	cmp r0, r2
	bne _0804F364
	movs r1, #1
_0804F364:
	adds r6, r1, #0
	ldr r7, [sp, #0x18]
	lsls r5, r0, #5
	adds r3, r0, #1
	mov sb, r3
	adds r0, #2
	str r0, [sp, #0x20]
	movs r4, #0x10
	add r4, ip
	mov sl, r4
	mov r0, ip
	adds r0, #0x16
	str r0, [sp, #0x28]
	ldr r1, [sp, #4]
	cmp r7, r1
	bge _0804F400
	ldr r2, _0804F520 @ =0x02022CA8
	mov r8, r2
	movs r3, #0
	ldr r2, _0804F524 @ =0x020234A8
_0804F38C:
	adds r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	mov r0, r8
	adds r0, r1, r0
	strh r3, [r0]
	adds r1, r1, r2
	mov r0, ip
	adds r0, #0x12
	cmp r6, #0
	beq _0804F3A6
	subs r0, #8
_0804F3A6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	mov r0, r8
	adds r0, r1, r0
	strh r3, [r0]
	adds r1, r1, r2
	mov r0, ip
	adds r0, #0x14
	cmp r6, #0
	beq _0804F3C4
	subs r0, #8
_0804F3C4:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	mov r0, r8
	adds r0, r1, r0
	strh r3, [r0]
	adds r1, r1, r2
	str r1, [sp, #0x40]
	mov r1, ip
	ldrh r0, [r1, #0x12]
	ldr r1, [sp, #0x40]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	mov r4, r8
	adds r1, r0, r4
	strh r3, [r1]
	adds r0, r0, r2
	mov r4, ip
	ldrh r1, [r4, #0x14]
	strh r1, [r0]
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804F38C
_0804F400:
	ldr r1, [sp]
	adds r0, r5, r1
	lsls r0, r0, #1
	ldr r2, _0804F520 @ =0x02022CA8
	adds r1, r0, r2
	movs r4, #0
	strh r4, [r1]
	ldr r3, _0804F524 @ =0x020234A8
	adds r1, r0, r3
	mov r0, sl
	cmp r6, #0
	beq _0804F41C
	mov r0, ip
	adds r0, #8
_0804F41C:
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [sp, #4]
	adds r1, r5, r0
	lsls r1, r1, #1
	ldr r2, _0804F520 @ =0x02022CA8
	adds r0, r1, r2
	strh r4, [r0]
	ldr r3, _0804F524 @ =0x020234A8
	adds r1, r1, r3
	ldr r0, [sp, #0x28]
	cmp r6, #0
	beq _0804F43A
	mov r0, ip
	adds r0, #0xe
_0804F43A:
	ldrh r0, [r0]
	strh r0, [r1]
	mov r5, sb
	lsls r2, r5, #5
	ldr r0, [sp]
	adds r1, r2, r0
	lsls r1, r1, #1
	ldr r3, _0804F520 @ =0x02022CA8
	adds r0, r1, r3
	strh r4, [r0]
	ldr r5, _0804F524 @ =0x020234A8
	adds r1, r1, r5
	mov r3, ip
	ldrh r0, [r3, #0x10]
	strh r0, [r1]
	ldr r5, [sp, #4]
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r1, _0804F520 @ =0x02022CA8
	adds r0, r2, r1
	strh r4, [r0]
	ldr r3, _0804F524 @ =0x020234A8
	adds r2, r2, r3
	mov r4, ip
	ldrh r0, [r4, #0x16]
	strh r0, [r2]
	ldr r0, [sp, #0x20]
_0804F470:
	ldr r5, [sp, #8]
	cmp r0, r5
	bge _0804F478
	b _0804F35A
_0804F478:
	ldr r7, [sp, #0x18]
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _0804F4C8
	ldr r1, _0804F520 @ =0x02022CA8
	mov sb, r1
	movs r2, #0
	mov r8, r2
	ldr r3, _0804F524 @ =0x020234A8
	ldr r2, [sp, #0x2c]
	adds r2, #1
	lsls r4, r7, #1
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #1
	adds r1, r0, r3
	adds r5, r4, r1
	add r0, sb
	adds r6, r4, r0
	lsls r2, r2, #1
	adds r3, r2, r3
	adds r1, r4, r3
	add r2, sb
	adds r4, r4, r2
_0804F4A6:
	mov r0, r8
	strh r0, [r6]
	mov r2, ip
	ldrh r0, [r2, #0x1a]
	strh r0, [r5]
	mov r3, r8
	strh r3, [r4]
	ldrh r0, [r2, #0x1c]
	strh r0, [r1]
	adds r5, #4
	adds r6, #4
	adds r1, #4
	adds r4, #4
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804F4A6
_0804F4C8:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp]
	adds r2, r1, r3
	lsls r2, r2, #1
	ldr r4, _0804F520 @ =0x02022CA8
	adds r0, r2, r4
	movs r3, #0
	strh r3, [r0]
	ldr r5, [sp, #4]
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r0, r1, r4
	strh r3, [r0]
	ldr r0, _0804F524 @ =0x020234A8
	adds r2, r2, r0
	mov r3, ip
	ldrh r0, [r3, #0x18]
	strh r0, [r2]
	ldr r4, _0804F524 @ =0x020234A8
	adds r1, r1, r4
	ldrh r0, [r3, #0x1e]
	strh r0, [r1]
_0804F4F4:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F520: .4byte 0x02022CA8
_0804F524: .4byte 0x020234A8

