	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804DC64, 0x0804DC64 + 1
	.section .text.sub_804DC9C, "ax", %progbits
@ sub_804DC9C @ JP 0x0804DC9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804DC9C
	.thumb_func
sub_804DC9C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r5, #1
	adds r0, r5, #0
	bl sub_804DC64
	ldr r0, _0804DD3C @ =0x080DF1B6
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r1, #0
	ldrsh r6, [r4, r1]
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _0804DD40 @ =0x080DF166
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _0804DD44 @ =0x080DF17A
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _0804DD48 @ =0x080DF18E
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _0804DD4C @ =0x080DF1A2
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0804DD30
	adds r0, r7, #0
	bl sub_8002DE4
_0804DD30:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DD3C: .4byte 0x080DF1B6
_0804DD40: .4byte 0x080DF166
_0804DD44: .4byte 0x080DF17A
_0804DD48: .4byte 0x080DF18E
_0804DD4C: .4byte 0x080DF1A2

