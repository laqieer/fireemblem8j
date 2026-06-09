	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80490C8, 0x080490C8 + 1
	.set sub_804F528, 0x0804F528 + 1
	.section .text.sub_80491B8, "ax", %progbits
@ sub_80491B8 @ JP 0x080491B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80491B8
	.thumb_func
sub_80491B8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0x38
	adds r0, r0, r6
	mov r8, r0
	movs r2, #0x3e
	adds r2, r2, r6
	mov sb, r2
_080491D2:
	lsls r0, r7, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r5, r5, r0
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r6, #0
	adds r4, #0x3e
	adds r4, r4, r0
	movs r0, #0
	ldrsh r2, [r4, r0]
	lsls r3, r7, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r3
	ldr r0, [r0]
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	ldr r3, _08049268 @ =0x085D3FA0
	bl PutSprite
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r1, #0x28
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r2, #8
	lsls r0, r7, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _0804926C @ =0x085D3F74
	bl PutSprite
	adds r7, #1
	cmp r7, #2
	ble _080491D2
	ldr r1, _08049270 @ =0x02000C04
	ldr r0, [r6, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_80490C8
	ldr r1, [r6, #0x44]
	lsls r1, r1, #1
	mov r2, r8
	adds r0, r2, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	add r1, sb
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r1, #8
	bl sub_804F528
	ldr r0, [r6, #0x50]
	cmp r0, #1
	bne _0804925A
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl sub_8002DE4
_0804925A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049268: .4byte 0x085D3FA0
_0804926C: .4byte 0x085D3F74
_08049270: .4byte 0x02000C04

