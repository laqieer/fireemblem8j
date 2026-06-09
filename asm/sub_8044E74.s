	.syntax unified
	.set GetTacticianTextConf, 0x080444E4 + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set UpdateNameEntrySpriteDraw, 0x0804DB68 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_80446E4, 0x080446E4 + 1
	.set sub_8044BF0, 0x08044BF0 + 1
	.section .text.sub_8044E74, "ax", %progbits
@ sub_8044E74 @ JP 0x08044E74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8044E74
	.thumb_func
sub_8044E74:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	add r7, sp, #8
	adds r4, r0, #0
	mov r8, sp
	movs r0, #0x3c
	adds r0, r0, r4
	mov sb, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #4
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	add r6, sp, #8
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	bl GetTacticianTextConf
	adds r5, r0, #0
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8044BF0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _08044EC4
	movs r0, #3
	bl sub_8043190
_08044EC4:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl GetTacticianTextConf
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x3d
	adds r1, r6, #0
	bl SioStrCpy
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #1
	subs r0, #2
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_80446E4
	lsls r1, r0, #3
	adds r3, r1, r0
	ldr r6, [r4, #0x2c]
	ldrh r0, [r5, #0x30]
	subs r1, r0, #4
	ldrh r0, [r5, #0x32]
	adds r2, r0, #1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	str r0, [sp]
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	bls _08044F0C
	movs r0, #2
_08044F0C:
	str r0, [sp, #4]
	adds r0, r6, #0
	bl UpdateNameEntrySpriteDraw
	mov sp, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

