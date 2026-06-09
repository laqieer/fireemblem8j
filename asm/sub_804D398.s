	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_804D344, 0x0804D344 + 1
	.section .text.sub_804D398, "ax", %progbits
@ sub_804D398 @ JP 0x0804D398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D398
	.thumb_func
sub_804D398:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0804D4DC @ =0x000082C8
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, _0804D4E0 @ =0x085D4A44
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _0804D4E4 @ =0x080DF088
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldrb r0, [r5]
	cmp r0, #2
	bne _0804D3E2
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl sub_804D344
_0804D3E2:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r7, #0x2e]
	movs r0, #0x81
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804D4CE
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0804D416
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
_0804D416:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0804D422
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
_0804D422:
	bl sub_8000CD8
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0804D44A
	ldrh r1, [r7, #0x32]
	movs r2, #0x32
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _0804D43C
	adds r0, r1, #1
	strh r0, [r7, #0x32]
_0804D43C:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #0x34
	ble _0804D44A
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_0804D44A:
	movs r0, #0x2a
	ldrsh r5, [r7, r0]
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	adds r0, #0x4b
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, _0804D4E8 @ =0x085B8CFC
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	adds r0, #0x49
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, _0804D4EC @ =0x085B8D4C
	ldrh r0, [r7, #0x38]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r1, [r7, r3]
	adds r1, #0x50
	movs r0, #0x2c
	ldrsh r2, [r7, r0]
	adds r2, #9
	ldr r3, _0804D4F0 @ =0x085D4A58
	ldr r0, _0804D4F4 @ =0x0203DA20
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_0804D4CE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D4DC: .4byte 0x000082C8
_0804D4E0: .4byte 0x085D4A44
_0804D4E4: .4byte 0x080DF088
_0804D4E8: .4byte 0x085B8CFC
_0804D4EC: .4byte 0x085B8D4C
_0804D4F0: .4byte 0x085D4A58
_0804D4F4: .4byte 0x0203DA20

